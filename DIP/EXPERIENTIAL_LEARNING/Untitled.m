clc
clear all
close all
A=[1 2 3;4 5 6;7 8 9];
[M N]=size(A);
[med]=calc_median(A,M,N,3);
med
