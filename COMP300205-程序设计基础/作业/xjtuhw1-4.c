// 输入格式要求同实验3，不必检查学号的重复和成绩的合理性。

// 输出格式(各项以英文逗号','隔开)：
// 学号1,总成绩1
// 学号2,总成绩2
// 学号3,总成绩3

// 要求：总成绩保留1位小数，并且按总成绩从大到小依次输出。

// 示例：
// 输入：
// 20010,90,89.5,100
// 20011,88.5,78,92.5
// 20012,99,89.5,90

// 输出：
// 20010,279.5
// 20012,278.5
// 20011,259.0

#include <stdio.h>

int main() {
    int i, j;
    float sum[3];
    int id[3];
    float score[3][3];
    float temp;
	int clas[3];

    for (i = 0; i < 3; i++) {
        scanf("%d,%d,%f,%f,%f", &clas[i],&id[i],&score[i][0],&score[i][1],&score[i][2]);
        sum[i] = score[i][0] + score[i][1] + score[i][2];
    }

		    for (i = 0; i < 3 - 1; i++) {
		        for (j = 0; j < 3 - 1 - i; j++) {
		            if (sum[j] < sum[j+1]) {
		                temp = sum[j];
		                sum[j] = sum[j+1];
		                sum[j+1] = temp;

		                int temp_id;
		                temp_id = id[j];
		                id[j] = id[j+1];
		                id[j+1] = temp_id;     
		            }
		        }
		    }
    for (i = 0; i < 3; i++) {
        printf("%d,%.1f\n", id[i], sum[i]);
    }

    return 0;
}

