// 用户从键盘依次输入6种农副产品的信息，编写程序按照销售额由小到大的顺序输出各个农副产品的信息。

// 要求：
// （1）定义农副产品信息的结构体fruitinfo，包括产品编号（正整数），产品名称（由不含空格的26个英文字母的大小写构成，不超过20个字符）、销量及单价，其中销量和单价是浮点数；
// （2）定义void set( struct fruitinfo *t )函数，用来输入一种农副产品的数据；
// （3）定义void print( struct fruitinfo *t )函数，用来输出一种农副产品的数据（其中浮点数保留小数点后2位）；
// （4）定义void sortfruit( struct fruitinfo *t )函数，用来对所有农副产品按照销售额（销售额等于单价乘以销量）从小到大排序（销售额相同时保持原来顺序）；
// （5）在主函数中调用set、sortfruit和print函数。

// 示例输入
// 1001 Apple 300.5 2.0
// 1002 Banana 100.5 3.5
// 1003 Lemon 205.2 2.5
// 1004 cherry 70.65 16.2
// 1005 grape 500.62 6.6
// 1006 orange 10000.2 5.15

// 示例输出（各数据项用英文空格隔开，数值数据保留两位小数，每行最后一个数据项没有空格）
// 1002 Banana 100.50 3.50
// 1003 Lemon 205.20 2.50
// 1001 Apple 300.50 2.00
// 1004 cherry 70.65 16.20
// 1005 grape 500.62 6.60
// 1006 orange 10000.20 5.15

#include <stdio.h>
#include <string.h>
#define MAX_FRUITS 6

typedef struct {
    int id;
    char name[21];
    float sales;
    float price;
    float revenue;
} FruitInfo;

void set(FruitInfo *t);
void print(FruitInfo *t);
void sortfruit(FruitInfo *t);

int main() {
    FruitInfo fruits[MAX_FRUITS];
    int i;

    // 输入各种农副产品的信息
    for (i = 0; i < MAX_FRUITS; i++) {
        set(&fruits[i]);
    }

    // 对所有农副产品按照销售额排序
    sortfruit(fruits);

    // 输出排序后的农副产品信息
    for (i = 0; i < MAX_FRUITS; i++) {
        print(&fruits[i]);
    }

    return 0;
}

// 输入一种农副产品的数据
void set(FruitInfo *t) {
    scanf("%d %s %f %f", &t->id, t->name, &t->sales, &t->price);
    t->revenue = t->sales * t->price; // 计算销售额
}

// 输出一种农副产品的数据
void print(FruitInfo *t) {
    printf("%d %s %.2f %.2f\n", t->id, t->name, t->sales, t->price);
}

// 对所有农副产品按照销售额从小到大排序
void sortfruit(FruitInfo *t) {
    int i, j;
    FruitInfo temp;

    for (i = 0; i < MAX_FRUITS-1; i++) {
        for (j = i+1; j < MAX_FRUITS; j++) {
            if (t[i].revenue > t[j].revenue) {
                temp = t[i];
                t[i] = t[j];
                t[j] = temp;
            }
        }
    }
}
