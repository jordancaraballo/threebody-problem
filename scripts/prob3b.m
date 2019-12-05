% Numerical Analysis - 3 body problem
function f=prob3b(t,u,mu)
  f=zeros(4,1);
  denom1=((u(1)+1-mu)^2+u(3)^2)^1.5;
  denom2=((u(1)-mu)^2+u(3)^2)^1.5;
  Omx=-u(1)+mu*(u(1)+1-mu)/denom1+(1-mu)*(u(1)-mu)/denom2;
  Omy=u(3)*(-1+mu/denom1+(1-mu)/denom2);
  f(1)=u(2);
  f(2)=2*u(4)-Omx;
  f(3)=u(4);
  f(4)=-2*u(2)-Omy;