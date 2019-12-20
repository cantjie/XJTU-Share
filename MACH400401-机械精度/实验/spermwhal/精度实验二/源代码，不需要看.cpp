#include <iostream>
#include <cstring>
using namespace std;

float input(char *p);

float input(char *p) 
{
	printf(p);
	float result;
	cin>>result;
   return result; 
}

int main()
{
float x1,y1,x2,y2,k,b,b2,x3,y3,f1,xh,xl,yh,yl,bh,bl,f2;
printf("a");
printf("请一定照着我的照片看，不然可能不知道这些点是什么点\n\n");
printf("x代表测点序号，y代表测出的数值\n\n");
printf("求两点间直线，即基准线L\n\n");
x1 = float(input("请输入x1="));
y1 = float(input("\n请输入y1="));
x2 = float(input("\n请输入x2="));
y2 = float(input("\n请输入y2="));
if (x1 == x2 and y1 == y2)
    printf("\n请输入两个不同的点\n");
if (x1==x2)
    {
	printf("直线斜率不存在\n\n");
    printf("求得的基准线L为x=%f\n\n",x1);
	}
else
	{
  	k = (y1 - y2) / (x1 - x2);
    b = y1 - k*x1 ;
    printf("\n\n求得的基准线L为 y = %f x + %f\n\n' ",k,b);
	}
printf(" 求平行线L'，在下面输入过平行线的点\n\n");
x3 = float(input("\n请输入x3="));
y3 = float(input("\n请输入y3="));
b2 = y3 - k*x3;
f1 = (b - b2)*1000;
printf("\n求得的平行线L’为y=%f x + %f\n\n" , k,b2);
printf("直线度误差为 %f um \n\n", f1);

printf("求另一导轨的平行度’，在下面过平行线的点上下两个点，h为高，l为低\n\n");
xh = float(input("请输入xh="));
yh = float(input("\n请输入yh="));
xl = float(input("\n请输入xl="));
yl = float(input("\n请输入yl="));
bh = yh - k*xh;
bl = yl - k*xl;
f2 = 1000*(bh - bl);
printf("\n求得的平行线L1’为y=%f x + %f\n\n" ,k,bh);
printf("求得的平行线L2’为y=%f x + %f\n\n" ,k,bl);
printf("平行度误差为 %f um",f2);
printf("\n收工回家o(*￣▽￣*)ブ");
cin.get(); 
}

