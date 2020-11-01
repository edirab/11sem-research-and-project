
%drawArrow = @(x,y,varargin) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 , varargin{:} );
%drawArrow = @(x,y) quiver( x(1),y(1),x(2)-x(1),y(2)-y(1),0 );
%x1 = [-0.5 0];
%y1 = [24 24];
%drawArrow(x1,y1, {'MaxHeadSize',0.8,'Color','g','LineWidth',3} )
%drawArrow(x1,y1 )

hold on
plot(trajectory_z, trajectory_x )

plot(deflection_z, deflection_x, 'r');
hold off

title('����� ����������� ���� ����������')

xlabel('��� Z');
ylabel('��� �');

ylim([-5 30])
xlim([-1 10])

legend('�������� ����������', '���������� ����')

%Size and location, specified as a four-element vector of the 
%form [x y length height].  The first two elements specify the 
%coordinates of the lower left corner of the rectangle. 
% The second two elements specify the length and height of the rectangle.

% ���� ����
dim = [.2 .80 .3 .1];
%str = 'beta = ' + deflection + '^{\circ}';
str = sprintf('beta =  %.1d%c', deflection, char(176));
annotation('textbox',dim,'String',str,'FitBoxToText','on');

% �������� �������
dim = [.2 .765 .3 .1];
str = 'V������� = 0,05 �/�';
annotation('textbox',dim,'String',str,'FitBoxToText','on');

% ������� �������
 currentX = [0.14 0.17];
 currentY = [0.5   0.5];
 annotation('arrow',currentX,currentY);
 
 currentX = [0.14 0.17];
 currentY = [0.3   0.3];
 annotation('arrow',currentX,currentY);
 
 currentX = [0.14 0.17];
 currentY = [0.7   0.7];
 annotation('arrow',currentX,currentY);