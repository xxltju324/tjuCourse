%ͳ�������˲���
%AdaptiveMedianFilter

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
f2 = imnoise(f1,'salt & pepper');%
subplot(1,3,3)
imshow(f2);
title('����ӽ�������');
f2 = double(f2);
[M,N] = size(f2);

%%
%����Ӧ��ֵ�˲���
out = f2;  
alreadyPro = false(size(f2)); %���Ƿ���ɽ���  false����logic���飨0��������Ϊlogic��������������������ά�Ĵ�С��
Smax=5;       %��󴰿ڳߴ�
for s = 3:2:Smax    %��ʼ���ڳߴ���Ϊ3
   %�õ��ض��ĻҶ�ֵ
   zmin = ordfilt2(f2, 1, ones(s, s), 'symmetric');   %zminΪ�����f2�����ݣ���С��f2��ͬ

   %padopt(pading option)��ɶ�أ�����һ���ڱ߽��Ԫ�أ�������ʱ����û���㹻���ھӵġ����������˵�����ⲹ���ڽ����صķ�ʽ:   zeroȫ0��default���� sysmetric �������ɶԳƵľ���
   zmax = ordfilt2(f2, s * s, ones(s, s), 'symmetric');  %��һ������ָ��Ҫ����ľ������ͼƬ���ڶ�������ָ��order��ѡ��ڼ���Ԫ�ظ�ֵ���������1��ʾ���뿼�Ƿ�Χ
   zmed = medfilt2(f2, [s s], 'symmetric');  %����[s,s]ֻ��ָ������Ĵ�С
   %����B
   processB = (zmed > zmin) & (zmax > zmed) & ~alreadyPro;   %~��������ı�alreadyPro��ֵ;���������С�ȽϷ����Ǵ�Сһ�µ�logic�����ڲ���Ԫ���ǱȽϵĽ����1|0��
   %����A
   processA = (f2 > zmin) & (zmax > f2);  
   
   
   outZxy  = processB & processA;   %��ѡģ����ȷ��ָ���㲢�������ڵ���ֵ��logical����outZxy��ֵΪ1�Ķ�Ӧλ�ñ�ʾ��ԭֵ��ֵ  
   outZmed = processB & ~processA;  %��ѡģ����ȷ��ָ�����������ڵ���ֵ��������ģ�壩�е���ֵ��ֵ
   
   %����out��ֵ����ı䣿
   out(outZxy) = f2(outZxy);          %�����ڲ������Ǵ�С��ͬ��logical����ʱ�������Ƕ�ӦlogicalֵΪ��0��λ�õľ���������ɵ�һ��������???Ч���ǽ�outZxy�з�0λ�ö�Ӧ��f2��ֵ��ֵ��out�У������������䣿
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
subplot(1,3,1),imshow(img),title('ԭͼ');
subplot(1,3,2),imshow(f2,[]),title('�����˹�뽷������');
subplot(1,3,3),imshow(imgOut);



title('����Ӧ��ֵ�˲����');




