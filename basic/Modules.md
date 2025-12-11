#test.ql
import OneTwoThreeLib
import M

from OneTwoThree ott, OneTwo ot
where ott = 1 or ott = 2 
select ott, ot.getAString()

#OneTwoThreeLib.qll
class OneTwoThree extends int {
    OneTwoThree() {
        this = 1 or this = 2 or this = 3
    }
}
module M {
    class OneTwo extends OneTwoThree {
        OneTwo() {
            this = 1
            or this = 2
        }
            string getAString() {
        // member predicate
            result = "One, two or three: " + this.toString()
        }
    }
}

#输出结果
1 | One, two or three: 1
1 | One, two or three: 2
2 | One, two or three: 1
2 | One, two or three: 2
