J=input('Do you want to use calculate 3.2 on Page 113?( Y or N )','s');
if J=='Y'||J=='y'
    n=input('OK, Give me the Matrix dimension n:');    
    m=n;
    A=diag(ones(n-1,1),1)+diag(ones(n-1,1),-1)-2*eye(n);
    b=zeros(n,1);
    b(1)=-1;
    b(n)=-1; 
    epsilon=1e-6;
else
    A=input('Please enter Matrix A:');
    [m,n]=size(A);
    b=input('Please enter vector b:');
    epsilon=input('Please enter required precision:');%输入精度要求ε
end
%----------------------------------------------------------------------
if m~=n
   input('error ！Rows should be equal to Lines!') ;
else
   if isPosdefmat(A)==0 %-------------------如果A不是对称正定(负定)矩阵，则将Ax=b变为ATAx=ATb。
       A=A.'*A;%系数矩阵转化为对称正定阵
       b=A.'*b;
   end

    x=zeros(n,1);%初始向量x0取n维零向量
    r=b-A*x;
    d=r;
    newr=r;
    for k=0:n-1%
        alpha=newr'*newr/(d'*A*d);
        x=x+alpha*d;
        r=newr;
        newr=b-A*x;
        if (norm(newr)<=epsilon)||(k+1==n)
            break;
        end
        beta=(norm(newr))^2/(norm(r))^2;
        d=newr+beta*d;
    end
end
for i = 1:n
    fprintf('x(%d) is %d\n',i,x(i))
end 
