// 使用指针，改写作业5程序，把能用指针的地方都改成指针。

// 作业5：
// 要求输入三个学生的班级号、学号和三门课程成绩。(注意：班级号为两位整数)

// 然后按照班级号从小到大输出；若同一班级的，按照总成绩由高到低输出。

// 示例：
// 输入：
// 11,1001,92.5,82.5,96
// 12,1004,95.8,85.6,74.9
// 12,1005,82.5,87.5,93.5

// 输出：
// 11,1001,271.0
// 12,1005,263.5
// 12,1004,256.3

#include <stdio.h>
#include <stdlib.h>

#define STU_NUM 3
#define SUB_NUM 3

typedef struct {
    int class_id;
    int id;
    double score[SUB_NUM];
    double sum;
} STU_INFO;

void sort_classid(STU_INFO* list_stu[], int len);
void sort_sum(STU_INFO* list_stu[], int len);

int main() {
    // input stu info
    STU_INFO* list_stu[STU_NUM];
    int i;
    for (i=0; i<STU_NUM; i++) {
        list_stu[i] = (STU_INFO*)malloc(sizeof(STU_INFO));
        scanf(
            "%d,%d,%lf,%lf,%lf", 
            &list_stu[i]->class_id, &list_stu[i]->id,
            &list_stu[i]->score[0], &list_stu[i]->score[1], &list_stu[i]->score[2]
        );
        list_stu[i]->sum = list_stu[i]->score[0]+list_stu[i]->score[1]+list_stu[i]->score[2];   // sum
    }

    // sort
    sort_classid(list_stu, STU_NUM);
    sort_sum(list_stu, STU_NUM);

    // print
    for (i=0; i<STU_NUM; i++) {
        printf("%d,%d,%.1f\n", list_stu[i]->class_id, list_stu[i]->id, list_stu[i]->sum);
    }

    // free
    for (i=0; i<STU_NUM; i++) {
        free(list_stu[i]);
    }

    return 0;
}

void sort_classid(STU_INFO* list_stu[], int len) {
    int i, j;
    for (i=0; i<len-1; i++) {
        for (j=0; j<len-i-1; j++) {
            if (list_stu[j]->class_id > list_stu[j+1]->class_id) {
                // swap the pointer
                STU_INFO* tmp = list_stu[j];
                list_stu[j] = list_stu[j+1];
                list_stu[j+1] = tmp;
            }
        }
    }
}

void sort_sum(STU_INFO* list_stu[], int len) {
    int i, j;
    for (i=0; i<len-1; i++) {
        for (j=0; j<len-i-1; j++) {
            if (list_stu[j]->class_id == list_stu[j+1]->class_id) {
                if (list_stu[j]->sum < list_stu[j+1]->sum) {
                // swap the pointer
                STU_INFO* tmp = list_stu[j];
                list_stu[j] = list_stu[j+1];
                list_stu[j+1] = tmp;
                }
            }
        }
    }
}