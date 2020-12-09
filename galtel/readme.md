### Запуск симуляции из консоли Матлаба

load_system('like_a_star_1')
set_param('like_a_star_1','SimulationCommand','Start');


### Конвертация timeseries в массив

xlswrite('./timeseries/Time-X-Z.xlsx', [X_timeseries.Time X_timeseries.Data Z_timeseries.Data]);
% xlswrite('./timeseries/Time-X-Z-Yaw.xlsx', [X_timeseries.time, X_timeseries.data, Z_timeseries.data, Yaw_timeseries.data]);
