% *************************************************
% *** ���������� ���������� ��������
% *************************************************

m = 300; % ��
Cvx1 = 182.87;
Cvx2 = 33;
lambda11 = 12.72;

Jyy = 366;
Cwy1 = 1144.7;
Cwy2 = 22.52;
lambda55 = 117.08;

P1 = 60 * 9.81; % = 588 H, ���� ������ ���������
U1 = 24; % �, ����������

% ��� �� ������ �����������
K_thruster = P1 / U1; % = 24.5 H/B;
T_thruster = 0.3; % �

l = 0.225;

% �� ��� �� �����
K_propulsion_x = K_thruster * 4;
T_propulsion_x = T_thruster;

% �� ��� �� �����
K_propulsion_w = K_thruster * 4 * l;
T_propulsion_w = T_thruster;

V_linearization = 0; % 0.2; 
w_linearization = 0;

% ������� ������������ ������� ������ �������� ��������
K_Vx = 1 / (2*Cvx1 * V_linearization + Cvx2); 
T_Vx = (m + lambda11)/(2*Cvx1 * V_linearization + Cvx2);


% ������� ������������ ������� ������ �������� �� �����
K_omega_y = 1 / (2 * Cwy1 * w_linearization + Cwy2);
T_omega_w = (Jyy + lambda55)/(2 * Cwy1 * w_linearization + Cwy2);


T_v = (2*T_propulsion_x*(m+lambda11)*0.707)/...
    ( (2*Cvx1 * V_linearization + Cvx2)*T_propulsion_x + m + lambda11);

k2_m = ( T_propulsion_x*(m+lambda11) - (2*Cvx1 * V_linearization + Cvx2)* T_v^2) /...
    ( T_v^2 * K_propulsion_x );

% ������������, ������� ���������� �������������
k1_m = 600; %4066;
%k2_m = 500; %527.58;

% ������������, ������� ���������� �������������
%k1_k = 1;
k1_k = 0.3;
k2_k = 0.16732;



% ����������� �������� �� ������ � �������
kc = 57.2958;

