%自适应滤波器
%读入图像
img = imread('D:\课程资料\大三上\图像处理\code\lena512.bmp');
figure;
subplot(1,3,1);
imshow(img);
title('原始图像');
%分别添加加入高斯噪声和椒盐噪声
f1 = imnoise(img,'gaussian');
subplot(1,3,2)
imshow(f1);
title('添加高斯噪声');
f2 = imnoise(f1,'salt & pepper');
subplot(1,3,3)
imshow(f2);
title('再添加椒盐噪声');
f2=double(f2);
%f2 = double(f2);          %此时imshow(f2)出现的是全是噪声点，不会成像？
%有些函数支持double型，而不支持uint8的数据类型，所以要转换
%imshow()显示图像时对double型是认为在0~1范围内，即大于1时都是显示为白色，而imshow显示uint8型时是0~255范围。而经过运算的范围在0-255之间的double型数据就被不正常得显示为白色图像了。
%         imshow(I/max(max(I)));    ----------将图像矩阵转化到0-1之间                
% 
%         imshow(I,[]);       -----------自动调整数据的范围以便于显示
[M,N] = size(f2);

n=5;     %模板大小

f11 = f2;
noise=f2-double(img);   %img要转成double？否则报错
varn=var(noise(:));   %噪声方差
for i = 1:M-n+1
    for j = 1:N-n+1
        windows = f2(i:i+n-1,j:j+n-1);
        varL=var(windows(:));  %窗口方差
        ratio=varn/varL;
        meanvalue=mean(windows(:));
        
        temp=f11(i+(n-1)/2,j+(n-1)/2);
        
        f11(i+(n-1)/2,j+(n-1)/2)=temp-ratio*(temp-meanvalue);
        
    end
end



figure;
subplot(1,3,1),imshow(img),title('原图')
subplot(1,3,2),imshow(f2,[]),title('加入高斯与椒盐噪声');  %防止imshow处理double型矩阵全是黑白点而无法显示图片
subplot(1,3,3),imshow(f11,[]),title('自适应滤波结果');


%统计排序滤波器