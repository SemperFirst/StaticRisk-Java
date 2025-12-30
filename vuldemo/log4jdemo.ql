/**
 * @name Potential Log4J JNDI injection (CVE-2021-44228)
 * @description Building Log4j log entries from user-controlled data may allow
 *              attackers to inject malicious code through JNDI lookups when
 *              using Log4J versions vulnerable to CVE-2021-44228.
 * @kind path-problem
 * @problem.severity error
 * @precision high
 * @id java/log4j-injection
 * @tags security
 *       experimental
 *       external/cwe/cwe-020
 *       external/cwe/cwe-074
 */

import java
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.dataflow.TaintTracking
import DataFlow::PathGraph

class Log4jMessageSink extends DataFlow::ExprNode {
  Log4jMessageSink() {
    exists(MethodAccess ma, Method m |
      ma.getMethod() = m and
      this.asExpr() = ma.getAnArgument() and
      m.getDeclaringType()
          .hasQualifiedName("org.apache.logging.log4j", ["Logger", "LogBuilder"]) and
      m.hasName([
          "atDebug", "atError", "atFatal", "atInfo", "atTrace", "atWarn", "debug", "error",
          "fatal", "info", "trace", "warn", "log"
        ]) and
      // 参数位置通常是消息参数（第一个或唯一字符串参数）
      ma.getNumArgument() = 1 or
      ma.getArgument(0).getType() instanceof TypeString
    )
  }
}

class Log4jInjectionConfig extends TaintTracking::Configuration {
  Log4jInjectionConfig() { this = "Log4jInjectionConfig" }

  override predicate isSource(DataFlow::Node source) { source instanceof RemoteFlowSource }

  override predicate isSink(DataFlow::Node sink) { sink instanceof Log4jMessageSink }
}

from DataFlow::PathNode source, DataFlow::PathNode sink, Log4jInjectionConfig conf
where conf.hasFlowPath(source, sink)
select sink.getNode(), source, sink,
  "Potential Log4Shell vulnerability: user-controlled data flows to Log4j log message."
