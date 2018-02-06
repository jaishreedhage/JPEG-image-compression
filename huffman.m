A=[3 0 0 0 0 0 0 -5;
   0 10 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0;
   0 0 0 -1 0 0 0 0;
   0 0 0 0 0 0 0 0;
   0 0 0 0 0 0 0 0;
   0 0 0 0 8 0 0 0;
   0 0 0 0 0 0 0 0];
zig_zag=[A(1,1),A(1,2),A(2,1),A(3,1),A(2,2),A(1,3),A(1,4),A(2,3),A(3,2),A(4,1),A(5,1),A(4,2),A(3,3),A(2,4),A(1,5),A(1,6),A(2,5),A(3,4),A(4,3),A(5,2),A(6,1),A(7,1),A(6,2),A(5,3),A(4,4),A(3,5),A(2,6),A(1,7),A(1,8),A(2,7),A(3,6),A(4,5),A(5,4),A(6,3),A(7,2),A(8,1),A(8,2),A(7,3),A(6,4),A(5,5),A(4,6),A(3,7),A(2,8),A(3,8),A(4,7),A(5,6),A(6,5),A(7,4),A(8,3),A(8,4),A(7,5),A(6,6),A(5,7),A(4,8),A(5,8),A(6,7),A(7,6),A(8,5),A(8,6),A(7,7),A(6,8),A(7,8),A(8,7),A(8,8)];
%zig_zag=Z(363,:);
%zig_zag2=[P2(1),P2(2),P2(6),P2(7),P2(15),P2(16),P2(28),P2(29);
 %         P2(3),P2(5),P2(8),P2(14),P2(17),P2(27),P2(30),P2(43);
  %        P2(4),P2(9),P2(13),P2(18),P2(26),P2(31),P2(42),P2(44);
   %       P2(10),P2(12),P2(19),P2(25),P2(32),P2(41),P2(45),P2(54);
    %      P2(11),P2(20),P2(24),P2(33),P2(40),P2(46),P2(53),P2(55);
     %     P2(21),P2(23),P2(34),P2(39),P2(47),P2(52),P2(56),P2(61);
      %    P2(22),P2(35),P2(38),P2(48),P2(51),P2(57),P2(60),P2(62);
       %   P2(36),P2(37),P2(49),P2(50),P2(58),P2(59),P2(63),P2(64)];
[R,C]=row_col(zig_zag(1));
k=0;
for i=1:1:R
    k=k+2^i;
end
A2=[];
D1=dec_to_bin(k);
D2=dec_to_bin(C);
A2=insert_to_array(A2,D1,-1,1);
%disp(A2);
A2=insert_to_array(A2,D2,R,1);
%disp(A2);
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
           % disp(zeroes);
            A2=insert_to_array(A2,R_Z(R,zeroes),-1,2);
           % disp(A2);
            A2=insert_to_array(A2,dec_to_bin(C),R,2);
        end
        zeroes=0;
    end
end
%disp(A2);
if zeroes~=0
    
    A2=insert_to_array(A2,1010,-1,2);
end


%---decoding--%


P=[1     1     1     1     1     1     0     1     0     1     0     0     0     1     0     1     0];
P=A2;
P2=[];
for j=1:length(P)
    [row_no,zeroes]=check_coeff(P(1:j),0);
    if row_no~=-1
       % disp(row_no);
        col_no=0;k=0;
        temp=P(j+1:j+row_no);
       % disp(temp);
        for i=length(temp):-1:1
            col_no=col_no+temp(i)*2^k;
            k=k+1;
        end
        %disp(col_no);
        if(col_no<abs((2^row_no)-1)-abs((2^(row_no-1))-1))
            P2(length(P2)+1)=-((2^row_no)-1)+col_no;
            
        elseif(row_no==0 && col_no==0)
            j=j+1;
            P2(length(P2)+1)=0;
        else
            P2(length(P2)+1)=((2^(row_no-1))-1)+col_no-(abs((2^row_no)-1)-abs((2^(row_no-1))-1))+1;
        end
        break;
    end
end   
%disp(P2);
i=j+1+row_no;

%K=P(j+1+row:length(P));
n=1;
for j=i:1:length(P)
    [row_no,zeroes]=check_coeff(P(i:j),1);
    disp([P(i:j),i,j]);
    if row_no~=-1
        if((j-i)==10 & P(i:j)==[1,1,1,1,1,1,1,1,0,0,1])
            for l=1:15
                P2(length(P2)+1)=0;
            end
            i=j+1;
        else
            col_no=0;k=0;
            %disp([i,j]);
            temp=P(j+1:j+row_no);
            for i=length(temp):-1:1
                col_no=col_no+temp(i)*2^k;
                k=k+1;
            end
            for z=1:zeroes
                P2(length(P2)+1)=0;
            end
            if(col_no<abs((2^row_no)-1)-abs((2^(row_no-1))-1))
                P2(length(P2)+1)=-((2^row_no)-1)+col_no;
            else
                P2(length(P2)+1)=((2^(row_no-1))-1)+col_no-(abs((2^row_no)-1)-abs((2^(row_no-1))));
            end
        
            i=j+1+row_no;
            %j=j+1+row_no;
            disp('ya');
        end
    elseif ((j-i)==10 & P(i:j)==[1,1,1,1,1,1,1,1,0,0,1])
        P2(length(P2)+15)=0;
        
        i=j+1;
        
        
    elseif ((j-i)==3 & P(i:j)==[1,0,1,0])
        for l=1:64-length(P2)
            P2(length(P2)+1)=0;
        end
        i=j;    
          
    end 
end

    