N=input('length of sequence N = ');
t=[0:N-1];
M=400;
s=decimate(s,10);
noi=decimate(noi,10);
s=s./max(s);
noi=noi./max(noi);
w=zeros(M,1); 
a=zeros(M,1);
mu=input('mu = ');
for i=1:N
  for k=M:-1:2
 a(k)=a(k-1);
  end;
  a(1)=noi(i)
 yd(i) = w' * a; 
 e(i) = s(i) -yd(i);  
 w = w + mu * e(i) * a;
   end;
subplot(221),plot(t,s),ylabel('Input Signal+Noise'),
subplot(222),plot(t,e),ylabel('filter output'),
subplot(223),plot(t,yd),ylabel('w*noi output');

z=buffer(s,2000,1600);
y=buffer(e,2000,1600);
for i=1:312
    j(i)= var(z(:,i));
    l(i)= var(y(:,i));
end
k=mean(j);
o=mean(l);
NF=10*log10(k/o);