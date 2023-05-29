// 假设已经有三个学生信息，现需要删除一个学生的信息。
// （1） 用数组存储学生信息，包括学号、班级、三门课程的成绩、三门课程的总成绩；
// （2） 只需要输入一个待删除学生的学号，若该学生不存在，则输出原有三个学生排序后的信息。各项输出时以英文逗号','隔开。
// （3） 如果指定删除的学生存在，则将其余的学生的信息排序，按照班级从小到大、同一班级内按照总成绩从小到大排序输出。
// （4） 已有的三个学生信息可以在数组初始化时静态赋值，已有的三个学生的信息是：
// 1001,11,92.5,82.5,96.0,271.0
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

// 输入示例1（输入待删除学生学号）：
// 1001

// 输出示例1：
// 1002,12,82.5,87.5,93.5,263.5
// 1003,13,97.0,84.5,88.5,270.0

// 输入示例2（输入不存在的学号）：
// 1004

// 输出示例2：
// 1001,11,92.5,82.5,96.0,271
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
	//input id_del
	int id_del;
	scanf("%d",&id_del);
	//judge if exist
	int i;
	int j;
	int res = 0;
	for (i=0; i<3; i++) {
		if (id_del == id[i]) {
			id[i] = 0; classid[i] = 0;
			for (j=0; j<3; j++) {
				score[i][j] = 0;
			res = 1;
			}
		}
	}
	//calculate the sum
	double sum[4] = {0};
	for (i=0; i<4; i++) {
		sum[i] = score[i][0] + score[i][1] + score[i][2];
	}

	//sort
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
	if (res == 0) {
		for (i = 0; i < 3; i++) {
		printf("%d,%d,%.1f,%.1f,%.1f,%.1f\n", id[i], classid[i], score[i][0], score[i][1], score[i][2], sum[i]);
	}
	}
	else {
		for (i = 1; i < 3; i++) {
		printf("%d,%d,%.1f,%.1f,%.1f,%.1f\n", id[i], classid[i], score[i][0], score[i][1], score[i][2], sum[i]);
	}
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
