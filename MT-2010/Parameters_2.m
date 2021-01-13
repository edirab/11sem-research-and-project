% *************************************************
% *** Параметры, необходимые для расчёта траектории 
% *************************************************

% Диаметры, ограничивающие перемещение центра масс, м
% (см. чертёж)
D_mass_center_max = 13;
D_mass_center_min = 5.8;

% Угол сектора и полный угол, на который планируется повернуть 
angular_delta = 15;
angle = 90;

% Вычислим количесво требуемых секторов
N = fix(360 / angular_delta);

%disp('class N:'); display(class(N));

% Вектора с координатами
z_outer = zeros(1, int32(N));
x_outer = zeros(1, int32(N));
z_inner = zeros(1, int32(N));
x_inner = zeros(1, int32(N));

for i=1:N
    %disp( class(i) ); disp( i );
    
    [p1_z, p1_x] = pol2cart(deg2rad(angle), D_mass_center_max);
    [p2_z, p2_x] = pol2cart(deg2rad(angle + angular_delta/2), D_mass_center_min);
    
    %disp(p1_z); disp(p1_x);
    
    z_outer(int32(i)) = p1_z;
    x_outer(int32(i)) = p1_x;
    
    z_inner(int32(i)) = p2_z;
    x_inner(int32(i)) = p2_x;
    
    angle = angle + angular_delta;
    
end


z_final = zeros(1, int32(N*2));
x_final = zeros(1, int32(N*2));
direction = zeros(1, int32(N*2));

j = 1;
for i=1:N
   z_final(j) = z_outer(i);
   x_final(j) = x_outer(i);
   direction(j) = 1;
   j = j + 1;
   
   z_final(j) = z_inner(i);
   x_final(j) = x_inner(i);
   direction(j) = -1;
   j = j + 1;
end

clear p1_z p1_x p2_z p2_x i j z_inner x_inner z_outer x_outer;

%disp(z_final);
%disp(x_final);

% *************************************************
% *** Переменные подводного аппарата
% *************************************************

m = 300; %24.7
Cvx1 = 182.87;
Cvx2 = 33;
lambda11 = 12.72;

Jyy = 366;
Cwy1 = 1144.7;
Cwy2 = 22.52;
lambda55 = 117.08;

P1 = 60 * 9.81; % = 588 H, упор одного движителя
U1 = 24; % В, напряжение

% Для ПФ одного винтомотора
K_thruster = P1 / U1; % = 24.5 H/B;
T_thruster = 0.3; % с

l = 0.225;

% Коэффициенты, которые необходимо синтезировать
k1_m = 4.5227;
k2_m = 5.32;

% Коэффициенты, которые необходимо синтезировать
k1_yaw = 0.5146;
k2_yaw = 0.6370;

% коэффициент перевода из радиан в градусы
kc = 57.2958;

% Радиус точки траектории
Rmin = 0.4;

%Течение направлено вдоль оси Z
Vz = 0;
%Vz = 0.1;
%Vz = 0.2;
