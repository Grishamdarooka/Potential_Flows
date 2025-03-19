clear all; close all; clc

% This program simulates the doublet flow

gamma = 1; % vortex strength

% Grid
x = -2:0.02:2;
y = -2:0.02:2;

for m = 1:length(x)
    for n = 1:length(y)
        X(m,n) = x(m);
        Y(m,n) = y(n);

        % Stream Function
        psi_vortex(m,n) = -(gamma/(4*pi)*log(x(m)^2 + y(n)^2));

        % potential Function
        phi_vortex(m,n) = gamma/(2*pi)*atan(y(n)/x(m));
    end
end

figure(1)
plot(X,Y,'-k',X',Y','-k')
xlabel('X')
ylabel('y')
title('Base Mesh')

figure(2)
% Streamlines
contour(X,Y,psi_vortex,-10:0.2:5)
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('Streamlines')
axis square

figure(3)
% Equipotential lines
contour(X,Y,phi_vortex,-10:0.2:5)
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('Equipotential lines')
axis square

figure(4)
% Psi-Phi Mesh
contour(X,Y,phi_vortex,-10:0.2:5,'r','LineWidth',2)
hold on
contour(X,Y,psi_vortex,-10:0.2:5,'k','LineWidth',2)
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('\psi - \phi Mesh')
axis square
hold off

figure(5)
% stream contour
contourf(X,Y,psi_vortex,-10:0.2:5)
xlabel('X','FontSize',15)
ylabel('y','FontSize',15)
title('stream contour')
axis square

