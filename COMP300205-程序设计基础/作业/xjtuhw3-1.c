// 若已有四个学生的学号、班级、姓名、三门课程的成绩，在main函数中分别调用以下函数(1)和函数(2)实现相应功能，最后在main函数中输出排序后所有学生的信息。函数名等自行定义。
// 函数(1): 计算每个学生的总成绩；
// 函数(2): 按照班级从小到大、同一班级内按照姓名拼音字典顺序排序。

// 已有四个学生的信息如下,在程序中使用初始化完成，不需要由用户输入：
// 1001,11,Zhao,92.5,82.5,96
// 1002,12,Qian,82.5,87.5,93.5
// 1003,13,Sun,97,84.5,88.5
// 1004,12,Li,95.8,85.6,74.9

// 输出示例：
// 1001,11,Zhao,92.5,82.5,96.0,271.0
// 1004,12,Li,95.8,85.6,74.9,256.3
// 1002,12,Qian,82.5,87.5,93.5,263.5
// 1003,13,Sun,97.0,84.5,88.5,270.0

#include <stdio.h>
#include <string.h>

#define STU_NUM 4
#define NAME_LEN 5
#define SUB_NUM 3

typedef struct{
    int id;
    int classid;
    char name[NAME_LEN];
    double score[SUB_NUM];
    double sum;
} STU_INFO;

void sum(STU_INFO *ptr);
void sort(STU_INFO *ptr, int len);

int main() {
    // initialize
    STU_INFO stu_info[STU_NUM] = {
        {1001, 11, "Zhao", {92.5, 82.5, 96}},
        {1002, 12, "Qian", {82.5, 87.5, 93.5}},
        {1003, 13, "Sun", {97, 84.5, 88.5}},
        {1004, 12, "Li", {95.8, 85.6, 74.9}}
    };
    STU_INFO *ptr = &stu_info[0];

    // calculate the sum
    int len = STU_NUM;
    int i;
    for (i=0; i<len; i++) {
        sum(ptr+i);
    }

    // sort by classid, then dict
    sort(ptr, len);

    // printf
    for (i=0; i<len; i++) {
        printf("%d,%d,%s,%.1f,%.1f,%.1f,%.1f\n",
            stu_info[i].id, stu_info[i].classid, stu_info[i].name, 
            stu_info[i].score[0], stu_info[i].score[1], stu_info[i].score[2], stu_info[i].sum);
    }
    return 0;
}

void sum(STU_INFO *ptr) {
    ptr->sum = ptr->score[0] + ptr->score[1] + ptr->score[2];
}

void sort(STU_INFO *ptr, int len) {
    // sort by classid
    int i, j;
    for (i=0; i<len-1; i++) {
        for (j=0; j<len-i-1; j++) {
            if ((ptr+j)->classid > (ptr+j+1)->classid) {
                STU_INFO tmp = *(ptr+j);
                *(ptr+j) = *(ptr+j+1);
                *(ptr+j+1) = tmp;
            }
        }
    }
    // sort by dict
    for (i=0; i<len-1; i++) {
        for (j=0; j<len-i-1; j++) {
            if ((ptr+j)->classid == (ptr+j+1)->classid) {
                if (strcmp((ptr+j)->name, (ptr+j+1)->name) > 0) {
                STU_INFO tmp = *(ptr+j);
                *(ptr+j) = *(ptr+j+1);
                *(ptr+j+1) = tmp;
                }
            }
        }
    }
}