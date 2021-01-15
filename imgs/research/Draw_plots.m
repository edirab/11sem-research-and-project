% https://www.mathworks.com/help/matlab/creating_plots/add-title-axis-labels-and-legend-to-graph.html
% https://www.mathworks.com/help/matlab/titles-and-labels.html
% https://www.mathworks.com/help/matlab/ref/grid.html
% https://www.mathworks.com/help/matlab/creating_plots/aspect-ratio-for-2-d-axes.html
% https://www.mathworks.com/matlabcentral/answers/487061-how-to-change-the-size-of-a-plot-figure
% 

%Извлечём время симуляции
total_time = Z_timeseries.Time(end) %chaze_z(end)
total_time = int16(fix(total_time));
display(total_time);

% Траектория
plot(chase_z, chase_x, 'LineWidth', 1.2)
hold on

% Станция
St_x = [-1 1 1 -1 -1];
St_y = [1 1 -1 -1 1];
plot(St_x, St_y, 'LineWidth', 1.2)

% Окружность, за которую нельзя заходить
% 2*sqrt(2) / 2 + 3/2 = 2,9
r = 5.8 / 2;
th = 0:pi/50:2*pi;
xunit = r * cos(th) + 0;
yunit = r * sin(th) + 0;
h = plot(xunit, yunit);

% Точки траектории
scatter_color = [0, 0.6, 0.3];
scatter(z_final, x_final, 25, scatter_color, 'filled');

%plot(z_final, x_final)
pbaspect([1 1 1])

x0=1000;
y0=100;
width=700;
height=700;
set(gcf,'position',[x0,y0,width,height])

grid on
title( ['Траектория обхода при V = ', num2str(Vfwd), ' за время ', num2str(total_time), ' c' ] )
xlabel('Z, м') 
ylabel('X, м') 
legend({'Траектория','ДЗС', 'Окружность центра масс АНПА', 'Точки траектории'},'Location', 'northeast')%'southwest')

hold off
print('-dpng','-r600', [ num2str(Vfwd), '.png'])

