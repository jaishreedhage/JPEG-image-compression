I=imread('C:\Users\Jaishree\Pictures\Robomanipal.jpg');
I=rgb2gray(I);
I=double(I);
J=zeros(375,384);
C=I;
for k=1:8:368    
    for l=1:8:384
        z=1;
        for i=k:1:k+7
            c=1;
            for j=l:1:l+7
               v=1;
               for x=k:1:k+7
                   b=1; 
                   for y=l:1:l+7                       
                       J(i,j)=J(i,j)+I(x,y)*cos((2*(b-1)+1)*(c-1)*pi/16)*cos((2*(v-1)+1)*(z-1)*pi/16);
                       b=b+1;
                   end
                   v=v+1;
               end               
               if ((z-1)==0)
                   Ci=1/sqrt(2);
               else
                   Ci=1;
               end
               if ((c-1)==0) 
                   Cj=1/sqrt(2);
               else
                   Cj=1;
               end
               J(i,j)=J(i,j)*Ci*Cj/4;
               c=c+1;
            end
               z=z+1;               
        end        
    end    
end
CC=J;
Q=[16 11 10 16 24 40 51 61;
   12 12 14 19 26 58 60 55;
   14 13 16 24 40 57 69 56;
   14 17 22 29 51 87 80 62;
   18 22 37 56 68 109 103 77;
   24 35 55 64 81 104 113 92;
   49 64 78 87 103 121 120 101;
   72 92 95 98 112 100 103 99];

for i=1:8:368
    for j=1:8:384
        J(i:i+7,j:j+7)=J(i:i+7,j:j+7)./Q;
    end
end
J=round(J);

AB=J;
count=0;
for i=1:368
    for j=1:384
        if J(i,j)==0
            count=count+1;
        end
    end
end
for i=1:8:368
    for j=1:8:384
        J(i:i+7,j:j+7)=J(i:i+7,j:j+7).*Q;
    end
end
I2=zeros(375,384);
for k=1:8:368
    for l=1:8:384
        z=1;
        for i=k:1:k+7
            c=1;
            for j=l:1:l+7
                v=1;
                for x=k:1:k+7
                    b=1;
                    for y=l:1:l+7 
                        if ((v-1)==0)
                            Ci=1/sqrt(2);
                        else
                            Ci=1;
                        end
                        if ((b-1)==0)
                           Cj=1/sqrt(2);
                        else
                           Cj=1;
                        end
                        I2(i,j)=I2(i,j)+J(x,y)*Ci*Cj*cos((2*(c-1)+1)*(b-1)*pi/16)*cos((2*(z-1)+1)*(v-1)*pi/16);
                        b=b+1;
                    end
                    v=v+1;
                end        
                I2(i,j)=I2(i,j)/4;
                c=c+1;
            end
            z=z+1;
        end
    end
end
I=uint8(I);
I2=uint8(I2);