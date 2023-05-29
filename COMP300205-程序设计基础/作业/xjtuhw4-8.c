// 编写程序，输入一个日期和一个正整数k，计算k天以后是哪天。例如，输入的日期为2019年4月15日，k为16，则2019年4月15日的16天后是2019年5月1日，输出2019-5-1。

// 输入：四个整数，前三个分别表示年、月、日 ，后一个标识天数k。

// 输出：k天之后的日期，数据间用英文减号隔开。

// 【输入输出样例】
// 输入：
// 2019 4 15 16

// 输出：
// 2019-5-1

// 提示：
// （1）日期用结构体。
// （2）先考虑加1天的函数。
// （3）函数可以返回结构体。
// （4）主函数如下：
// int main()
// {
// DATE d1,d2;
// int k;
// scanf("%d %d %d",&d1.year,&d1.month,&d1.day);
// scanf("%d",&k);
// d2=adddays(d1,k);
// print(d2);
// return 0;
// }

#include <stdio.h>

typedef struct {
    int year;
    int month;
    int day;
} DATE;

DATE adddays(DATE d1, int k);
void print(DATE d2);
int IsLeap(int year);

int main() {
    DATE d1,d2;
    int k;
    scanf("%d %d %d", &d1.year, &d1.month, &d1.day);
    scanf("%d", &k);
    d2 = adddays(d1, k);
    print(d2);

    return 0;
}

DATE adddays(DATE d1, int k) {
    DATE d2 = d1;
    int day_num_of_m[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
    if (IsLeap(d1.year)) {  // judge if leap year
        day_num_of_m[2] = 29;
    }  
    int i;  // do k times
    for (i=0; i<k; i++) {
        if (d2.month == 12 && d2.day == day_num_of_m[d2.month]) {   // if it will beyond the year
            d2.year += 1;
            d2.month = 1;
            d2.day = 1;
        }
        else if (d2.day == day_num_of_m[d2.month] && d2.month != 12) {  // if it's the last day of the month
            d2.month += 1;
            d2.day = 1;
        }
        else {          // normal day
            d2.day += 1;        
        }
    }
    
    return d2;
}

void print(DATE d2) {
    printf("%d-%d-%d", d2.year, d2.month, d2.day);
}

int IsLeap(int year) {
    int is_leap;
    if ((year%4==0 && year%100!=0) || (year%400==0)) {
        is_leap = 1;
    }
    else {
        is_leap = 0;
    }

    return is_leap;
}