
%ͳ�������˲���
%ModifiedAlphaMeanFilter

%����ͼ��
img = imread('D:\�γ�����\������\ͼ����\code\lena512.bmp');
figure;
subplot(1,3,1);
imshow(img);
title('ԭʼͼ��');
%�ֱ���Ӽ����˹�����ͽ�������
f1 = imnoise(img,'gaussian');
subplot(1,3,2)
imshow(f1);
title('��Ӹ�˹����');
f2 = imnoise(f1,'salt & pepper');
subplot(1,3,3)
imshow(f2);
title('����ӽ�������');
f2 = double(f2);
[M,N] = size(f2);



%�����İ�������ֵ�˲���
n = 5; %ģ���С
d = 5; %ȥ����ֵ�Ҷ�ֵ�ĸ���
out = f2;
for i = 1:M-n+1
    for j = 1:N-n+1
        g3 = f2(i:i+n-1,j:j+n-1);
        g3 = sort(g3(:)); %�������ڵ����ص��������
        min_num = ceil(d/2); %ȥ����С�Ҷ�ֵ�ĸ���
        max_num = floor(d/2); %ȥ�����Ҷ�ֵ�ĸ���
        %ȥ��d����ֵ�Ҷȼ�����������ֵ
        g3(1:min_num) = zeros(min_num,1);
        g3(n*n-max_num+1:n*n) = zeros(max_num,1);
        s3 = sum(g3);
        %���ĵ��ֵ����ͼ���������ֵ����
        out(i+(n-1)/2,j+(n-1)/2) = s3/(n*n-d); 
    end
end
img4 = uint8(out);
figure;
subplot(1,3,1),imshow(img),title('ԭͼ');
subplot(1,3,2),imshow(f2,[]),title('�����˹�뽷������');
subplot(1,3,3),imshow(img4);
title('�����İ�������ֵ�˲����');




