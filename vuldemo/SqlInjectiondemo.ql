/**
 * @id java/examples/vuldemo
 * @name Sql-Injection
 * @description Sql-Injection
 * @kind path-problem
 * @problem.severity warning
 */
import java
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.security.QueryInjection
import semmle.code.java.dataflow.DataFlow


class VulConfig extends TaintTracking::Configuration {
    VulConfig() {this = "SqlInjectionConfig"}
    override predicate isSource(DataFlow::Node src){src instanceof RemoteFlowSource}
    override predicate isSink(DataFlow::Node sink){
        exists(Method method, MethodAccess call|method.hasName("query")
        and
        call.getMethod() = method and
        sink.asExpr() = call.getArgument(0))
    }
}

from VulConfig config, DataFlow::PathNode sink,DataFlow::PathNode source
where config.hasFlowPath(source, sink)
select source.getNode(),source,sink,"source"