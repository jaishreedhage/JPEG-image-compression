function [ A ] = insert_to_array( A,s,r,t)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
len=length(A);
if(t==1)  %--dc coeff encode
    if(r==-1)
        
        if(s==0)
            A(len+1)=0;
        else
            len=len+count(s);
        end
    else
        if(r>0)
            if(s==0)
                A(len+r)=0;
            else
                len=len+r;
            end
        else
            A(len+1)=0;
        end
    end
end
if(t==2)  %--ac coeff encode
    if(r==-1)
        if(s==0)
            A(len+2)=0;
        elseif(s==1)
            A(len+1)=0;
            len=length(A)+count(s);
        else
            len=len+count(s);
        end
    else
        if(s==0)
            A(len+r)=0;
        else
            len=len+r;
        end
    end
end
while(s>0)
   A(len)=mod(s,10);
   s=floor(s/10);
   len=len-1;
end
end


