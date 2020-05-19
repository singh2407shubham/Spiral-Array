a = 0.95;
N = 25;
t = linspace(0,7.5*pi,199 );
d1 =10;
d2 =10;
offset = 0;
x1 =0; x2 = 0; y1 = 0; y2 = 0;
xp1 = 0; xp2 = 0; yp1 = 0; yp2 = 0;

for n = 1:N
    x1(n) = a*sqrt(2*d1*n/a)*cos(sqrt(2*d1*n/a));
    y1(n) = a*sqrt(2*d1*n/a)*sin(sqrt(2*d1*n/a));
end

for n = 1:length(t)
    xp1(n) = a*t(n)*cos(t(n));
    yp1(n) = a*t(n)*sin(t(n));
end
    

for n = 1:N
    x2(n) = (offset+a*sqrt(2*d2*(n+0.5)/a))*cos(sqrt(2*d2*(n+0.5)/a));
    y2(n) = (offset+a*sqrt(2*d2*(n+0.5)/a))*sin(sqrt(2*d2*(n+0.5)/a));
end

A = [x1;y1;x2;y2];

scatter(x1,y1,400,'r','o')
hold on
scatter(x1,y1,100,'b','o')
hold on
scatter(x1,y1,'.')
hold on
plot(xp1,yp1,'g')
hold on
scatter(x2,y2,120,'b','o')
hold on
scatter(x2,y2,'.')
figure(1)
xlabel('Position X (m)')
ylabel('Position Y (m)')
title('Spiral')
grid on
grid on
pbaspect([1 1 1])


fprintf(fileID, '%6s %6s %6s %6s\r\n', 'X_Rx', 'y_Rx', 'X_Tx', 'Y_Tx');
fprintf(fileID, '%6.2f %6.2f %6.2f %6.2f\r\n', A);