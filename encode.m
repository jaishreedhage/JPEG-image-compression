function [ A2 ] = encode(zig_zag,A2  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[R,C]=row_col(zig_zag(1));
k=0;
for i=1:1:R
    k=k+2^i;
end

D1=dec_to_bin(k);
D2=dec_to_bin(C);
A2=insert_to_array(A2,D1,-1,1);
A2=insert_to_array(A2,D2,R,1);
zeroes=0;
for i=2:1:length(zig_zag)
    if zig_zag(i)==0
        zeroes=zeroes+1;
    else
        [R,C]=row_col(zig_zag(i));
        if(zeroes<16)
            A2=insert_to_array(A2,R_Z(R,zeroes),-1,2);
            A2=insert_to_array(A2,dec_to_bin(C),R,2);
        else
            for l=1:1:floor(zeroes/15)
                A2=insert_to_array(A2,11111111001,-1,2);
            end
            zeroes=zeroes-(floor(zeroes/15)*15);
            A2=insert_to_array(A2,R_Z(R,zeroes),-1,2);
            A2=insert_to_array(A2,dec_to_bin(C),R,2);
        end
        zeroes=0;
    end
end
if zeroes~=0
    A2=insert_to_array(A2,1010,-1,2);
end

end