%ͳ�������˲���
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
f2=double(f2);
%f2 = double(f2);          %��ʱimshow(f2)���ֵ���ȫ�������㣬�������
%��Щ����֧��double�ͣ�����֧��uint8���������ͣ�����Ҫת��
%imshow()��ʾͼ��ʱ��double������Ϊ��0~1��Χ�ڣ�������1ʱ������ʾΪ��ɫ����imshow��ʾuint8��ʱ��0~255��Χ������������ķ�Χ��0-255֮���double�����ݾͱ�����������ʾΪ��ɫͼ���ˡ�
%         imshow(I/max(max(I)));    ----------��ͼ�����ת����0-1֮��                
% 
%         imshow(I,[]);       -----------�Զ��������ݵķ�Χ�Ա�����ʾ
[M,N] = size(f2);

n=5;     %ģ���С

max = ordfilt2(f2, n^2, ones(n, n), 'symmetric');


figure;
subplot(1,3,1),imshow(img),title('ԭͼ')
subplot(1,3,2),imshow(f2,[]),title('�����˹�뽷������');  %��ֹimshow����double�;���ȫ�Ǻڰ׵���޷���ʾͼƬ
subplot(1,3,3),imshow(max,[]),title('���ֵ�˲����');


%ͳ�������˲���