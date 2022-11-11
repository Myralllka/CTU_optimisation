clc;
clear all;
load line;
% A = [[1, 1.5, 1, 2, 1, 0,-2];
%      [6, 4, 2, 0.5, -1.5, -4, -2]];

% A = [1 2 3;
%      4 5 6];
% B = [3 2 1;
%      6 5 4];

subplot(221);
drawfitline(A);

% A=load('data/makarena1.txt')';
A=load('data/paper1.txt')';
% conn=load('data/connected_points.txt');

% [U, C, b0] = fitaff(A, 121);
% subplot(222)
% playmotion(conn,A,U*C + b0);
% subplot(223)
% plottraj2(C);
 
subplot(224)
d = erraff(A);
semilogy(d(1:end-1))

