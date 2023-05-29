// 假设有两个矩阵A和B，初始化值要求如下所示，求A+B的和矩阵C，并以十进制整型输出C的转置矩阵中第2行第1列的数据。

// 矩阵A：
// 2 8 1
// 3 10 9

// 矩阵B：
// 4 13 3
// 17 2 8

#include <stdio.h> 

int main() {
	//initialize the matrix
	int a[2][3] = {{2, 8, 1}, {3, 10, 9}};
	int b[2][3] = {{4, 13, 3}, {17, 2, 8}};
	int c[2][3] = {0};
	//calculate
	int i, j;
	for (i=0; i<2; i++) {
		for (j=0; j<3; j++) {
			c[i][j] = a[i][j] + b[i][j];
		}
	}
	//printf
	printf("%d", c[0][1]);
	
	
	return 0;
} 
