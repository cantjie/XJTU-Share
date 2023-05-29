// 编写函数，将字符串s1中从第n个字符开始的最多k个字符复制到字符串s2中。

// 最多的意思是如果s1从n开始的字符不够k个，则复制到末尾为止。如s1="study",n=4,k=5,则只复制“dy”两个字符。函数返回s2的首地址。

// 函数原型为：
// char * copykn(char *s1,char *s2,int n,int k)

// 编写主函数，输入字符，n和k，调用函数复制，输出结果字符串。主函数为：
// int main()
// {
// char s1[100],s2[100];
// int n,k;
// gets(s1);
// scanf("%d %d",&n,&k);
// puts(copykn(s1,s2,n,k));
// return 0;
// }

// 【输入输出样例】
// 输入:
// communication
// 2 3

// 输出:
// omm

#include <stdio.h>
#include <string.h>

char* copykn(char* str1, char* str2, int n, int k);

int main() {
    char str1[100], str2[100];
    int i;
    for (i=0; i<100; i++) {
        str2[i] = '\0';
    }
    int n, k;
    scanf("%s", str1);
    scanf("%d %d", &n, &k);
    printf("%s", copykn(str1, str2, n, k));

    return 0;  
}

char* copykn(char* str1, char* str2, int n, int k) {
    // traversal str1 to gain its len
    int i = 0;
    while (str1[i] != '\0') {
        i ++;
    }
    int len = i-1;
    // categorized discussion
    if (len-n >= k) {
        memcpy(str2, str1+(n-1)*sizeof(char), k*sizeof(char));
    }
    else {
        memcpy(str2, str1+(n-1)*sizeof(char), len-(n-2)*sizeof(char));
    }
    // return
    return str2;
}