// 输入字符串1和字符串2，如果两个字符串相同，输出0；如果字符串1大于字符串2，输出1；如果字符串1小于字符串2，输出-1。比如：

// 输入：

// hello

// world

// 则输出：-1

// 输入：

// world

// hello

// 则输出1

// 输入：

// hello

// hello

// 则输出：0

#include <stdio.h>

int main() {
    char str1[100], str2[100];
    gets(str1);
    gets(str2);
    int i = 0;
    while ((str1[i]==str2[i])&&(str1[i]!='\0')) {
        i ++;
    }
    if (str1[i] == str2[i]) {
        printf("0");
    }
    else if(str1[i]-str2[i] > 0) {
        printf("1");
    }
    else {
        printf("-1");
    }

    return 0;
}