
%统计排序滤波器
%ModifiedAlphaMeanFilter

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
f2 = double(f2);
[M,N] = size(f2);



%修正的阿尔法均值滤波器
n = 5; %模板大小
d = 5; %去掉最值灰度值的个数
out = f2;
for i = 1:M-n+1
    for j = 1:N-n+1
        g3 = f2(i:i+n-1,j:j+n-1);
        g3 = sort(g3(:)); %对邻域内的像素点进行排序
        min_num = ceil(d/2); %去掉最小灰度值的个数
        max_num = floor(d/2); %去掉最大灰度值的个数
        %去掉d个最值灰度级后求算术均值
        g3(1:min_num) = zeros(min_num,1);
        g3(n*n-max_num+1:n*n) = zeros(max_num,1);
        s3 = sum(g3);
        %中心点的值用子图像的算术均值代替
        out(i+(n-1)/2,j+(n-1)/2) = s3/(n*n-d); 
    end
end
img4 = uint8(out);
figure;
subplot(1,3,1),imshow(img),title('原图');
subplot(1,3,2),imshow(f2,[]),title('加入高斯与椒盐噪声');
subplot(1,3,3),imshow(img4);
title('修正的阿尔法均值滤波结果');




