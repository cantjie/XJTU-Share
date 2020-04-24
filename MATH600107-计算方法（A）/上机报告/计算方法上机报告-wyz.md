# 计算方法上机报告



**wyz**



>**程序设计要求 ：**
>
>1.  程序要求是通用的，在程序设计时要充分考虑哪些变量应该可
>变的。 
>2.  程序要求调试通过。 
>3.  每个方法要求给出一个具体的算例
>
>**上机报告要求： **
>
>1. 每种方法的算法原理及程序框图。
>2. 程序使用说明。 
>3. 算例计算结果。 

## 1. QR 分解方法求解线性方程组(或超定方程组)

### 1.1. 算法原理与程序框图

1. 算法原理

   鉴于用吉文斯变换实现矩阵QR分解的运算量大约是用豪斯霍尔德变换的2倍，本题采用豪斯霍尔德变换实现QR分解。

   为了减少存储量，将上三角矩阵$R_1$的上三角部分的元素存放在矩阵$A$的相应位置上，每一步计算不再单独储存豪斯霍尔德矩阵$H_k$，而储存生成$H_k$的向量$w_k$和$\alpha_k$，将矩阵的对角线和消为零元素的位置用来存放$w_k$的分量。而$R_1$的对角元$\sigma_1、\sigma_2...\sigma_n$依次存放在$d_1、d_2...d_n$中。

   针对$m\times n$的矩阵$A$，先进行n-1步，其中为避免越减越小，$\sigma_n$的符号取与$a_{kk}^{k-1}$相反。然后判断m与n的大小，针对m=n，m>n的情况分别求出$\sigma_n$及其他元素。

   最后只保留上三角矩阵R1，其余元素取0，得到矩阵R。算法执行完毕后A中元素存放情况（以5×4矩阵为例）：
   $$
   A=\begin{bmatrix}w_{11} & r_{12} & r_{13} & r_{14}\\w_{21} & w_{22} & r_{23} & r_{24}\\w_{31} & w_{32} & w_{33} & r_{34}\\w_{41} & w_{42} & w_{34} & w_{44} \\w_{51} & w_{52} & w_{35} & w_{45}\end{bmatrix}
   $$
   利用向量$w_k$和数量$\alpha_k$构造矩阵$\widetilde{H_k}$，形成矩阵H，进而计算$H=H_sH_{s-1}...H_1$，最后得到正交矩阵$Q=HT$。输出矩阵Q，R。

   若输入矩阵A的行列数不等，则只进行QR分解；若输入矩阵A的行列数相同，则要求输入b，求解线性方程组$Ax=b$。求解$Ax=b \rightarrow QRx=b \rightarrow Rx=Q^Tb$，其中R为上三角矩阵。最后输出x。

2. 程序框图



### 1.2. 代码及说明

