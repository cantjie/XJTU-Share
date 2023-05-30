// 编写程序，输入一段文本，统计其中各单词出现的次数（单词不区分大小写），输出频率最高的前十个单词及其出现次数。若次数相同，按字典序排序。

// 输入：
// 一段文本

// 输出：
// 每行是一个单词及出现次数，中间用一个英文冒号隔开，单词以小写形式出现。

// 【输入输出样例】
// 输入：
// Xi boarded the destroyer Xining on Tuesday afternoon after inspecting the honor guards of the PLA Navy at a pier in the city of Qingdao

// 输出：
// the:4
// of:2
// a:1
// after:1
// afternoon:1
// at:1
// boarded:1
// city:1
// destroyer:1
// guards:1

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_WORD 100   // suppose that number of words in sentence is up to 100
#define MAX_WORD_LEN 25  // suppose that number of char in a word is up to 50

typedef struct {
    char word[MAX_WORD_LEN];
    int freq;
}WORD_INFO;

int main() {
    // input a sentence
    char word_list[MAX_WORD][MAX_WORD_LEN];
    int i=0;
    int j;
    while (scanf("%s", &word_list[i])==1) {
        int len_tmp = strlen(word_list[i]);
        for(j=0; j<len_tmp; j++) {
            if (word_list[i][j]>='A' && word_list[i][j]<='Z') {
                word_list[i][j] += 'a' - 'A';
            }
        }
        i ++;
    }
    int cnt_word=i;

    // analyze the words
        // create an array to store the freq of every words 
       int *freq = (int*)malloc(cnt_word*sizeof(int));
       for (i=0; i<cnt_word; i++) {
         freq[i] = 1;
       }
        // change the freq of the second same word to -1
    for (i=0; i<cnt_word; i++) {
        if (freq[i] == 1) {
            for (j=1+i; j<cnt_word; j++) {
                if (strcmp(word_list[i], word_list[j]) == 0) {
                    freq[i] ++;
                    freq[j] = -1;
                }
            }
        }
    }
        // create a list to store the word and freq of itself
    WORD_INFO analysis[MAX_WORD];
    int cnt_final = 0;
    for (i=0; i<cnt_word; i++) {
        if (freq[i] != -1) {
            analysis[cnt_final].freq = freq[i];
            strcpy(analysis[cnt_final].word, word_list[i]);
            cnt_final ++;
        }
    }

    // sort by freq
    for (i=0; i<cnt_final-1; i++) {
        for (j=0; j<cnt_final-i-1; j++) {
            if (analysis[j].freq < analysis[j+1].freq) {
                //swap
                WORD_INFO tmp = analysis[j];
                analysis[j] = analysis[j+1];
                analysis[j+1] = tmp;
            }
        }
    }
    // sort by dict
    for (i=0; i<cnt_final-1; i++) {
        for (j=0; j<cnt_final-i-1; j++) {
            if (analysis[j].freq == analysis[j+1].freq) {
                if (strcmp(analysis[j].word, analysis[j+1].word) > 0) {
                    //swap
                    WORD_INFO tmp = analysis[j];
                    analysis[j] = analysis[j+1];
                    analysis[j+1] = tmp;                  
                }
            }
        }
    }

    // printf
    if (cnt_final>=10) {
        for (i=0; i<10; i++) {
            printf("%s:%d\n", analysis[i].word, analysis[i].freq);
        }    
    }
    else {
        for (i=0; i<cnt_final; i++) {
            printf("%s:%d\n", analysis[i].word, analysis[i].freq);
        }   
    }

    free(freq);
    return 0;
}