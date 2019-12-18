function f=myLeastSquares(degree,x,y)  %传入的degree为整数，代表拟合函数多项式的项数，即阶数-1；当degree取2时表示直线拟合

% x=[2,4,5,6,6.8,7.5,9,12,13.3,15];
% y=[-10,-6.9,-4.2,-2,0,2.1,3,5.2,6.4,4.5];
[~,col]=size(x);

k=degree;    %阶数-1,即多项式项数

%A*q=B,q为所求系数向量
w=cell(1,k);      %元胞数组，内部元素为任意类型的数据，包含数组
for n=1:k
    w{1,n}=x.^(n-1);
end

%  A=zeros(k),B=zeros(k,1);
for n=1:k
    for m=1:k
        A(n,m)=w{1,n}*(w{1,m})';        %for循环内的变量外部可见
    end
    B(n,1)=w{1,n}*y';
end

q=A\B;  %q为一列变量，各元素为拟合函数的各项的系数

f=zeros(1,col);         
for n=1:k
    f=x.^(n-1)*q(n)+f;        %拟合函数在给定横坐标下的纵坐标
end

























% for n=1:k-1
%     X0=zeros(n+1,k);      %列的大小表示给定点的个数；行的大小表示曲线模拟的精度
%     for k0=1:k           %构造矩阵X0
%         for n0=1:n+1
%             X0(n0,k0)=x(k0)^(n+1-n0);
%         end
%     end
%     X=X0';
%     ANSS=(X'*X)\X'*y';
%     for i=1:n+1          %answer矩阵存储每次求得的方程系数，按列存储
%        answer(i,n)=ANSS(i);
%    end
%     x0=0:0.01:17;
%     y0=ANSS(1)*x0.^n    ;%根据求得的系数初始化并构造多项式方程
%     for num=2:1:n+1     
%         y0=y0+ANSS(num)*x0.^(n+1-num);
%     end
%     subplot(3,3,n)
%     plot(x,y,'r*')      %将点用红色星号标注
%     hold on            %多图共存
%     plot(x0,y0)
% end
% suptitle('不同次数方程曲线拟合结果，从1到9阶')
