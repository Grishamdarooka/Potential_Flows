clear all; close all; clc

% This program simulates the 
% Flow over a non lifting cylinder

mu = 1; % doublet strength
U = 1; %Free stream velocity parallel to x axis

R = sqrt(mu/(2*pi*U)); %Radius of circular cylinder
theta = 0:2*pi/100:2*pi;

xc = R*cos(theta);
yc = R*sin(theta);

% Grid
x = -2:0.02:2;
y = -2:0.02:2;

for m = 1:length(x)
    for n = 1:length(y)
        X(m,n) = x(m);
        Y(m,n) = y(n);

        % Stream Function
        psi_nonlifting_cy(m,n) = U*y(n) - (mu*y(n)/(2*pi))/(x(m)^2 + y(n)^2);

        % potential Function
        phi_nonlifting_cy(m,n) = U*x(m) + (mu*x(m)/(2*pi))/(x(m)^2 + y(n)^2);
    end
end

figure(1)
plot(X,Y,'-k',X',Y','-k')
xlabel('X')
ylabel('y')
title('Base Mesh')

figure(2)
% Streamlines
% contour(X,Y,psi_nonlifting_cy,-3:0.1:3,'k','LineWidth',2)
contour(X,Y,psi_nonlifting_cy,-3:0.1:3,'LineWidth',1.5)
hold on
plot(xc,yc,'k','LineWidth',1.5);
fill(xc,yc,'k')
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('Streamlines')
axis square
hold off

figure(3)
% Psi-Phi Mesh
contour(X,Y,phi_nonlifting_cy,-3:0.1:3,'r','LineWidth',1.5)
hold on
contour(X,Y,psi_nonlifting_cy,-3:0.1:3,'k','LineWidth',1.5)
plot(xc,yc,'k','LineWidth',2);
fill(xc,yc,'k')
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('\psi - \phi Mesh')
axis square
hold off

figure(4)
contourf(X,Y,psi_nonlifting_cy,-3:0.1:3,'LineWidth',1.5)
hold on
plot(xc,yc,'k','LineWidth',2);
fill(xc,yc,'k')
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('\psi - \phi Mesh')
axis square
hold off