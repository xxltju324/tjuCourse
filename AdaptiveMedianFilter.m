%统计排序滤波器
%AdaptiveMedianFilter

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
f2 = imnoise(f1,'salt & pepper');%
subplot(1,3,3)
imshow(f2);
title('再添加椒盐噪声');
f2 = double(f2);
[M,N] = size(f2);

%%
%自适应中值滤波器
out = f2;  
alreadyPro = false(size(f2)); %看是否完成进程  false生成logic数组（0），参数为logic数组的行数与列数或则各维的大小。
Smax=5;       %最大窗口尺寸
for s = 3:2:Smax    %起始窗口尺寸设为3
   %得到特定的灰度值
   zmin = ordfilt2(f2, 1, ones(s, s), 'symmetric');   %zmin为处理后f2的数据，大小与f2相同

   %padopt(pading option)是啥呢？试想一下在边界的元素，他们有时候是没有足够的邻居的。这个参数就说明了这补齐邻近像素的方式:   zero全0（default）， sysmetric 这是生成对称的镜像
   zmax = ordfilt2(f2, s * s, ones(s, s), 'symmetric');  %第一个参数指定要处理的矩阵或则图片；第二个参数指定order即选择第几个元素赋值；领域矩阵，1表示放入考虑范围
   zmed = medfilt2(f2, [s s], 'symmetric');  %这里[s,s]只是指定领域的大小
   %进程B
   processB = (zmed > zmin) & (zmax > zmed) & ~alreadyPro;   %~操作不会改变alreadyPro的值;两个矩阵大小比较返回是大小一致的logic矩阵，内部的元素是比较的结果（1|0）
   %进程A
   processA = (f2 > zmin) & (zmax > f2);  
   
   
   outZxy  = processB & processA;   %所选模板正确且指定点并非领域内的最值；logical矩阵outZxy中值为1的对应位置表示按原值赋值  
   outZmed = processB & ~processA;  %所选模板正确但指定点是领域内的最值；按领域（模板）中的中值赋值
   
   %这里out的值竟会改变？
   out(outZxy) = f2(outZxy);          %矩阵内部参数是大小相同的logical数组时，返回是对应logical值为非0的位置的矩阵数据组成的一列向量。???效果是将outZxy中非0位置对应的f2的值赋值到out中，其他保留不变？
   out(outZmed) = zmed(outZmed);   
   alreadyPro = alreadyPro | processB;  
   if all(alreadyPro(:))  
      break;  
   end  
end  
out(~alreadyPro) = zmed(~alreadyPro);  
imgOut = uint8(out);
%%
 
figure;
subplot(1,3,1),imshow(img),title('原图');
subplot(1,3,2),imshow(f2,[]),title('加入高斯与椒盐噪声');
subplot(1,3,3),imshow(imgOut);



title('自适应中值滤波结果');




