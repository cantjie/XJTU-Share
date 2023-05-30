// 假定已经有三个学生信息，现在需要补充第四个学生的信息。
// 要求：
// （1） 用数组存储学生信息，包括学号、班级、三门课程的成绩、三门课程的总成绩；
// （2） 补充输入第四个学生信息后，按照班级从小到大的先后排序输出学生信息，同一班级内按照总成绩从低到高输出。成绩保留1位小数。各项输出时以英文逗号','隔开。
// （3） 已有的三个学生信息可以在数组初始化时静态赋值，已有的三个学生的信息是：
// 1001,11,92.5,82.5,96,271
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97,84.5,88.5,270

// 第四个学生信息输入示例：
// 1004
// 12
// 95.8
// 85.6
// 74.9

// 输出示例：
// 1001,11,92.5,82.5,96.0,271.0
// 1004,12,95.8,85.6,74.9,256.3
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

#include <stdio.h>

int swap(int *a, int *b);
int swapDouble(double *a, double *b);

int main() {
	//initialize data
	int id[4] = {1001, 1002, 1003, 0};
	int classid[4] = {11, 12, 13, 0};
	double score[4][3] = {
							{92.5, 82.5, 96}, 
							{82.5, 87.5, 93.5},
							{97, 84.5, 88.5},
							{0}
							};						
	//input data
	scanf("%d %d %lf %lf %lf",&id[3], &classid[3], &score[3][0], &score[3][1], &score[3][2]);
	int i;
	double sum[4] = {0};
	for (i=0; i<4; i++) {
		sum[i] = score[i][0] + score[i][1] + score[i][2];
	}

	//sort
	int j;
	int k;
		//sort by classid
		for (i=0; i<4-1; i++) {
			for (j=0; j<4-i-1; j++) {
				if ((swap(&classid[j], &classid[j+1]))) {
					//swap id
					int tmp_id = id[j];
					id[j] = id[j+1];
					id[j+1] = tmp_id;
					//swap score
					double tmp_score[3] = {score[j][0], score[j][1], score[j][2]};
					for (k=0; k<3; k++) {
						score[j][k] = score[j+1][k];
					}
					for (k=0; k<3; k++) {
						score[j+1][k] = tmp_score[k];
					}
					//swap sum
					double tmp_sum = sum[j];
					sum[j] = sum[j+1];
					sum[j+1] = tmp_sum;
				}
				
			}
		}
		//sort by sum in same classid
		for (i=0; i<4-1; i++) {
			for (j=0; j<4-i-1; j++) {
				if (classid[j] == classid[j+1]) {
					if ((swapDouble(&sum[j], &sum[j+1]))) {
						//swap id
						int tmp_id = id[j];
						id[j] = id[j+1];
						id[j+1] = tmp_id;
						//swap score
						double tmp_score[3] = {score[j][0], score[j][1], score[j][2]};
						for (k=0; k<3; k++) {
						score[j][k] = score[j+1][k];
						}
						for (k=0; k<3; k++) {
						score[j+1][k] = tmp_score[k];
						}
					}
				}		
			}
		}
	
	//printf
	for (i = 0; i < 4; i++) {
		printf("%d,%d,%.1f,%.1f,%.1f,%.1f\n", id[i], classid[i], score[i][0], score[i][1], score[i][2], sum[i]);
	}
	
	return 0;
}

int swap(int *a, int *b) {
	int res = 0;
	int tmp;
	if (*a > *b) {
		tmp = *a;
		*a = *b;
		*b = tmp;
		res = 1;
	}
	return res;
}

int swapDouble(double *a, double *b) {
	int res = 0;
	if (*a > *b) {
		double tmp = *a;
		*a = *b;
		*b = tmp;
		res = 1;	
	}
	return res;
}
