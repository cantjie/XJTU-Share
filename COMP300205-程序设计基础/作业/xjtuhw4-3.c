// 若有n个数的数组arr，循环右移一位指每个数移到相邻的右边一个位置，最右边的数移到最左边。如数组1,2,3,4,5；循环右移1位的结果为5,1,2,3,4；右移3位的结果为3,4,5,1,2。

// 使用指针方法，编写数组右移k位的函数。

// 编写主函数输入若干元素和右移位数，调用函数右移，在主函数中输出结果。元素个数不超过100。

// 输入：两行，第1行为若干用空格分隔的整数，以9999表示结束；第2行一个整数，表示右移的位数。

// 输出：一行，移位的结果，各个数值用一个空格隔开，末尾无空格。

// 【输入输出样例】
// 输入：
// 1 2 3 4 5 9999
// 3

// 输出：
// 3 4 5 1 2

#include <stdio.h>
#include <stdlib.h>

typedef struct _Node {
    int value;
    struct _Node* next;
} Node;

typedef struct {
    Node* head;
    Node* tail;
} List;

void move_right(List* list, int cnt, int mv_right);

int main() {
    // input the nums
    int number;
    scanf("%d", &number);
    List list;
    list.head = '\0'; list.tail = '\0';
    int cnt = 0;
    while (number != 9999) {
        Node* p = (Node*)malloc(sizeof(Node));
        p->value = number; p->next = list.head;
        if (list.head != '\0') {
            list.tail->next = p;
            list.tail = list.tail->next;
        }
        else {
            list.head = p;
            list.tail = list.head;
            p->next = list.head;
        }
        scanf("%d", &number);
        cnt ++;
    }   // a linked list that its tail point to its head

    // move right
    int mv_right;
    scanf("%d", &mv_right);
    move_right(&list, cnt, mv_right);
    
    // print
    int i;
    Node* p;
    for(i=0, p=list.head; i<cnt-1; i++, p=p->next) {
        printf("%d ", p->value);
    }
    printf("%d", p->value);

    return 0;
}

void move_right(List* list, int cnt, int mv_right) {
    mv_right = mv_right % cnt;
    int i;
    for (i=0; i<cnt-mv_right; i++) {
        list->head = list->head->next;
    }
}
