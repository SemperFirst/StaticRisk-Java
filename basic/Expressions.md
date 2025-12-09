// 返回c={1} c.getANumber()=3
class A extends int {
    A() { this = 1 }
    int getANumber() { result = 2 }
}

class B extends int {
    B() { this = 1 }
    int getANumber() { result = 3 }
}

class C extends A, B {
  // Need to define `int getANumber()`; otherwise it would be ambiguous
    override int getANumber() {
        result = B.super.getANumber()
    }
}

from C c
select c, c.getANumber()

// x=-5时 y=-5｜5 合并去重后-5到5不含0
from int x
where x in [-5 .. 5] and x != 0
select unique(int y | y = x or y = x.abs() | y)

// i属于0-4 j属于0-5  i,j 有5*6=30种情况 求i的和 共计60
select sum(int i, int j | exists(string s | s = "hello".charAt(i)) and exists(string s | s = "world!".charAt(j)) | i)


// 筛选出所有 继承 List 或 实现 List 接口 的类。
import java
from Type t
where t.(Class).getASupertype().hasName('List')
select t
