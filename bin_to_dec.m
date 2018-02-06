function [ dec ] = bin_to_dec( bin )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
dec=0;i=0;
while(bin>0)
    r=mod(bin,10);
    dec=dec+r*2^i;
    bin=floor(bin/10);
    i=i+1;
end
end

