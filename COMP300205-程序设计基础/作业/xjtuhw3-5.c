// 编写递归函数，求数组元素的最大值。数组为整型数组。主函数中输入数组元素，以-9999为结束符，-9999不会是数组的元素。数组元素个数不超过100。

// 输入：若干整数，以空格或换行隔开，以-9999结束。-9999不是数组元素
// 输出：一个整数。

// 样例：
// 输入：
// 5 4 6 -10 100 42 -9999

// 输出：
// 100

#include <stdio.h>

int maxnum(int arr[], int len);

int main() {
    int arr[100] = {0};
    // scanf
    int cnt = 0;
    int tmp;
    scanf("%d", &tmp);
    while (tmp != -9999) {
        arr[cnt] = tmp;
        cnt ++;
        scanf("%d", &tmp);
    }
    // find the max-
    int len = cnt;
    int max = maxnum(arr, len);
    // print
    printf("%d", max);

    return 0;
}
int maxnum(int arr[], int len) {
    int max = arr[0];
    int i;
    // traversal 
    for (i=1; i<len; i++) {
        if (max < arr[i]) {
            max = arr[i];
        }
    }
    return max;
}