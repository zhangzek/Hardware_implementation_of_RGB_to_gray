clc
clear all
%mcode to create a coe file
%���ɵ�������һ���н��ж�ȡ��
[file1,path1] = uigetfile({'*.jpg';'*.png'},'ѡ��ͼƬ');
%src = imread([path1,file1]);
img = imread([path1,file1]);
R = img(:,:,3);  

[m,n]=size(R);
N=m*n;                                                       %���ݳ��ȣ����洢�������
word_len=8;                                                  %ÿ����Ԫ��λ��
data=reshape(R',1,N);                                   %����ض��ľ���1��n��

fid=fopen('512x512_pic_b.coe','wt');                                  %��lena.coe�ļ�
fprintf(fid,'MEMORY_INITIALIZATION_RADIX=16;\n');            %�����в��䣬������
fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');              %����

for i=1:N-1
    fprintf(fid,'%x,\n',data(i));
end
fprintf(fid,'%x;\n',data(N));                                 %ÿ�����ݻس�
fclose(fid);
