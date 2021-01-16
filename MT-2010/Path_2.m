%Path = struct;
Path.x = [];
Path.z = [];

Path.N_points = 50;

for i=0:0.1:14
    Path.z = [Path.z i];
    temp = 0.001 * (i - 1)^2;
    Path.x = [Path.x temp];
end

Vfwd = 0.1;

% paramValue = get_param('myModel/My Constant','Value')
% set_param('myModel/My Constant','Value','25')

paramValue = get_param('myModel/My Constant','Value');
set_param('like_a_star_1/My Constant','Value','25');

plot(Path.z, Path.x)
