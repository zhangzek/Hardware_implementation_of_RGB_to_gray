clc
clear all
%mcode to create a coe file
%生成的数据是一行行进行读取的
[file1,path1] = uigetfile({'*.jpg';'*.png'},'选择图片');
%src = imread([path1,file1]);
img = imread([path1,file1]);
R = img(:,:,3);  

[m,n]=size(R);
N=m*n;                                                       %数据长度，即存储器的深度
word_len=8;                                                  %每个单元的位数
data=reshape(R',1,N);                                   %变成特定的矩阵，1行n列

fid=fopen('512x512_pic_b.coe','wt');                                  %打开lena.coe文件
fprintf(fid,'MEMORY_INITIALIZATION_RADIX=16;\n');            %这两行不变，进制数
fprintf(fid,'MEMORY_INITIALIZATION_VECTOR=\n');              %数据

for i=1:N-1
    fprintf(fid,'%x,\n',data(i));
end
fprintf(fid,'%x;\n',data(N));                                 %每个数据回车
fclose(fid);
