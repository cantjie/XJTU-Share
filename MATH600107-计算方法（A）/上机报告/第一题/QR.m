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