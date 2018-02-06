function [ Z ] = zig_zag( z,t,Ia,Ib )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if(t==1)
    %--subtract subsequent DC coeff with the first DC coeff of image--%
    %--tranform blocks into zig_zag fashion--%  
    for i=1:8:Ia
        for j=1:8:Ib
            if(i==1 && j==1)
                continue;
            end
            z(i,j)=z(i,j)-z(1,1);
        end
    end
    Z=zeros(Ia*Ib/64,64);
    x=0;
    for i=1:8:Ia
        for j=1:8:Ib
            x=x+1;
            A=z(i:i+7,j:j+7);
            Z(x,:)=[A(1,1),A(1,2),A(2,1),A(3,1),A(2,2),A(1,3),A(1,4),A(2,3),A(3,2),A(4,1),A(5,1),A(4,2),A(3,3),A(2,4),A(1,5),A(1,6),A(2,5),A(3,4),A(4,3),A(5,2),A(6,1),A(7,1),A(6,2),A(5,3),A(4,4),A(3,5),A(2,6),A(1,7),A(1,8),A(2,7),A(3,6),A(4,5),A(5,4),A(6,3),A(7,2),A(8,1),A(8,2),A(7,3),A(6,4),A(5,5),A(4,6),A(3,7),A(2,8),A(3,8),A(4,7),A(5,6),A(6,5),A(7,4),A(8,3),A(8,4),A(7,5),A(6,6),A(5,7),A(4,8),A(5,8),A(6,7),A(7,6),A(8,5),A(8,6),A(7,7),A(6,8),A(7,8),A(8,7),A(8,8)];
        end
    end
%--do reverse of the above--%
else
    k=1;
    Z=zeros(Ia,Ib);
    for i=1:8:Ia
        for j=1:8:Ib
            P2=z(k,:);
            P=[P2(1),P2(2),P2(6),P2(7),P2(15),P2(16),P2(28),P2(29);
               P2(3),P2(5),P2(8),P2(14),P2(17),P2(27),P2(30),P2(43);
               P2(4),P2(9),P2(13),P2(18),P2(26),P2(31),P2(42),P2(44);
               P2(10),P2(12),P2(19),P2(25),P2(32),P2(41),P2(45),P2(54);
               P2(11),P2(20),P2(24),P2(33),P2(40),P2(46),P2(53),P2(55);
               P2(21),P2(23),P2(34),P2(39),P2(47),P2(52),P2(56),P2(61);
               P2(22),P2(35),P2(38),P2(48),P2(51),P2(57),P2(60),P2(62);
               P2(36),P2(37),P2(49),P2(50),P2(58),P2(59),P2(63),P2(64)];
            Z(i:i+7,j:j+7)=P;
            k=k+1;
        end
    end
    for i=1:8:Ia
        for j=1:8:Ib
            if(i==1 && j==1)
                continue;
            end
            Z(i,j)=Z(i,j)+Z(1,1);
        end
    end
end

end