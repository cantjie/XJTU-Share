// 求1+2+...+9的和

#include <stdio.h>

int main() {
	
	int sum = 0;
	int i;
	
	for (i=1; i<=9; i++) {
		sum += i;
	}
	
	printf("%d", sum);
	
	return 0;
}
