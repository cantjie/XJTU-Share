// 定义一个宠物类。基类是Aminal是个抽象类，包含名字、年龄、体重。构造函数初始化3个字段。属性能够检测出年龄是大于0的才合法。

// Eat()方法用于修改体重字段（体重增加+1）。抽象方法方法跑Run()。

// 派生类Cat，新增字段：体长，构造函数初始化。重写方法跑Run()（显示“XX(姓名)正在跑！”字样）。

// 派生类Bird, 新增字段：羽毛颜色，构造函数初始化。

// 重写方法Run()表示鸟不会跑只会飞。 在主函数中测试宠物类方法。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var cat = new Cat("a", 5, 6, 7);
            cat.Run();
            var bird = new Bird("a", 5, 6, "yellow");
            bird.Run();
        }
    }

    abstract class Aminal
    {
        public string Name { get; set; }
        private double weight;
        public double Weight
        {
            get
            {
                return weight;
            }
            set
            {
                weight = value >= 0 ? value : weight;
            }
        }
        private int age;
        public int Age
        {
            get
            {
                return age;
            }
            set
            {
                age = value >= 0 ? value : age;
            }
        }
        public void Eat()
        {
            weight++;
        }
        abstract public void Run();
    }
    class Cat : Aminal
    {
        private double length;
        public double Length
        {
            get
            {
                return length;
            }
            set
            {
                length = value >= 0 ? value : length;
            }
        }
        override public void Run() 
        {
            Console.WriteLine("{0}正在跑!", Name);
        }
        public Cat(string name, double weight, int age, double length)
        {
            Name = name;
            Weight = weight;
            Age = age;
            Length = length;
        }
    }
    class Bird : Aminal
    {
        public string Color { get; set; }
        public Bird(string name, double weight, int age, string color)
        {
            Name = name;
            Weight = weight;
            Age = age;
            Color = color;
        }
        public override void Run()
        {
            Console.WriteLine("cannot run");
        }
    }
}