```matlab
%HouseHolder Method to QR
A=input('Give me a Matrix A:');
[m,n]=size(A);
while m<n%循环直到输入的矩阵行数大于等于列数
    disp('Sorry, rows should be larger than lines');
    A=input('give me a Matrix A then:');
    [m,n]=size(A);%提取矩阵A的行、列数m，n
end
%-------------------------------------------------%
d=zeros(n,1);%定义n维向量d，α来存放中间变量
a=zeros(n,1);
sigma=0;%

for k=1:n-1
    sigma=0;%sigma赋初值0.
    for i=k:m %求出sigma
        sigma=sigma+A(i,k)^2;
    end
    if A(k,k)>=0%σ符号取与akk相反，避免越减越小
        sigma=-sqrt(sigma);
    end
   d(k)=sigma; %将σ都存在n维向量d中。
   a(k)=sigma*(sigma-A(k,k));%求α
   A(k,k)= A(k,k)-sigma;%存放w_k的第一个分量
   for j=k+1:n%计算β与A_kj的值
       b=(A(k,k)*A(k,j)); %b由akkakj/ak盒SIGMA(aikaij)/ak两部分构成
       for i=k+1:m
           b=b+A(i,k)*A(i,j);
       end
       b=b/a(k);
       A(k,j)=A(k,j)-b*A(k,k);
       for i=k+1:m
           A(i,j)=A(i,j)-b*A(i,k);
       end
   end
end
%-------------------------------------------------------%
if m == n
    d(n) = A(n,n);
    %标号1
elseif m > n
    sigma = 0;
    for i = n:m
      sigma = sigma+A(i,n)^2;  
    end
    sigma=sqrt(sigma);
elseif A(n,n) >= 0
    sigma = -sigma;
    d(n)=sigma;
    a(n)=sigma*(sigma-A(n,n));
    A(n,n)=A(n,n)-sigma;
end
%---------------------------------------------------%
R = A;%把A矩阵中存放的w删去，计算上梯形矩阵R
for i = 1 : n 
    R(i,i) = d(i);
    for j = 1 : n  
        if i > j
           R(i,j) = 0;
        end
    end
end 
R(n+1:m,:)=zeros(m-n,n);%将R矩阵第n+1到m行赋为0
H=eye(m);%利用wk与ak计算正交矩阵H
for k=1:min(m-1,n)
    h=eye(m-k+1)-(A(k:m,k)*(A(k:m,k).'))/a(k);
    h=[[eye(k-1),zeros(k-1,m-k+1)];[zeros(m-k+1,k-1),h]];
    H=h*H;
end
Q=H.'
R
string=input('do you want to solve a equation with QR? y/n    ','s');

if string == 'y'
    if m == n%若m=n，则求解线性方程组
        b = input('Please enter vector b:');%输入b
        b = H * b;%将方程Ax=b转化为Qx=QTb，此步将b变为QTb（H=QT）
        x = zeros(n,1);%创建n阶向量x
        x(n) = b(n)/R(n,n);%求出x（n）
        for k = n-1:-1:1%利用上三角系数矩阵，从xn往前回代，得到xn-1到x1
            for j = k+1:n
               x(k) = x(k)+R(k,j)*x(j); 
            end
            x(k) = (b(k)-x(k))/R(k,k);
        end
    x %输出x
    else
        disp(['Oh man! the size of the A is not support for the equation !']);
    end
else
    disp(['OK fine, have a nice day!']);
end
```

代码流程解释：

输入矩阵后判断行数与列数大小，若行数小于列数返回error提醒；行数等于列数则继续输入向量$b$；行数大于列数直接开始进行计算。

### 1.3. 算例及结果

>使用豪斯霍尔德变换求解方程Ax=b
>$$
>A=\begin{bmatrix}5 & 4 & 7 & 5 & 6 & 7 & 5\\4 &  12& 8 & 7 &8 & 8 & 6\\7 & 8 & 10 & 9 & 8 & 7 & 7\\5 & 7 & 9 & 11 & 9 & 7 & 5\\6 & 8 & 8 & 9 &10 & 8 & 9\\7 & 8 & 7 & 7 & 8 & 10 & 10 \\5 & 6 & 7 & 5 & 9 & 10 & 10\end{bmatrix},b=\begin{bmatrix} 39\\53\\56\\53\\58\\57\\52 \end{bmatrix}
>$$

计算结果：

Q =

  -0.3333  0.3372  -0.2877  0.4367  0.0982  0.2222  -0.6653

  -0.2667  -0.9120  0.0136  0.2462  0.1181  0.0706  -0.1319

  -0.4667  0.1498  -0.1961  0.1407  0.5704  -0.4446  0.4225

  -0.3333  -0.0657  -0.5692  -0.6035  -0.0584  0.4236  0.1166

  -0.4000  -0.0251  0.1360  -0.3778  -0.3815  -0.6213  -0.3829

  -0.4667  0.1498  0.7294  -0.1560  0.1547  0.4200  0.0550

  -0.3333  0.0686  -0.0640  0.4445  -0.6915  0.0778  0.4452

 

R = 

 -15.0000 -19.5333 -20.9333 -19.9333 -21.6000 -21.2667 -19.8000

​     0  -7.4464  -2.6996  -2.9055  -3.0995  -2.3624  -1.1066

​     0     0  -3.2416  -3.3580  -1.6883  0.4811  2.3036

​     0     0     0  -3.7342  -0.7405  1.6506  1.1139

​     0     0     0     0  -3.2303  -3.2048  -3.9019

​     0     0     0     0     0   1.9801  -0.0738

​     0     0     0     0     0     0  0.9786

 enter vector b:[39;53;56;53;58;57;52] 

