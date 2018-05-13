N=input('length of sequence N = ');
t=[0:N-1];
M=10
w0=1;  w1=10; 
d=sin(2*pi*[1:N]*w0./100);          
n=randn(1,N);
x=d+n;
w=zeros(M,1); 
a=zeros(M,1);
lambda=0.98;
delta=0.9988;
p=(power(delta,-1))*eye(M,M);
for i=1:N
  for k=M:-1:2
 a(k)=a(k-1);
  end;
  a(1)=n(i)
  pi=p*a;
  k=pi./(lambda+a'*pi);
  e(i) = x(i) -w'*a;  
 w = w + k*e(i);
 p=power(lambda,-1)*p-power(lambda,-1)*(k'*a)'*p;
   end;
subplot(221),plot(t,d),ylabel('Desired Signal'),
subplot(222),plot(t,x),ylabel('Input Signal+Noise'),
subplot(223),plot(t,e),ylabel('Error-desired output');
NF=10*log10(sum((var(x))/(var(e))));