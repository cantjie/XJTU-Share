// 编写程序，输入n和n*n的整数矩阵元素，求其鞍点。n不超过10。

// 如果矩阵A中存在这样的一个元素A[i,j]满足条件：A[i,j]是第i行中值最小的元素,且又是第j列中值最大的元素，则称之为该矩阵的一个马鞍点。

// 输入：矩阵阶数n, 然后按行输入n*n个矩阵元素。

// 输出：若干行，每行是矩阵的一个鞍点的行号、列号和数值，用一个空格隔开。若矩阵没有鞍点，输出"None"。

【输入输出样例1】
输入：
3
1 7 3
5 4 6
17 18 9

输出：
3 3 9

【输入输出样例2】
输入：
3
5 19 20
6 20 9
19 18 5

输出：
None

#include <stdio.h>
#include <stdlib.h>

int main() {
    //create a n*n matrix
    int n;
    scanf("%d", &n);                                     
    int *mat = (int*)malloc(n*n*sizeof(int));

    //input element to the matrix
    int i, ele;
    for (i=0; i<n*n; i++) {
        scanf("%d", &ele);
        mat[i] = ele;
    }

    //find the min_num of every row
    int j;
        //create a n*2 matrix to store the min_num of every row
        int (*min)[2] = (int(*)[2])malloc(n*2*sizeof(int));
    for (i=0; i<n; i++) {
        min[i][0] = 0; min[i][1] = mat[i*n];
        for (j=0; j<n; j++) {
            if (min[i][1] > mat[i*n+j]) {
                min[i][0] = j;
                min[i][1] = mat[i*n+j];
            }
        }
    }

    //judge if the min_num is the max in its colum
    int res = 0;
    for (i=0; i<n; i++) {
        int cnt = 0;
        for(j=0; j<n; j++) {
            if (min[i][1] > mat[j*n+min[i][0]]){
                cnt++;
            }
        }
        if (cnt == n-1) {
            printf("%d %d %d\n", i+1, min[i][0]+1, min[i][1]);
            res = 1;
        }
    }
    if (res == 0) {
        printf("None\n");
    }


    free(min);
    free(mat);
    return 0;
}