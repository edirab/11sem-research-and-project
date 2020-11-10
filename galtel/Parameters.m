% *************************************************
% *** ���������, ����������� ��� ������� ���������� 
% *************************************************

% ��������, �������������� ����������� ������ ����, �
% (��. �����)
D_mass_center_max = 13;
D_mass_center_min = 5.8;

% ���� ������� � ������ ����, �� ������� ����������� ��������� 
angular_delta = 15;
angle = 90;

% �������� ��������� ��������� ��������
N = fix(360 / angular_delta);

%disp('class N:'); display(class(N));

% ������� � ������������
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
% *** ���������� ���������� ��������
% *************************************************

m = 24.7; %24.7
% ???
Cx = 52.92;
lambda11 = 0.6;

% ������������, ������� ���������� �������������
k1_m = 5.09199;
k2_m = 2.19;

Jyy = 0.78;
Cwy1 = 0.0074;
Cwy2 = 0.0527;
lambda55 = 0.9;

% ������������, ������� ���������� �������������
%k1_k = 1;
k1_k = 0.3;
k2_k = 0.16732;

K_thruster = 2.89;
T_thruster = 0.1;

l = 0.1167;

% ����������� �������� �� ������ � �������
kc = 57.2958;

% ������ ����� � ������
L = 1.760;

% ������ ����� ����������
Rmin = 0.4;

%������� ���������� ����� ��� Z
Vz = 0;
%Vz = 0.1;
%Vz = 0.2;

%����������� ������
k_gamma = 4;

% ���� ���������� � ��������: 10 7 � 8.5; 

%deflection = 7;
%deflection = 8.5;
%deflection = 10;
%deflection = 17;
deflection = 0;