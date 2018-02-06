function [ R,C ] = row_col( value )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

R=0;
for i=-11:1:11
    k=2^i;
    if (k==abs(value))
        R=i+1;
        break;
    elseif (k>abs(value) && abs(value)>0)
        R=i;
        break;
    end
end
C=0;
if (value>0)
    C=((2^R)-1)-((2^(R-1))-1)+(value-((2^(R-1))-1));
elseif (value<0)
    C=((2^R)-1)-abs(value)+1;
else
    C=1;
end
C=C-1;
end

