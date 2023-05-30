// 有一段文字，其中有若干整数。编写函数，找出其中的整数，存入一个数组中。

// 函数原型为：
// int findint(char *s,int *a);
// 其中s表示带数字的字符串，a表示存整数的数组，返回值为字符串中的整数个数。字符串中只有正整数。

// 编写主函数，输入字符串，调用函数识别整数，逆序输出它们。例如，输入字符串“The Wandering Earth exhibition at the China Science and Technology Museum in Beijing, April 4, 2019.”识别数字，输出“2019,4”。

// 输入：带空格字符串
// 输出：若干整数，用逗号隔开。

// 【输入输出样例】
// 输入：
// he Wandering Earth exhibition at the China Science and Technology Museum in Beijing, April 4, 2019.

// 输出：
// 2019,4

// 题目延伸：（1）如果字符串中有负整数，如何修改程序。（2）如果字符串中是实数，如何编写程序。

#include <stdio.h>
#include <stdlib.h>

int findint(char *s, int *a);

int main() {
    char str[1000];
    int nums[100], count, i;

    // 读入字符串
    fgets(str, sizeof(str), stdin);

    // 查找整数并存入数组
    count = findint(str, nums);

    // 逆序输出整数
    for (i = count-1; i >= 0; i--) {
        printf("%d", nums[i]);
        if (i > 0) {
            printf(",");
        }
    }

    return 0;
}

// 查找字符串中的整数，存入数组中，并返回整数个数
int findint(char *s, int *a) {
    int i, j, k = 0, num, count = 0;
    char *p = s;

    // 遍历字符串
    for (i = 0; p[i] != '\0'; i++) {
        // 如果当前字符是数字，记录下来
        if (p[i] >= '0' && p[i] <= '9') {
            num = 0;
            for (j = i; p[j] >= '0' && p[j] <= '9'; j++) {
                num = num * 10 + p[j] - '0';
            }
            // 存入数组
            a[k++] = num;
            count++;
            // 跳过已经记录的数字
            i = j - 1;
        }
    }

    return count;
}
