function img = generateFigure(imgW,imgH)
x1=linspace(0,2*pi);
y1=sin(x1);
x2=linspace(0,2*pi);
y2=cos(x2);
x3=linspace(0,2*pi);
y3=(x3).^2;
plot(x1,y1,'r',x2,y2,'g',x3,y3,'b');
fig = gcf;%返回当前图窗的句柄。如果图窗不存在，则 gcf 将创建一个图窗并返回其句柄。可以使用图窗句柄查询和修改图窗的属性。
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 imgW/96 imgH/96]; %1 inch对应96个像素点；left bottom width height
print('test1','-dpng','-r0');%要生成与屏幕上大小（以像素为单位）匹配的输出，请在使用 print 函数时包含 '-r0' 分辨率选项
img=imread("test1.png",'png');
% imshow(img);
end
