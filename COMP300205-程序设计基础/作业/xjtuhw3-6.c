// 使用递归函数方法，将一个非负整数n转换成逆序的字符串。例如：输入483，应输出字符串"384"。n的位数不确定，可以是任意位数的整数。

// 输入：输入非负整数n（n的位数不超过int上限）
// 输出：输出一个字符串。

// 【输入输出样例】
// 输入：
// 483
// 输出：
// 384

// 注意，本题要实现整数转字符串。投机取巧不得分。

// 提示1：函数参考原型：
// void myint2str(int a,char s[]，int k);
// 将a转换为逆序字符串后放在s中。注意末尾加结束符。k是s中当前可放置字符的下标。

// 提示2：递归思想 ，如果是1位数，tmp=a+'0'即是字符，存入s[k]，后面再放结束符，结束。
//     如果不是一位数，获取个位数字，转换为字符，放入s[k];注意a=a/10去掉原个位，还是一个整数转字符串的问题，可以递归了。

#include <stdio.h>
#include <string.h>

#define MAX_LEN 9

void reverse(char nums[], int len);

int main() {
    // input the int and get the digits
    int num;
    scanf("%d", &num);
    char nums[MAX_LEN];
    sprintf(nums, "%d", num);
    int len = strlen(nums);

    // reverse
    reverse(nums, len);

    // print
    printf("%s", nums);

    return 0;
}

void reverse(char nums[], int len) {
    char tmp[MAX_LEN];
    int i;
    int cnt = 0;
    for (i=len-1; i>=0; i--) {
        tmp[cnt] = nums[i];
        cnt++;
    }
    tmp[cnt] = '\0';
    strcpy(nums, tmp);
}