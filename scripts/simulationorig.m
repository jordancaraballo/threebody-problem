% mu = 0.5 represents equal masses
mu=0.5; x0=0.12; y0=0.00; x0p=0.0; y0p=-1.0; tf=30;
[t,y]=ode45(@(t,u)prob3b(t,u,mu),[0,tf],[x0,x0p,y0,y0p],ods);

xorb = y(:,1);
yorb = y(:,3);

hold on    
% plot both planets
plot(mu, 0, 'ko', 'linewidth',5) 
plot(mu-1,0,'ko', 'linewidth',5)
plot(xorb,yorb)
xlabel('x'); ylabel('y');
title(['mu=', num2str(mu), ', x0=' num2str(x0), ', y0=' num2str(y0), ', x0p=' num2str(x0p),   ', y0p=' num2str(y0p), ', tf=' num2str(tf)])
     
     