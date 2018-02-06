function [ s ] = dec_to_bin(k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
i=0;
s=0;
if(k>=1)
    while(k>=1)
        j=10^i;
        r=mod(k,2);
        k=floor(k/2);
        s=(r*j)+s;
        i=i+1;
    end
    
elseif (k==0)
    s=0;
end
end

