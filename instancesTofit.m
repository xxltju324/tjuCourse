% x=[2,4,5,6,6.8,7.5,9,12,13.3,15];
% y=[-10,-6.9,-4.2,-2,0,2.1,3,5.2,6.4,4.5];

x=1:10;y=x.*3+1; %原始函数y=3x+1
gaussX=[1.5,3.5,6.5];gaussY=[randn(),randn(),randn()];   %加入三个符合高斯分布的点
outlierX=[1.78,8.9];outlierY=[1,20];
x=[x,gaussX,outlierX];y=[y,gaussY,outlierY];      %将干扰点与原始点混合

x=[1,1.5,1.78,2,3,3.5,4,5,6,6.5,7,8,8.9,9,10];y=[4,randn(),1,7,10,randn(),13,16,19,randn(),22,25,20,28,31];
for n=2:5   %包含5
    f=myLeastSquares(n,x,y);
   
    
    subplot(2,2,n-1); 
    %plot(x,f,'r',x,y,'b*');         %plot绘图，x坐标得升序排列
    
    plot(x,f,'r');      %hold on应放在第一个plot后面，plot绘图会清除之前留在对应图窗的图像
    hold on;
    plot(x,y,'b*');    %用星号标注点
    hold off
    title([num2str(n-1),'次拟合'],'color','m');   %标题要放后面题写；先画图后有标题;m表示品红
end

%suptitle('不同次数方程曲线拟合结果，从1到4阶')
%ctl i格式化代码


