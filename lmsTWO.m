N=input('length of sequence N = ');
t=[0:N-1];
M=10
w0=1;  w1=10; 
d=sin(2*pi*[1:N]*w0./100);          
n=TWO;
x=d+n';
w=zeros(M,1); 
a=zeros(M,1);
mu=input('mu = ');
for i=1:N
  for k=M:-1:2
 a(k)=a(k-1);
  end;
  a(1)=n(i)
 yd(i) = w' * a; 
 e(i) = x(i) -yd(i);  
 w = w + mu * e(i) * a;
   end;
subplot(221),plot(t,d),ylabel('Desired Signal'),
subplot(222),plot(t,x),ylabel('input to system'),
subplot(223),plot(t,e),ylabel('Error-desired output'),
subplot(224),plot(t,yd),ylabel('w*a output');
NF=10*log10(sum((var(x))/(var(e))));