// 设有一篇文章，有3行文字，每行不超过80个字符。请统计出该文的大写字母、小写字母、数字、空格以及其他字符的个数。
// 输入：三行英文文字，可能有空格及数字、标点等符号。
// 输出：5个整数，用空格隔开，分别表示大写字母、小写字母、数字、空格以及其他字符的个数。

// 【输入输出样例】
// 输入：
// year 2019
// Month 3
// DAY 20!

// 输出：
// 4 8 7 3 1

#include <stdio.h>
#include <string.h>

int main() {
    char str1[3*80], str2[80], str3[80];

    gets(str1); gets(str2); gets(str3);
    strcat(str1, str2);
    strcat(str1, str3);
    int len = strlen(str1);
    int i, cnt_cap=0, cnt_low=0, cnt_num=0, cnt_space=0, cnt_others=0;
    for (i=0; i<len; i++) {
        if (str1[i]<='Z' && str1[i]>='A') {
            cnt_cap ++;
        }
        else if (str1[i]<='z' && str1[i]>='a') {
            cnt_low ++;
        }
        else if (str1[i]<='9' && str1[i]>='0') {
            cnt_num ++;
        }
        else if (str1[i] == ' ') {
            cnt_space ++;
        }
        else {
            cnt_others ++;
        }
    }
    printf("%d %d %d %d %d", cnt_cap, cnt_low, cnt_num, cnt_space, cnt_others);

    return 0;
}