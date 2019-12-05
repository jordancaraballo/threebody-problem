function f=copenh(t,u,mu)
  f=zeros(4,1);
  denom2=((u(1)-mu)^2+u(3)^2)^1.5;
  Omx=(1-mu)*(u(1)-mu)/denom2;
  Omy=u(3)*(1-mu)/denom2;
  f(1)=u(2);
  f(2)=2*u(4)-Omx;
  f(3)=u(4);
  f(4)=-2*u(2)-Omy;