/**
 * predicate 表示当前方法没有返回值。
 * exists子查询，是CodeQL谓词语法里非常常见的语法结构，它根据内部的子查询返回true or false，来决定筛选出哪些数据。
 * 谓词封装
 */
import java

predicate isStudent(Method method){
    exists(|method.hasName("getStudent"))
}
from Method method
where isStudent(method)
select method.getName(), method.getDeclaringType()
// 封装函数 