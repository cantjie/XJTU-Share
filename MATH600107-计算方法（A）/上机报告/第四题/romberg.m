function I=romberg(fun,a,b,e)
    % 判断输入参数是否足够
    if nargin~=4
        error('请输入需要求积分的f、上界和下界以及误差e')
    end

    k=0; % 迭代次数
    n=1; % 区间划分个数
    h=b-a; %上下界间距
    T(1,1)=h/2*(fun(a)+fun(b));
    d=b-a; %误差间距
    while e<=d
        k=k+1;
        h=h/2;
        sum=0;
        % 计算第一列T
        for i=1:n
            sum=sum+fun(a+(2*i-1)*h);
        end
        T(k+1,1)=T(k)/2+h*sum;
        % 迭代
        for j=1:k
            T(k+1,j+1)=T(k+1,j)+(T(k+1,j)-T(k,j))/(4^j-1);
        end
        n=n*2;
        d=abs(T(k+1,k+1)-T(k,k));
    end
    T
    I=T(k+1,k+1);
end