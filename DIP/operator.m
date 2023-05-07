clc
clear all
close all

P=[1 2 3 4 5];
    P1=sum(P(1:2))
    P2=sum(P(3:5))
    u1=sum((1:2)'.*P(1:2))/P1
    u2=sum((3:5)'.*P(3:5))/P2
X=200000000000000
    P1=sum(P(1:2))
    P2=sum(P(3:5))
    u1=sum((1:2).*P(1:2))/P1
    u2=sum((3:5).*P(3:5))/P2