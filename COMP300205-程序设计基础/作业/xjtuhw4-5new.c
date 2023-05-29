// 字符串排序，就像单词的字典排序。'a'<'b'等等。

// 编写函数，实现字符串的排序(从小到大)，不区分大小写。

// 函数原型为：
// void sortstring(char **r,int n);
// 其中r表示字符串首地址数组的首地址，n表示字符串个数。字符串的首地址放在字符指针数组中，r是这个指针数组的首地址。

// 编写主函数，输入n和n个单词，调用函数排序，在主函数中输出排序的单词，每个一行。每个单词的长度不超过20个字符。

// 【输入输出样例】
// 输入：
// 5
// study
// student
// sting
// STRING
// STRAY

// 输出：
// sting
// STRAY
// STRING
// student
// study

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define WORD_LEN 20

void sortstring(char** words, int n);
int strcmp_switch (char* word1, char* word2);

int main() {
    // input words
    int n;
    scanf("%d", &n);
    int i;
    char** words = (char**)malloc(sizeof(char*)*n);
    for (i=0; i<n; i++) {
        char* t_word = (char*)malloc(sizeof(char)*(WORD_LEN+1));
        scanf("%s", t_word);
        words[i] = t_word;
    }

    // sort
    sortstring(words, n);  

    // free
    for (i=0; i<n; i++) {
        free(words[i]);
    }
    free(words);

    return 0;
}


void sortstring(char** words, int n) {
    int i, j;
    for (i=0; i<n-1; i++) {
        for (j=0; j<n-i-1; j++) {
            if (strcmp_switch(words[j], words[j+1]) > 0) {
                // swap 
                char *tmp = words[j];
                words[j] = words[j+1];
                words[j+1] = tmp;
            }
        }
    }
    for (i=0; i<n; i++) {
        printf("%s\n", words[i]);
    }
}

int strcmp_switch (char* word1, char* word2) {
    int i, j;
    char words_mirror[2][WORD_LEN+1];
    strcpy(words_mirror[0], word1);
    strcpy(words_mirror[1], word2);

    for (i=0; i<2; i++) {
        j = 0;
        while (words_mirror[i][j] != '\0') {
            if (words_mirror[i][j]<='Z' && words_mirror[i][j]>='A') {
                words_mirror[i][j] = words_mirror[i][j] + ('a'-'A');
            }  
            j++;
        }
    }

    return strcmp(words_mirror[0], words_mirror[1]);   
}