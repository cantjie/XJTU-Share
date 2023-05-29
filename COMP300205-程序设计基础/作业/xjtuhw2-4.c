// 搜索3000至6000之间的超级素数（假设最多为10个），按照出现的顺序保存到一个一维数组中，并按照十进制整型输出该数组第3个元素的值。

// 其中，超级素数的定义是：若一个素数从低位到高位依次去掉一位数后仍然是素数，此数为超级素数。例如3739是素数，同时373，37，3都是素数。

#include <stdio.h>
#include <math.h>

int isPrime(int x);

int main() {
	int lower = 3000, upper = 6000;
	int list_of_pirme[10] = {0};
	int i, cnt = 0;
	//judge the i from lower to upper
	for (i=lower; i<=upper; i++) {
		int mirror_i = i;
		if (isPrime(mirror_i) && isPrime(mirror_i/10) && isPrime(mirror_i/100) && isPrime(mirror_i/1000)) {
			list_of_pirme[cnt] = i;
			cnt++;
		}
	}
	//prime the 3rd
	printf("%d", list_of_pirme[2]);
	
	return 0;
}

int isPrime(int x) {
	int isprime = 1;
	int i;
	for (i=2; i<sqrt(x)+1; i++) {
		if (x%i == 0) {
			isprime = 0;
		}
	}
	return isprime;
}
