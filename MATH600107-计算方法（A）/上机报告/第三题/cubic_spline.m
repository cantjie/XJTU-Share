%----greeting and data collection----%
disp('Hello ,this is a script to show the cubic spline interpolation')
disp('And you should give me some information below:')
interval=input('give me a scope of the function range: [a,b]');a=interval(1);b=interval(2);
x=input('give me some x: x(n)');%输入n个节点x
n=size(x,1);%提取x的数量
n=n-1;%为了与书上n的含义统一，将n减一
y=input('give me some y which is exactly corresponding to x: y(n)');%输入x处对应函数值y
[x,x_index]=sort(x);%将x按从小到大排列，并记下排序索引index
y=y(x_index);%按照x的顺序将y对应排列
%----------------------------------------------------------------
if input('choose boundary condition:(1 or 2 or 3)','1:已知f"(a)，f"(b)','2:已知f’(a)，f’(b)','3:周期性边界条件')==1
  m(1)=input('Please enter f"(a):');
  m(n+1)=input('Please enter f"(b):');
  lambda(1)=(x(3)-x(2))/(x(2)-x(1)+x(3)-x(2));  %计算书中λ1，即本程序λ（2）将其放在向量λ的第一个
  for i=3:n-1%计算书中μ2到μn-2，λ2到λn-2，即本程序3到n-1
     mu(i-2)=(x(i)-x(i-1))/(x(i)-x(i-1)+x(i+1)-x(i));
     lambda(i-1)=(x(i+1)-x(i))/(x(i)-x(i-1)+x(i+1)-x(i));
  end   
  mu(n-2)=(x(n)-x(n-1))/(x(n)-x(n-1)+x(n+1)-x(n)); %计算书中μn-1,即本程序μ(n),将其存在向量μ的第n-2个
  for i=2:n%求出书中d1到dn-1即本程序d（2）到d（n）形成向量d。因而下标减一
  d(i-1)=6/(x(i)-x(i-1)+x(i+1)-x(i))*((y(i+1)-y(i))/(x(i+1)-x(i))-(y(i)-y(i-1))/(x(i)-x(i-1)));
  end
  d(1)=d(1)-(x(2)-x(1))/(x(2)-x(1)+x(3)-x(2))*m(1);
  d(n-1)=d(n-1)-(x(n+1)-x(n))/(x(n)-x(n-1)+x(n+1)-x(n))*m(n+1);
  A=diag(lambda,1)+diag(mu,-1)+2*eye(n-1);
%---------------------------------------------------------------------------
elseif input('choose boundary condition:(1 or 2 or 3)','1:已知f"(a)，f"(b)','2:已知f’(a)，f’(b)','3:周期性边界条件')==2
yp0=input('Please enter f\(a)');
ypn=input('Please enter f\(b)');
lambda(1)=1;
  for i=2:n
   h(i)=x(i)-x(i-1);
   h(i+1)=x(i+1)-x(i);
      lambda(i)=h(i+1)/(h(i)+h(i+1));
      mu(i-1)=1-lambda(i-1);
      d(i)=6/(h(i)+h(i+1))*((y(i+1)-y(i))/h(i+1)-(y(i)-y(i-1))/h(i));
  end
  mu(n)=1;
  d(1)=6/h(2)*((y(2)-y(1))/h(2)-yp0);
  d(n+1)=6/h(n+1)*(ypn-(y(n+1)-y(n))/h(n+1));
  A=diag(lambda,1)+diag(mu,-1)+2*eye(n+1);
%-----------------------------------------------------------------------------
elseif input('choose boundary condition:(1 or 2 or 3)','1:已知f"(a)，f"(b)','2:已知f’(a)，f’(b)','3:周期性边界条件')==3
 for i=3:n%计算书中μ2到μn-1，λ2到λn-1，即本程序3到n
     h(i)=x(i)-x(i-1);
     h(i+1)=x(i+1)-x(i);
     mu(i-2)=h(i+1)/(h(i)+h(i+1));
     lambda(i-1)=1-mu(i-2);
 end
 lambda(1)=h(2)/(h(2)+h(3));
 x(n+2)=x(2);
 mu(n-1)=(x(n+1)-x(n))/(x(n+1)-x(n)+x(n+2)-x(n+1));
 A=diag(lambda,1)+diag(mu,-1)+2*eye(n);
 h(2)=x(2)-x(1);
 h(n+2)=x(n+2)-x(n+1);
 A(1,n)=h(2)/(h(2)+h(3));
 A(n,1)=h(n+2)/(h(n+1)+h(n+2));
   for i=2:n
   d(i-1)=6/(h(i)+h(i+1))*((y(i+1)-y(i))/h(i+1)-(y(i)-y(i-1))/h(i));
   end
   d(n)=6/(h(n+1)+h(n+2))*((y(n+2)-y(n+1))/h(n+2)-(y(n+1)-y(n))/h(n+1));
end
%--------------------------------------------------------------------------
[t,N]=size(A);%利用追逐法求解方程组,得到M
[L,U,P] = lu(A);
Y(1)=d(1);
for i=2:N
    Y(i)=d(i)-L(i,i-1)*Y(i-1);   
end
M(N)=Y(N)/U(N,N);
for i=N-1:-1:1
    M(i)=(Y(i)-U(i,i+1)*M(i+1))/U(i,i);
end

if c==1%对于三种情况统一用mm向量储存M0到Mn
 mm=[m(1),M];
 mm=[mm,m(n+1)];
elseif c==2
 mm=M;
elseif c==3
 mm=[M(N),M];
end

for i=2:n+1
    h(i)=x(i)-x(i-1);
end
syms X S
for i=2:n+1
    fprintf('When x∈[%4.2f, %4.2f]\n',x(i-1),x(i)); 
    S=simplifyFraction((x(i)-X).^3./(6*h(i)).*mm(i-1)+(X-x(i-1)).^3./(6*h(i)).*mm(i)+(y(i-1)-h(i)^2/6*mm(i-1)).*(x(i)-X)./h(i)+(y(i)-h(i)^2/6*mm(i)).*(X-x(i-1))./h(i));
end
S=0;
for i=2:n+1
    X=x(i-1):0.01:x(i);
    S=( (x(i)-X).^3./(6*h(i)).*mm(i-1)+(X-x(i-1)).^3./(6*h(i)).*mm(i)+(y(i-1)-h(i)^2/6*mm(i-1)).*(x(i)-X)./h(i)+(y(i)-h(i)^2/6*mm(i)).*(X-x(i-1))./h(i));
plot(X,S,'r')
hold on
end