x = 

  1.0000

  1.0000

  1.0000

  1.0000

  1.0000

  1.0000

  1.0000

## 2. 共轭梯度法求解线性方程组 

### 2.1. 算法原理与程序框图

共轭梯度法是一种迭代下降算法，对n阶对称正定矩阵线性方程组构造k个线性无关的搜索方向d，使得没有迭代误差的情况下最多迭代n次即可得到方程组的解。考虑舍入误差需要加一个停止判定条件，即：$||r^{(k+1)}\leq \epsilon||$。

当A非对称正定时，可以把对应方程组化为具有对称正定系数矩阵的线性代数方程组：$A^TAx=A^tb$。  

### 2.2. 代码及说明

```matlab
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
```

```matlab
function y=isPosdefmat(A)
[m,n]=size(A);
if A'==A
    y=1;
else
    y=0;
end
e=eig(A);
m=0;
for i=1:n
    if e(i)>0
        m=m+1;
    else
        break
    end
end
if m==n||m==0
    y=y+1;
end
if y==2
    y=1;
else
    y=0;
end
```

本题采用main.m函数调用isPosdefmat.f函数来实现代码的可重用性。isPosdefmat函数主要判断输入矩阵是否为对称正定矩阵。详细流程以及注意事项见代码注释。

### 2.3. 算例及结果

使用共轭梯度法求解线性方程组$Ax=b$，其中：
$$
A=\begin{bmatrix}
-2 & 1 & \dots & \dots&\dots\\
1&-2 & 1 & \dots &\dots\\
\dots & \dots & \dots & \dots&\dots\\
\dots & \dots&1&-2&1\\
\dots & \dots&\dots&-2&1\\
\end{bmatrix},
b=\begin{bmatrix}
-1\\0\\\dots\\0\\-1
\end{bmatrix}
$$
A的阶数分别取100、200、400，考察计算结果可靠性。

1. 100

   ans =

     **50**

   x =

   1.0000

   > （注：x为100维向量，各分量均为1）

   1.0000

   1.0000

2. 200

   ans =

     **100**

   x =

   1.0000

   > （注：x为200维向量，各分量均为1）

   1.0000

   1.0000

3. 400

   

   ans =

     **200**

   x =

   1.0000

   > （注：x为400维向量，各分量均为1）

   1.0000

   1.0000

综上结果：解是可靠的精确解，迭代次数增加是线性的。

## 3. 三次样条插值   

### 3.1. 算法原理与程序框图

三次样条插值（Cubic Spline Interpolation）简称Spline插值，是通过一系列形值点的一条光滑曲线，数学上通过求解三弯矩方程组得出曲线函数组的过程。实际计算时还需要引入边界条件才能完成计算。

程序框图



### 3.2. 代码及说明

```matlab
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
```

首先输入插值区间，接着依此输入x,y需要拟合的data（可以更改接口传入txt以便适应大数据量的拟合）。在三种插值边界条件中选一种进行计算。程序首先代入初始数据后进行三次样条插值计算的迭代并最终输出绘制的函数图象。

### 3.3. 算例及结果

算例：x=[-3,-1,0,3,4];y=[7,11,26,56,29];输入边界条件为[a,b]=[-3,4]。

>**输入：**
>
>Please enter endpoints of the interval [a,b]:[-3,4]
>
>Please enter the points:[-3;-1;0;3;4]
>
>Please enter the relative functional value:[7;11;26;56;29]
>
>Please choose the kind of the boundary condition:(1 or 2 or 3)1
>
>Please enter f'(a):0
>
>Please enter f'(b):0
>
>**输出：**
>
>When x∈[ -3.00, -1.00]
>
> 
>
>S =
>
> 
>
>X^3 + 9*X^2 + 25*X + 28
>
> 
>
>When x∈[ -1.00, 0.00]
>
> 
>
>S =
>
> 
>
>\- X^3 + 3*X^2 + 19*X + 26 
>
>When x∈[ 0.00, 3.00]
>
>S =
>
>\- 2*X^3 + 3*X^2 + 19*X + 26
>
>When x∈[ 3.00, 4.00]
>
>S =
>
>5*X^3 - 60*X^2 + 208*X - 163

## 4. 龙贝格积分

### 4.1. 算法原理与程序框图



### 4.2. 代码及说明

```matlab
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
```

