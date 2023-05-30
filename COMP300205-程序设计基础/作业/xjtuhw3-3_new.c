// 编写函数将整数k变换为一个字母串，规则如下：设0对应A，1对应B，......，25对应Z。从左向右考察k的各位数字，若连续两位对应上面一种变换，则直接换掉两位数字，否则一位数字换成对应的字母。变换结果存入res反馈给调用者。函数原型为：
// void DigiTran( int k, char res[] );

// 在主函数输入一些非负整数，最后输入-1代表结束，利用上面函数对每个数字变换后输出。

// 示例输入：(数字间空一格)
// 12 3925 0 -1

// 示例输出：(每个字符串后面空一格)
// M DJZ A

#include <stdio.h>
#include<string.h>

#define LEN_STR 10
#define MAX_DIGIT 10

void DigTran(int k, char res[]);

int main() {
    char res[LEN_STR];
    // scan k from stdin & print str
    int k;
    scanf("%d", &k);
    while(k != -1) {
        DigTran(k, res);
        printf("%s ", res);
        scanf("%d", &k);
    }
    return 0;
}

void DigTran(int k, char res[]) {
    // initialize the res
    strcpy(res, "\0");
    // take each digit
    char digits[MAX_DIGIT];
    sprintf(digits, "%d", k);
    // transform to str
    int i = 0;
    while (digits[i] != '\0') {
        if (digits[i+1] != '\0') {
            if ((digits[i]-'0')*10+digits[i+1]-'0' < 26) {          //"12" -> (digits[i]-'0')*10+digits[i+1]-'0' -> 12
                strcat(res, (char[2]){'A'+(digits[i]-'0')*10+digits[i+1]-'0', '\0'});
                i +=2;
            }
            else {
                strcat(res, (char[2]){'A'+digits[i]-'0', '\0'});
               i ++;
            }
        }
        else {
            strcat(res, (char[2]){'A'+digits[i]-'0', '\0'});
            i ++;
        }
    }
}