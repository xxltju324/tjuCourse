%��ֵ�˲���

%InverseHarmonicMeanFilter


%����ͼ��
img = imread('D:\�γ�����\������\ͼ����\code\lena512.bmp');
figure;
subplot(1,3,1),imshow(img),title('ԭʼͼ��');

%�ֱ���Ӽ����˹�����ͽ�������
f1 = imnoise(img,'gaussian');
subplot(1,3,2),imshow(f1),title('��Ӹ�˹����');

f2 = imnoise(f1,'salt & pepper');
subplot(1,3,3),imshow(f2),title('����ӽ�������');

f2 = double(f2);
[M,N] = size(f2);


n = 5; %ģ���С
Q=-1;    %ָ��
%Q=0 ������ֵ�˲���
%Q=-1 ��г����ֵ�˲���
f11 = f2;
for i = 1:M-n+1
    for j = 1:N-n+1
        windows = f2(i:i+n-1,j:j+n-1);
        %s1=sum(g1(:))
        win1=windows.^(Q+1);
        win2=windows.^Q;
        sum1=sum(win1(:));
        sum2=sum(win2(:));
      
        %���ĵ��ֵ����ͼ��ļ��ξ�ֵ����
        f11(i+(n-1)/2,j+(n-1)/2) =sum1/sum2; 
    end
end
out = uint8(f11);

figure;
subplot(1,3,1),imshow(img),title('ԭͼ')
subplot(1,3,2),imshow(f2,[]),title('�����˹�뽷������');  %��ֹimshow����double�;���ȫ�Ǻڰ׵���޷���ʾͼƬ
subplot(1,3,3),imshow(out),title('��г����ֵ�˲����');