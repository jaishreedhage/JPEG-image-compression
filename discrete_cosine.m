function [ J ] = discrete_cosine( I,t,Ia,Ib )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

if(t==1)
    %--compute discrete cosine transform of the image--%
    J=zeros(Ia,Ib);
    for k=1:8:Ia    
        for l=1:8:Ib
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
%--reverse the discrete cosine transform made--%
else
    J=zeros(Ia,Ib);
    for k=1:8:Ia
        for l=1:8:Ib
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
                            J(i,j)=J(i,j)+I(x,y)*Ci*Cj*cos((2*(c-1)+1)*(b-1)*pi/16)*cos((2*(z-1)+1)*(v-1)*pi/16);
                            b=b+1;
                        end
                        v=v+1;
                    end        
                    J(i,j)=J(i,j)/4;
                    c=c+1;
                end
                z=z+1;
            end
        end
    end
end
    
end