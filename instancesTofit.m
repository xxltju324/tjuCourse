% x=[2,4,5,6,6.8,7.5,9,12,13.3,15];
% y=[-10,-6.9,-4.2,-2,0,2.1,3,5.2,6.4,4.5];

x=1:10;y=x.*3+1; %ԭʼ����y=3x+1
gaussX=[1.5,3.5,6.5];gaussY=[randn(),randn(),randn()];   %�����������ϸ�˹�ֲ��ĵ�
outlierX=[1.78,8.9];outlierY=[1,20];
x=[x,gaussX,outlierX];y=[y,gaussY,outlierY];      %�����ŵ���ԭʼ����

x=[1,1.5,1.78,2,3,3.5,4,5,6,6.5,7,8,8.9,9,10];y=[4,randn(),1,7,10,randn(),13,16,19,randn(),22,25,20,28,31];
for n=2:5   %����5
    f=myLeastSquares(n,x,y);
   
    
    subplot(2,2,n-1); 
    %plot(x,f,'r',x,y,'b*');         %plot��ͼ��x�������������
    
    plot(x,f,'r');      %hold onӦ���ڵ�һ��plot���棬plot��ͼ�����֮ǰ���ڶ�Ӧͼ����ͼ��
    hold on;
    plot(x,y,'b*');    %���Ǻű�ע��
    hold off
    title([num2str(n-1),'�����'],'color','m');   %����Ҫ�ź�����д���Ȼ�ͼ���б���;m��ʾƷ��
end

%suptitle('��ͬ��������������Ͻ������1��4��')
%ctl i��ʽ������


