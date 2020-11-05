// 输入表示时间的整数，单位是秒。输出*天*小时*分*秒。如果时间单位前的数值是0，则不输出该时间单位的数值。

// 样例
// 3610
// 1小时10秒

using System;

namespace test {
    class Program {
        static void Main (string[] args) {
            int input = int.Parse (Console.ReadLine ()); // input = 3610
            System.DateTime dateTime = new System.DateTime (); // dateTime = {0001/1/1 星期一 0:00:00}
            dateTime = dateTime.AddSeconds (input); // dateTime = {0001/1/1 星期一 1:00:10}
            var day = dateTime.Day; // day = 1
            var hour = dateTime.Hour; // hour = 1
            var min = dateTime.Minute; // min = 0
            var sec = dateTime.Second; // sec = 10
            if (day > 1)
                Console.Write ("{0}天", day - 1);
            if (hour > 0)
                Console.Write ("{0}小时", hour);
            if (min > 0)
                Console.Write ("{0}分", min);
            if (sec > 0)
                Console.Write ("{0}秒", sec);
        }
    }
}