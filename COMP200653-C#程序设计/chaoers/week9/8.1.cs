// 设计4个类：人、明星、歌星、影星。其中，人包含姓名、年龄；而明星继承自人，包含从事领域（如电影、唱歌、电视...）、出道时间；歌星则继承自明星，包含代表作品。
// 人这个类要求提供4个构造函数，一个无参数、一个有两个参数、另两个有一个参数。其它类中同样要求至少实现一个有参数的构造函数。
// 设计一个接口，其中包含方法Speak()。
// 通过接口实现Speak，输出详细的介绍自己的所有信息（不同类介绍不同，如对明星来说，介绍为：我叫王大锤，今年22岁。我从事歌唱事业，出道于2018年8月8日。对于歌星来说，在上句话的基础上，还应该增加一句，我的代表作品是万万没想到）。
// 实例化明星、歌星、影星；并完成上述输入输出。
// 要求完成年龄、出道时间的合法性检测。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var wang = new SingerStar("王大锤", DateTime.Parse("2018/8/8"), 22, "万万没想到");
            Console.WriteLine("我叫{0}，今年{1}岁。我从事{2}事业，出道于{3}。我的代表作品是{4}", wang.Name, wang.Age, wang.Field, wang.Birth, wang.Work);
        }
    }

    class People
    {
        public string Name { get; set; }
        public DateTime Birth { get; set; }
        public int Age { get; set; }
        public People()
        {

        }
        public People(string name)
        {
            Name = name;
        }
        public People(DateTime bir)
        {
            Birth = bir;
        }
        public People(int age)
        {
            Age = age;
        }
        public People(string name, DateTime bir, int age)
        {
            Name = name;
            Birth = bir;
            Age = age;
        }
    }

    class Star : People
    {
        public string Field { set; get; }
        public Star(string name, DateTime bir, int age, string field) : base(name, bir, age)
        {
            Field = field;
        }
    }

    class SingerStar : Star
    {
        public string Work { set; get; }
        public SingerStar(string name, DateTime bir, int age, string work) : base(name, bir, age, "singer")
        {
            Work = work;
        }
    }

    class MovieStar : Star
    {
        public string Work { set; get; }
        public MovieStar(string name, DateTime bir, int age, string work) : base(name, bir, age, "movie")
        {
            Work = work;
        }
    }
}
