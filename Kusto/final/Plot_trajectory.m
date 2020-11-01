
x = [0 0   L L 2*L 2*L 3*L 3*L ];
y = [0 25 25 0 0   25   25  0  ];

hold on
plot(x, y );

hold off

%title('Метод постоянного угла упреждения')

xlabel('Ось Z');
ylabel('Ось Х');

ylim([-5 30])
xlim([-1 10])

legend('Исходная траектория')

% скорость течения
%dim = [.2 .765 .3 .1];
%str = 'Vтечения = 0,05 м/с';
%annotation('textbox',dim,'String',str,'FitBoxToText','on');

% стрелки течения
 %currentX = [0.14 0.17];
 %currentY = [0.5   0.5];
 %annotation('arrow',currentX,currentY);
 
 %currentX = [0.14 0.17];
 %currentY = [0.3   0.3];
 %annotation('arrow',currentX,currentY);
 
 %currentX = [0.14 0.17];
 %currentY = [0.7   0.7];
 %annotation('arrow',currentX,currentY);