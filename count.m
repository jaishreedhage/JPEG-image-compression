function [ s ] = count(x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
s=0;
while(x>0)
    s=s+1;
    x=floor(x/10);
end
end

