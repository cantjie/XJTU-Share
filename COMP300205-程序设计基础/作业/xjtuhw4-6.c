// 定义表示平面点的结构体类型，成员有x坐标和y坐标，数据类型用float。定义计算两个点的距离的函数，计算两个平面点的距离，返回float。主函数中定义两个平面点的结构体变量，输入点的坐标，调用函数求距离，显示它们的距离(输出%f)。

// 输入：四个实数，前两个表示一个点的x,y坐标；后两个表示另一个点的x,y坐标.
// 输出：两个点的距离。

// 注意，距离函数的参数是结构体类型！！！

// 【输入输出样例】
// 输入：
// 2 2 1 1
// 输出：
// 1.414214

#include <stdio.h>
#include <math.h>

#define DOTS_NUM 2

typedef struct {
    float x;
    float y;
} Dot;

float distance(Dot* dot1, Dot* dot2);

int main() {
    // input 2 dots
    int i;
    Dot dot1, dot2;
    Dot* dot_list[DOTS_NUM] = {&dot1, &dot2};
    for (i=0; i<DOTS_NUM; i++) {
        scanf("%f %f", &dot_list[i]->x, &dot_list[i]->y);
    }

    // calculate the distance & print
    printf("%f", distance(dot_list[0], dot_list[1]));
    
    return 0;
}

float distance(Dot* dot1, Dot* dot2) {
    return sqrt(pow(dot1->x - dot2->x, 2) + pow(dot1->y - dot2->y, 2));
}