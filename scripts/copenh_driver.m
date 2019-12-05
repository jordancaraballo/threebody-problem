% Copenhagen problem driver
mu=0.5; x0=0.49; y0=0; x0p=0; 
r0=abs(x0-mu);
K=sqrt(r0^4+0.5*r0);
y0p=r0-K/r0;
tf=30;
opt=odeset('AbsTol',1.0e-6,'RelTol',1.0e-6);
[t,y]=ode45(@(t,u)copenh(t,u,mu),[0,tf],[x0,x0p,y0,y0p],opt);
hold on
plot(mu, 0, 'ko', 'linewidth',5) 
plot(y(:,1),y(:,3))
axis equal
xlabel('x')
ylabel('y')
title(['mu=', num2str(mu), ', x0=' num2str(x0), ', y0=' num2str(y0), ', x0p=' num2str(x0p),   ', y0p=' num2str(y0p), ', tf=' num2str(tf)])