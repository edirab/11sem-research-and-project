Research_ = struct;
Research_.N_iters = 13;

Research_.times = zeros(1, int32(Research_.N_iters));
Research_.velocities = 0.1:0.1:1.3;

for i=1:Research_.N_iters
    display(i);
    %Vfwd = i * 0.1;
    Vfwd = Research_.velocities(i);
    %display(Vfwd);
    
    sim('like_a_star_1' , inf);
    
    Research_.total_time = Z_timeseries.Time(end);
    Research_.times(i) = Research_.total_time;
end

plot(Research_.velocities, Research_.times);
grid on
title( ['Зависимость времени обхода от скорости' ] )
xlabel('Скорость, м/с') 
ylabel('Время обхода, с') 
