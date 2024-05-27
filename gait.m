A = load('D:/Quad/MobileSensorData/test.mat');

% DateTime fix
time = A.Acceleration.Timestamp;
time = posixtime(time) * 1000;
% Smoothen acceldata
% Design a low-pass Butterworth filter
cutoff_freq = 25;
sample_rate = 100;
d = designfilt('lowpassfir','FilterOrder',20,'CutoffFrequency',cutoff_freq,'SampleRate',sample_rate);

% Apply the filter to accelerometer data
A.Acceleration.Z_filtered = filter(d, A.Acceleration.Z);

% find peaks for stride time calculation

% Assume you have a struct named 'accel_data'
% accel_data.time - Time vector
% accel_data.x - Acceleration along X-axis
% accel_data.y - Acceleration along Y-axis
% accel_data.z - Acceleration along Z-axis

% Find peaks in acceleration along X-axis
% opts_x = struct('MinPeakHeight', 0.5);
[peaks_x, peak_indices_x] = findpeaks(A.Acceleration.X, 'MinPeakHeight', 0.5);

% Find peaks in acceleration along Y-axis
% opts_y = struct('MinPeakHeight', 0.5);
[peaks_y, peak_indices_y] = findpeaks(A.Acceleration.Y, 'MinPeakHeight', 0.5);

% Find peaks in acceleration along Z-axis
% opts_z = struct('MinPeakHeight', 0.5);
[peaks_z, peak_indices_z] = findpeaks(A.Acceleration.Z_filtered, 'MinPeakHeight', 6);

% Find peaks in Orientation along X-axis
% opts_x = struct('MinPeakHeight', 0.5);
[peaks_x_o, peak_indices_x_o] = findpeaks(A.Orientation.X, 'MinPeakHeight', 150);

% Find peaks in Orientation along Y-axis
% opts_y = struct('MinPeakHeight', 0.5);
[peaks_y_o, peak_indices_y_o] = findpeaks(A.Orientation.Y, 'MinPeakHeight', 0.5);

% Find peaks in Orientation along Z-axis
% opts_z = struct('MinPeakHeight', 0.5);
[peaks_z_o, peak_indices_z_o] = findpeaks(A.Orientation.Z, 'MinPeakHeight', 8);


% % Plot data and peaks for X-axis
% subplot(3,1,1);
% plot(time, A.Acceleration.X);
% hold on;
% plot(time(peak_indices_x), peaks_x, 'ro');
% hold off;
% xlabel('Time');
% ylabel('Acceleration (X)');
% title('Peaks in X-axis Acceleration');
% 
% % Plot data and peaks for Y-axis
% subplot(3,1,2);
% plot(time, A.Acceleration.Y);
% hold on;
% plot(time(peak_indices_y), peaks_y, 'ro');
% hold off;
% xlabel('Time');
% ylabel('Acceleration (Y)');
% title('Peaks in Y-axis Acceleration');
% 
% % Plot data and peaks for Z-axis
% subplot(3,1,3);
% plot(time, A.Acceleration.Z);
% hold on;
% plot(time(peak_indices_z), peaks_z, 'ro');
% hold off;
% xlabel('Time');
% ylabel('Acceleration (Z)');
% title('Peaks in Z-axis Acceleration');

figure;

subplot(2,1,1)
plot(time, A.Acceleration.Z_filtered);
hold on;
plot(time(peak_indices_z), peaks_z, 'ro');
hold off;
xlabel('Time');
ylabel('Acceleration (Z)');
title('Peaks in Z-axis Acceleration');

subplot(2,1,2)

plot(time, A.Orientation.X);
hold on;
plot(time(peak_indices_x_o), peaks_x_o, 'ro');
hold off;
xlabel('Time');
ylabel('Orientation (X)');
title('Peaks in X-axis Orientation');


% Link x-axis limits of both plots
linkaxes([subplot(2,1,1), subplot(2,1,2)], 'x');




%Define Gait_factor

TR = 12
TL = 1

Gait_factor = (abs(TR-TL)/(0.5*(TR+TL)))*100

