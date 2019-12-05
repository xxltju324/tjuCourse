%均值滤波器

%InverseHarmonicMeanFilter


%读入图像
img = imread('D:\课程资料\大三上\图像处理\code\lena512.bmp');
figure;
subplot(1,3,1),imshow(img),title('原始图像');

%分别添加加入高斯噪声和椒盐噪声
f1 = imnoise(img,'gaussian');
subplot(1,3,2),imshow(f1),title('添加高斯噪声');

f2 = imnoise(f1,'salt & pepper');
subplot(1,3,3),imshow(f2),title('再添加椒盐噪声');

f2 = double(f2);
[M,N] = size(f2);


n = 5; %模板大小
Q=-1;    %指数
%Q=0 算术均值滤波器
%Q=-1 逆谐波均值滤波器
f11 = f2;
for i = 1:M-n+1
    for j = 1:N-n+1
        windows = f2(i:i+n-1,j:j+n-1);
        %s1=sum(g1(:))
        win1=windows.^(Q+1);
        win2=windows.^Q;
        sum1=sum(win1(:));
        sum2=sum(win2(:));
      
        %中心点的值用子图像的几何均值代替
        f11(i+(n-1)/2,j+(n-1)/2) =sum1/sum2; 
    end
end
out = uint8(f11);

figure;
subplot(1,3,1),imshow(img),title('原图')
subplot(1,3,2),imshow(f2,[]),title('加入高斯与椒盐噪声');  %防止imshow处理double型矩阵全是黑白点而无法显示图片
subplot(1,3,3),imshow(out),title('逆谐波均值滤波结果');