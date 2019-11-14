function img = generateFigure(imgW,imgH)
x1=linspace(0,2*pi);
y1=sin(x1);
x2=linspace(0,2*pi);
y2=cos(x2);
x3=linspace(0,2*pi);
y3=(x3).^2;
plot(x1,y1,'r',x2,y2,'g',x3,y3,'b');
fig = gcf;%���ص�ǰͼ���ľ�������ͼ�������ڣ��� gcf ������һ��ͼ������������������ʹ��ͼ�������ѯ���޸�ͼ�������ԡ�
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 imgW/96 imgH/96]; %1 inch��Ӧ96�����ص㣻left bottom width height
print('test1','-dpng','-r0');%Ҫ��������Ļ�ϴ�С��������Ϊ��λ��ƥ������������ʹ�� print ����ʱ���� '-r0' �ֱ���ѡ��
img=imread("test1.png",'png');
% imshow(img);
end
