
x = [0 0   L L 2*L 2*L 3*L 3*L ];
y = [0 25 25 0 0   25   25  0  ];

hold on
plot(x, y );

hold off

%title('����� ����������� ���� ����������')

xlabel('��� Z');
ylabel('��� �');

ylim([-5 30])
xlim([-1 10])

legend('�������� ����������')

% �������� �������
%dim = [.2 .765 .3 .1];
%str = 'V������� = 0,05 �/�';
%annotation('textbox',dim,'String',str,'FitBoxToText','on');

% ������� �������
 %currentX = [0.14 0.17];
 %currentY = [0.5   0.5];
 %annotation('arrow',currentX,currentY);
 
 %currentX = [0.14 0.17];
 %currentY = [0.3   0.3];
 %annotation('arrow',currentX,currentY);
 
 %currentX = [0.14 0.17];
 %currentY = [0.7   0.7];
 %annotation('arrow',currentX,currentY);