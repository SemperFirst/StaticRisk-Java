/**
 * Method:方法类，Method method表示获取当前项目中所有的方法
 * MethodAccess:方法调用类，MethodAccess call表示获取当前项目当中的所有方法调用
 * Parameter:参数类，Parameter表示获取当前项目当中所有的参数
 */
import java
from Method method
where method.hasName("getStudent")
select method.getName(), method.getDeclaringType()
// 获取有方法名是getStudent的类