// 编写一个函数int sum(int *p, int n)计算一组数据的和，在main函数中输入5个int型数并放入数组，调用sum函数计算并输出该5个数的和。

// 示例输入
// 1 3 5 7 9

// 示例输出
// 25

#include <stdio.h>

#define NUM 5

void sum(int *p, int len);

int main() {
    int i;
    int list[NUM];
    int len = NUM;
    for (i=0; i<NUM; i++) {
        scanf("%d", &list[i]);
    }

    sum(list, len);

    return 0;
}

void sum(int *p, int len) {
    int sum = 0;
    int i;
    for (i=0; i<len; i++) {
        sum += p[i];
    }
    printf("%d", sum);
}