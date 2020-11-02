// 设计一个汽车类Vehicle，包含的数据成员有车轮个数wheels和车重weight。
// 以及带有这两个参数的构造方法，具有Run方法，Run中方法输出running字样。
// 小车类Car是它的子类，其中增加了数据成员车载人数passenger_load。
// Car类中有带参数的构造方法，重写Run方法：输出Car is running。并重写ToString()方法：显示car中信息（显示车轮数、车重、车载人数）。
// 最后编写主方法，定义car的对象，并调用Run方法，以及显示car中信息。 

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var car = new Car(4, 1000, 5);
            car.Run();
            Console.WriteLine(car.ToString());
        }
    }

    class Vehicle
    {
        public int Wheels { get; set; }
        public double Weight { get; set; }
        public Vehicle(int wheels, double weight)
        {
            Wheels = wheels;
            Weight = weight;
        }
        public virtual void Run()
        {
            Console.WriteLine("running");
        }
    }

    class Car : Vehicle
    {
        public int Passenger_load { get; set; }
        public Car(int wheels, double weight, int passenger_load) : base(wheels, weight)
        {
            Passenger_load = passenger_load;
        }
        public override void Run()
        {
            Console.WriteLine("Car is running");
        }
        public override string ToString()
        {
            return String.Format("{0}, {1}, {2}", Wheels, Weight, Passenger_load);
        }
    }
}
