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

m = 24.7; %24.7
% ???
Cx = 52.92;
lambda11 = 0.6;

% Коэффициенты, которые необходимо синтезировать
k1_m = 5.09199;
k2_m = 2.19;

Jyy = 0.78;
Cwy1 = 0.0074;
Cwy2 = 0.0527;
lambda55 = 0.9;

% Коэффициенты, которые необходимо синтезировать
%k1_k = 1;
k1_k = 0.3;
k2_k = 0.16732;

K_thruster = 2.89;
T_thruster = 0.1;

l = 0.1167;

% коэффициент перевода из радиан в градусы
kc = 57.2958;

% Ширина галса в метрах
L = 1.760;

% Радиус точки траектории
Rmin = 0.4;

%Течение направлено вдоль оси Z
Vz = 0;
%Vz = 0.1;
%Vz = 0.2;

%коэффициент ошибки
k_gamma = 4;

% угол упреждения в градусах: 10 7 и 8.5; 

%deflection = 7;
%deflection = 8.5;
%deflection = 10;
%deflection = 17;
deflection = 0;