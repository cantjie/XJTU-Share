// 若已有三个学生信息如下：
// 1001,11,92.5,82.5,96.0,271.0
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

// 现需要修改一个学生的信息。
// （1） 用数组存储学生信息，包括学号、班级、三门课程的成绩、总成绩；
// （2） 只需要输入一个待修改学生的全部信息（学号不能修改），通过学号查找学生，找到则修改，若没有找到相关学生，则不予修改；最后按照班级从小到大、同一班级内按照总成绩从低到高排序所有学生信息并输出。

// 输入示例1（输入一个已存在的学生信息）：
// 1001 11 96.5 74.5 86.7

// 输出示例1：
// 1001,11,96.5,74.5,86.7,257.7
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

// 输入示例2(输入一个不存在的学生信息)：
// 1007 11 91.5 78.5 88

// 输出示例2：
// 1001,11,92.5,82.5,96.0,271.0
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

#include <stdio.h>

int swap(int *a, int *b);
int swapDouble(double *a, double *b);

int main() {
	//initialize data
	int id[3] = {1001, 1002, 1003};
	int classid[3] = {11, 12, 13};
	double score[3][3] = {
							{92.5, 82.5, 96}, 
							{82.5, 87.5, 93.5},
							{97, 84.5, 88.5},
							};						
	//input change_info
	int id_change;
	scanf("%d",&id_change);
	//judge if exist
	int i;
	for (i=0; i<3; i++) {
		if (id_change == id[i]) {
			scanf("%d %lf %lf %lf", &classid[i], &score[i][0], &score[i][1], &score[i][2]);
			}
		}
	//calculate the sum
	double sum[3] = {0};
	for (i=0; i<3; i++) {
		sum[i] = score[i][0] + score[i][1] + score[i][2];
	}

	//sort
	int j;
	int k;
		//sort by classid
		for (i=0; i<3-1; i++) {
			for (j=0; j<3-i-1; j++) {
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
		for (i=0; i<3-1; i++) {
			for (j=0; j<3-i-1; j++) {
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
	for (i = 0; i < 3; i++) {
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
