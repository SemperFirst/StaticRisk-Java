//A implies B等价于(!A) or (B) 结果是非2，6，10外的1-10的数字
class SmallInt extends int {
    SmallInt() { this = [1 .. 10] }
}

from SmallInt x
where  x % 2 = 0 implies x % 4 = 0
select x
