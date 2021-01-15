% chase_x = transpose(chase_x);
% chase_z = transpose(chase_z);

% chase_x = horzcat(chase_x, St_y);
% chase_z = horzcat(chase_z, St_x);

plot(chase_z, chase_x)

hold on

St_x = [-1 1 1 -1 -1];
St_y = [1 1 -1 -1 1];
plot(St_x, St_y)


r = 5.8 / 2;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + 0;
yunit = r * sin(th) + 0;
h = plot(xunit, yunit);


hold off






function h = circle(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
h = plot(xunit, yunit);
hold off