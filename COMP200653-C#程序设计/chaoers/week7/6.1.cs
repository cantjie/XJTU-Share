// 定义圆类Circle，包含半径r，属性R能判断半径r的合理性（r>=0），计算圆面积的方法double Area()。
// 从Circle类派生出圆柱体类Cylinder类，新增圆柱体的高h，属性H能判断高h的合理性（h>=0），新增计算圆柱体体积的方法double Volume()。
// 在主方法中，创建一个Cylinder对象，并输出该对象的底面半径，高以及体积。（要求：不使用构造方法，并且类中的域为私有，方法为公有）

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var cylinder = new Cylinder();
            cylinder.R = 2;
            cylinder.H = 3;
            Console.WriteLine("r:{0} area:{1} h:{2}", cylinder.R, cylinder.Area(), cylinder.Volume());
        }
    }

    class Circle
    {
        private double r;
        public double R
        {
            get
            {
                return r;
            }
            set
            {
                r = value >= 0 ? value : r;
            }
        }
        public double Area()
        {
            return Math.PI * r * r;
        }
    }
    class Cylinder : Circle
    {
        private double h;
        public double H
        {
            get
            {
                return h;
            }
            set
            {
                h = value >= 0 ? value : h;
            }
        }
        public double Volume()
        {
            return Area() * h;
        }
    }
}
