重命名
#导入OneTwoThreeLib OT=OneTwo 输出OT中所有实例
import OneTwoThreeLib

class OT = M::OneTwo;


from OT ot
select ot

#遍历所有可能的整数 i 选择 succ(i) 的返回值 即输出2-10
int getSuccessor(int i) {
    result = i + 1 and
    i in [1 .. 9]
}

predicate succ = getSuccessor/1;

from int i
select succ(i)

#筛选所有小于10的
predicate isSmall(int i) {
    i in [1 .. 9]
}

predicate lessThanTen = isSmall/1;

from int i
where lessThanTen(i)
select i
