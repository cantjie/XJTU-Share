%--------------main()
getline=input('To calculate 6.5 on Page 209?( Y or N )','s');
if getline=='Y'||getline=='y'
    a=0;b=1;e=5e-6;
    fun=@(x)(1/(1+x^2));
    result=romberg(fun,a,b,e)
    margin=pi/4-result
else
    fun_in=input('输入一个函数表达式：f(x)=','s');
    a=input('输入上下界和精度[a,b,e]=');
    
    fun=@(x)(eval(fun_in));
    result=romberg(fun,a(1),a(2),a(3))
    margin=pi/4-result
end


