function [ R ] = real_uint8( X , Y , Z)
R=zeros(1,6);

N=X;
N=round(N*15000*10000);
%N=floor(N*15000*10000);
if(N>=0)
    R(1,1)=floor((N-mod(N,256))/256);
    R(1,2)=mod(N,256);
else
   N=2^16+N ;
   R(1,1)=floor((N-mod(N,256))/256);
   R(1,2)=mod(N,256); 
end

N=Y;
N=round(N*15000*10000);
%N=floor(N*15000*10000);
if(N>=0)
    R(1,3)=floor((N-mod(N,256))/256);
    R(1,4)=mod(N,256);
else
   N=2^16+N ;
   R(1,3)=floor((N-mod(N,256))/256);
   R(1,4)=mod(N,256); 
end

N=Z;
N=round(N*15000*10000);
%N=floor(N*15000*10000);
if(N>=0)
    R(1,5)=floor((N-mod(N,256))/256);
    R(1,6)=mod(N,256);
else
   N=2^16+N ;
   R(1,5)=floor((N-mod(N,256))/256);
   R(1,6)=mod(N,256); 
end

end

