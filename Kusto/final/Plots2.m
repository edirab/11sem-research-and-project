
x = [0  0  L  L 2*L 2*L 3*L 3*L  4*L 4*L 5*L 5*L ];
y = [0 25  25 0  0  25   25   0   0   25  25  0];

hold on
plot(x, y );

%plot(chase_z, chase_x, 'r');
%plot(covering_z, covering_x, 'g');
plot(deflection_z, deflection_x, 'r');

hold off

%title('Метод погони')
%title('Метод накрытия цели')
title('Метод постоянного угла упреждения')
%title('Сравнение метода погони и метода накрытия цели')

xlabel('Ось Z, м');
ylabel('Ось Х, м');

ylim([-5 30])
xlim([-1 10])

legend('Исходная траектория', 'Траектория АНПА')
%legend('Исходная траектория', 'Траектория по методу погони' , 'Траектория по методу накрытия цели')

annotate_beta(deflection);

%annotate_K(k_gamma);

annotate_V(Vz);

draw_current();
 

function ret = draw_current()
    %Size and location, specified as a four-element vector of the 
    %form [x y length height].  The first two elements specify the 
    %coordinates of the lower left corner of the rectangle. 
    % The second two elements specify the length and height of the rectangle.
    
    % стрелки течения
     currentX = [0.14 0.17];
     currentY = [0.5   0.5];
     annotation('arrow',currentX,currentY);

     currentX = [0.14 0.17];
     currentY = [0.3   0.3];
     annotation('arrow',currentX,currentY);

     currentX = [0.14 0.17];
     currentY = [0.7   0.7];
     annotation('arrow',currentX,currentY);
    ret = 0;
end 
 


function ret = annotate_beta(angle)
    % угол бета
    dim = [.2 .80 .3 .1];
        %str = 'beta = ' + deflection + '^{\circ}';
    str = sprintf('beta =  %.1d%c', angle, char(176));
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    ret = 0;
end


function ret = annotate_K(k_gamma)
    % коэффициент ошибки
    dim = [.2 .80 .3 .1];
        %str = 'beta = ' + deflection + '^{\circ}';
    str = sprintf('K =  %.1d', k_gamma);
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    ret = 0;
end


function ret = annotate_V(Vz)
    % скорость течения
    dim = [.2 .765 .3 .1];
    str = sprintf('Vтечения = %.2f м/с', Vz);
    annotation('textbox',dim,'String',str,'FitBoxToText','on');
    ret = 0;
end
 