// 从点类（Point）派生除一个线段类（Line），计算线段的长度。
// 其中，Point中包含以下方法，如带可选参数的构造方法Point（int x=0, int y=0),输出坐标点的方法ShowPoint以及读写坐标x、y的属性方法。
// Line类中新增表示线段终点的字段EndPoint，计算线段距离的方法Distance以及输出线段起点和终点的方法ShowLine。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var line = new Line();
        }
    }

    class Point
    {
        public int X { get; set; }
        public int Y { get; set; }
        public Point(int x = 0, int y = 0)
        {
            X = x;
            Y = y;
        }
        public int[] ShowPoint()
        {
            return new int[] { X, Y };
        }
    }
    class Line : Point
    {
        private Point EndPoint = new Point();
        public double Distance()
        {
            return Math.Sqrt((EndPoint.X - X) * (EndPoint.X - X) + (EndPoint.Y - Y) * (EndPoint.Y - Y));
        }
        public int[][] ShowLine()
        {
            return new int[][] { ShowPoint(), EndPoint.ShowPoint() };
        }
    }
}
