// 本实验2是基于实验1的基础，当用户根据系统的提示输入相应的字母时，系统根据用户的选择，输出相关信息。
// 具体要求：
// 当用户输入I时，系统输出 You are trying to input info
// 当用户输入O时，系统输出 You are trying to output info
// 当用户输入D时，系统输出 You are trying to make things ordered
// 当用户输入Q时，系统输出 You are about to quit

#include <stdio.h>

int main() {
    char input;
    scanf("%c", &input);

    switch(input) {
        case 'I':
            printf("You are trying to input info\n");
            break;
        case 'O':
            printf("You are trying to output info\n");
            break;
        case 'D':
            printf("You are trying to make things ordered\n");
            break;
        case 'Q':
            printf("You are about to quit\n");
            break;
        default:
            printf("unknown input\n");
            break;
    }

    return 0;
}

