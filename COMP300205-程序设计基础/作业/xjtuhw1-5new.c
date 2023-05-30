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

int main() {
    int i, j, k;
    int cls[3]; 
    int id[3]; 
    float score[3][3]; 

    for (i = 0; i < 3; i++) {
        scanf("%d,%d,%f,%f,%f", &cls[i], &id[i], &score[i][0], &score[i][1], &score[i][2]);
    }

    for (i = 0; i < 3-1; i++) {
        for (j = i+1; j < 3; j++) {
            if (cls[i] > cls[j]) {
                int temp_cls = cls[i];
                cls[i] = cls[j];
                cls[j] = temp_cls;
                int temp_id = id[i];
                id[i] = id[j];
                id[j] = temp_id;
                for (k = 0; k < 3; k++) {
                    float temp_score = score[i][k];
                    score[i][k] = score[j][k];
                    score[j][k] = temp_score;
                }
            }
        }
    }

    for (i = 0; i < 3-1; i++) {
        for (j = i+1; j < 3; j++) {
            if (cls[i] == cls[j]) {
                float total_score_i = score[i][0] + score[i][1] + score[i][2];
                float total_score_j = score[j][0] + score[j][1] + score[j][2];
                if (total_score_i < total_score_j) {
                    int temp_cls = cls[i];
                    cls[i] = cls[j];
                    cls[j] = temp_cls;
                    int temp_id = id[i];
                    id[i] = id[j];
                    id[j] = temp_id;
                    for (k = 0; k < 3; k++) {
                        float temp_score = score[i][k];
                        score[i][k] = score[j][k];
                        score[j][k] = temp_score;
                    }
                }
            }
        }
    }

    for (i = 0; i < 3; i++) {
        float total_score = score[i][0] + score[i][1] + score[i][2];
        printf("%d,%d,%.1f\n", cls[i], id[i], total_score);
    }

    return 0;
}

