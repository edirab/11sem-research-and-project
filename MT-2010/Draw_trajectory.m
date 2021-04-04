% https://www.mathworks.com/help/matlab/creating_plots/add-title-axis-labels-and-legend-to-graph.html
% https://www.mathworks.com/help/matlab/titles-and-labels.html
% https://www.mathworks.com/help/matlab/ref/grid.html
% https://www.mathworks.com/help/matlab/creating_plots/aspect-ratio-for-2-d-axes.html
% https://www.mathworks.com/matlabcentral/answers/487061-how-to-change-the-size-of-a-plot-figure
% 



plot(Path.z, Path.x)
pbaspect([1 1 1])

hold on

% Точки траектории
scatter_color = [0, 0.6, 0.3];
scatter(Path.z, Path.x, 25, scatter_color, 'filled');

% Станция
St_x = [-1 1 1 -1 -1];
St_y = [1 1 -1 -1 1];
plot(St_x, St_y, 'LineWidth', 1.2)

scatter_color = [0, 0, 0];
scatter([0], [0], 25, scatter_color, 'filled');
text(-3.5, -0.5, 'O(0, 0)', 'FontSize',14);

text(-4, 14, 'A(0, 13)', 'FontSize',14);
scatter([0], [13], 25, scatter_color, 'filled');

x0=1000;
y0=100;
width=700;
height=700;
set(gcf,'position',[x0,y0,width,height])

grid on
title( ['Траектория обхода' ] )
xlabel('Z, м') 
ylabel('X, м') 
legend({'Траектория','Точки траектории', 'ДЗС' },'Location', 'northeast')%'southwest')

hold off
print('-dpng','-r600', [ 'Траектория.png'])

