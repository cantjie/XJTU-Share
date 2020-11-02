// 修改上题，增加Employee类的另一个派生类PieceWorker，表示计件工。PieceWorker类具有专用的实例变量wage和pieces分别表示每件的工资和生产的件数。在PieceWorker类中提供Earning方法的具体实现，计算员工的收入。计算方法是将件数乘以每件的工资。在主函数测试输出每种类型员工的收入。描述请参课本，本题编译通过即可。

using System;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            var employees = new PieceWorker("a", "b", DateTime.Parse("2000/1/1"), 1,2);
            employees.Earning();
        }
    }

    abstract class Employee
    {
        public string Name { get; set; }
        public string Department { get; set; }
        public DateTime BirthDate { get; set; }
        public Employee(string name, string department, DateTime birthDate)
        {
            Name = name;
            Department = department;
            BirthDate = birthDate;
        }
        public abstract double Price { get; set; }
    }

    class SalariedEmployee : Employee
    {
        public SalariedEmployee(string name, string department, DateTime birthDate) : base(name, department, birthDate){}
        public override double Price { get; set; }
    }

    class HourlyEmplyee : Employee
    {
        public double WorkTime { get; set; }
        public HourlyEmplyee(string name, string department, DateTime birthDate, double workTime) : base(name, department, birthDate) 
        {
            WorkTime = workTime;
        }
        public override double Price { get { return Price; } set { Price = WorkTime >= 40 ? WorkTime + (WorkTime - 40) * 2 : WorkTime; } }
    }
    class CommissionEmployee : Employee
    {
        public double Sales { get; set; }
        public CommissionEmployee(string name, string department, DateTime birthDate, double sales) : base(name, department, birthDate)
        {
            Sales = sales;
        }
        public override double Price { get { return Price; } set { Price = 0.5 * Sales; } }
    }
    class BasePlusCommissionEmployee : CommissionEmployee
    {
        public BasePlusCommissionEmployee(string name, string department, DateTime birthDate, double sales) : base(name, department, birthDate, sales){}
        public override double Price { get { return Price; } set { Price = (0.4 * Sales + 10)*1.1; } }
    }
    class PieceWorker : Employee
    {
        public double Wage { get; set; }
        public int Pieces { get; set; }
        public override double Price { get { return Price; } set { Price = Wage * Pieces; } }
        public void Earning()
        {
            Console.WriteLine(Pieces);
        }
        public PieceWorker(string name, string department, DateTime birthDate, double wage, int piece) : base(name, department, birthDate) 
        {
            Wage = wage;
            Pieces = piece;
        }
    }
}
