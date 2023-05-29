// 2023年04月 10日 星期一 20:47
// 使用递归函数求斐波那契数列(Fibonacci)数列的第n项。
// f（1）=1
// f（2）=1
// f ( n ) =f(n-1)+f(n-2), n=3,4,5,6…

// 输入：项数n
// 输出：输出一个正整数，若n为非正整数输出’ERROR’.

// 【输入输出要求】
// 输入：项数n
// 输出：输出一个正整数，若n为非正整数输出"ERROR".

// 【输入输出样例】
// 输入：
// 5
// 输出：
// 5

// 输入：
// -1
// 输出：
// ERROR

#include <stdio.h>  
int Fibonacci(int n)  
{  
    if( n == 1 || n == 2){
        return 1; 
    }
    else { 
        return Fibonacci(n-1)+Fibonacci(n-2);  
    }
}  
  
int main()  
{  
    int n;   
    scanf("%d",&n);  
    if (n > 0) {
        printf("%d\n",Fibonacci(n)); 
    }
    else {
        printf("ERROR");
    }
    
    return 0;  
}  