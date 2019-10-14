clc
clear all
%mcode to create a coe file
%���ɵ�������һ���н��ж�ȡ��
[file1,path1] = uigetfile({'*.jpg';'*.png'},'ѡ��ͼƬ');
%src = imread([path1,file1]);
img = imread([path1,file1]);
I_gray = rgb2gray(img);
[m, n] = size(I_gray);
subplot(2, 3, 4), imshow(I_gray), title('img-rgb2gray-matlab')
subplot(2, 3, 2), imshow(img), title('img-RGB')

rgb2gray_v_load = load('.\rgb2gray_512x512_v.txt'); % verilog ������rgb2gray����
rgb2gray_v = reshape(rgb2gray_v_load, n, m);
rgb2gray_v = uint8(rgb2gray_v');
 
diff = I_gray - rgb2gray_v
subplot(2, 3, 6), imshow(rgb2gray_v), title('img-rgb2gray-verilog');
a = mean(diff);
b=mean(a)