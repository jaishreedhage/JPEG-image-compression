function [ P2,m ] = decode( P,P2,m,p2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

len=length(P);
cunt=0;
for j=m:len
    [row_no,zeroes]=check_coeff(P(m:j),0);
    if row_no~=-1
        col_no=0;k=0;
        temp=P(j+1:j+row_no);
        for i=length(temp):-1:1
            col_no=col_no+temp(i)*2^k;
            k=k+1;
        end
        if(col_no<abs((2^row_no)-1)-abs((2^(row_no-1))-1))
            P2(p2,cunt+1)=-((2^row_no)-1)+col_no;
            cunt=cunt+1;
        elseif(row_no==0 && col_no==0)
            j=j+1;
            P2(p2,cunt+1)=0;
            cunt=cunt+1;
        else
            P2(p2,cunt+1)=((2^(row_no-1))-1)+col_no-(abs((2^row_no)-1)-abs((2^(row_no-1))-1))+1;
            cunt=cunt+1;
        end
        break;
    end
end

i=j+1+row_no;

for j=i:1:len
    [row_no,zeroes]=check_coeff(P(i:j),1);
    if row_no~=-1
        if((j-i)==10 & P(i:j)==[1,1,1,1,1,1,1,1,0,0,1])
            P2(p2,cunt+15)=0;
            cunt=cunt+15;
            i=j+1;
        else
            col_no=0;k=0;
            temp=P(j+1:j+row_no);
            for i=length(temp):-1:1
                col_no=col_no+temp(i)*2^k;
                k=k+1;
            end
            if(zeroes>0)
                P2(p2,cunt+zeroes)=0;
            end
            cunt=cunt+zeroes;
            if(col_no<abs((2^row_no)-1)-abs((2^(row_no-1))-1))
                P2(p2,cunt+1)=-((2^row_no)-1)+col_no;
                cunt=cunt+1;
            else
                P2(p2,cunt+1)=((2^(row_no-1))-1)+col_no-(abs((2^row_no)-1)-abs((2^(row_no-1))));
                cunt=cunt+1;
            end
            i=j+1+row_no;
        end
    elseif ((j-i)==10 & P(i:j)==[1,1,1,1,1,1,1,1,0,0,1])
        P2(p2,cunt+15)=0;
        cunt=cunt+15;
        i=j+1;
    elseif ((j-i)==3 & P(i:j)==[1,0,1,0])
        P2(p2,64)=0;
        m=j+1;
    end 
end

end