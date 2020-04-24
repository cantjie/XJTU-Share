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
    