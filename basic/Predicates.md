#结果为2
import java

predicate isSmall(int i) {
    i in [1 .. 9]
}

#空集
from int x
where x = 2  and isSmall(x) //x = 10
select x 

#输出shahai
import java

string getANeighbor(string country) {
    country = "France" and result = "Belgium"
    or
    country = "France" and result = "Germany"
    or
    country = "Germany" and result = "Austria"
    or
    country = "Germany" and result = "Belgium"
    or
    country = "shahai" and  result = "beij"
    or
    country = getANeighbor(result)
}

select 
getANeighbor("beij") 
