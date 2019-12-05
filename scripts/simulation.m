% Global variables
ods=odeset('AbsTol',1.0e-6,'MaxStep',0.01);
% mu = 0.5 represents equal masses
mu=0.5; x0=0.32; y0=0.00; x0p=0.0; y0p=-1.0; tf=30;
[t,y]=ode45(@(t,u)prob3b(t,u,mu),[0,tf],[x0,x0p,y0,y0p],ods);

xorb = y(:,1);
yorb = y(:,3);

xorbfirst=xorb(1);
yorbfirst=yorb(1);

plot(xorbfirst,yorbfirst)
xlabel('x'); ylabel('y');
title(['mu=', num2str(mu), ', x0=' num2str(x0), ', y0=' num2str(y0), ', x0p=' num2str(x0p),   ', y0p=' num2str(y0p), ', tf=' num2str(tf)])
hold on

for k = 1:length(xorb)
   xorbfirst=xorb(1:k);
   yorbfirst=yorb(1:k);
   plot(xorbfirst,yorbfirst)
   pause(.01)
end