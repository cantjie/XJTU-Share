%{
/* 功能：
 * 将输入复制到输出，同时对输入文本中的字符序列“magic”做变换：
 *  (1) 若行首以字母a开始，则将紧跟其后的第1个序列"magic"变化为"first"输出;
 *  (2) 若行首以字母b开始，则将紧跟其后的第1个序列"magic"变化为"second"输出;
 *  (3) 若行首以字母c开始，则将紧跟其后的第1个序列"magic"变化为"third"输出;
 *  (4) 其他地方出现的序列"magic"变化为"zero"输出;
 *  (5) 其他行和非magic单词不变，直接输出。
 *
 *-----------
 *  若将非互斥入口该为互斥入口，即 %start 该为 %x，则
 *      一旦进入某入口，总是用对应正规式识别 后续任意的 magic。
 *  
 * 用gcc生成可执行程序：
   flex -o lexsamp4.c lexsamp4.l
   gcc  -o lexsamp4 lexsamp4.c
   之后输入./lexsamp4即可运行
 */

#include <stdio.h>
%}
%start AA BB CC
%%
^a  		{ ECHO; BEGIN AA; }
^b			{ ECHO; BEGIN BB; }
^c			{ ECHO; BEGIN CC; }
 /*注释不能顶头 */
\n|(\t)+|" "+	{ ECHO; BEGIN 0; }
 /**/
 /* 如果这个规则位于所有<?>magic之前，则
  * <?>magic规则永远无法起作用
  *
magic		{ printf ("zero");}
 */
<AA>magic		{ /*adding your code*/ }
<BB>magic		{ /*adding your code*/}
<CC>magic		{ /*adding your code*/}
 /* 该规则必须放到上三条之后，原因见上 */
magic		{ printf ("zero");}
 /* */
%%

/*以上语义动作没有return语句，所以yylex()仅遇到
 * 输入结束才返回。
 */
int main()
{
   yyin=fopen("text1","r");
   yylex();
 
   return 0;
}

int yywrap() { return 1; }
