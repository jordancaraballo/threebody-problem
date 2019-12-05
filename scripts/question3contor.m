% script to call prob3b.m for simulation
ods=odeset('AbsTol',1.0e-6,'MaxStep',0.01);
mu=0.5; x0=0.32; y0=0.00; x0p=0.0; tf=30;

for y0p=[-1.0, -1.5, -1.73, -1.78, -1.853,-1.858, -2.3, -2.31]
    [t,y]=ode45(@(t,u)prob3b(t,u,mu),[0,tf],[x0,x0p,y0,y0p],ods);
    hold on
    plot(mu, 0, 'ko', 'linewidth',5) % plot Ph
    plot(mu-1,0,'ko', 'linewidth',5) % plot Pl
    plot(y(:,1),y(:,3)); xlabel('x'); ylabel('y');
    title(['y0p=' num2str(y0p), ', mu=', num2str(mu),', x0=' num2str(x0),', y0=' num2str(y0), ', x0p=' num2str(x0p), ', tf=' num2str(tf)])

    xmax = max(y(:,1)) + 1.5; xmin = min(y(:,1)) - 1.5;
    ymax = max(y(:,3)) + 1.5; ymin = min(y(:,3)) - 1.5;
    [X,Y] = meshgrid(linspace(xmin,xmax),linspace(ymin,ymax));

    denom1 = sqrt((x0+1-mu)^2+y0^2);
    denom2 = sqrt((x0-mu)^2+y0^2);
    C = 0.5 * (x0p^2+y0p^2) - 0.5*(x0^2+y0^2) - mu/denom1 - (1-mu)/denom2;

    denom1f = sqrt((X.+1-mu).^2+Y.^2);
    denom2f = sqrt((X.-mu).^2+Y.^2);
    F = -C - 0.5*(X.^2+Y.^2) - (1-mu)./denom2f - mu./denom1f;
    
    contourf(X,Y,F,[0 0], 'linewidth',3); colormap(hot)
    hold off; input('press return to continue');
endfor