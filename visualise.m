% Load the data from the .mat file
A = load('/MATLAB Drive/MobileSensorData/test.mat');

% Assuming A is a structure with fields: Acceleration, Orientation, AngularAcceleration
% Each field has X, Y, and Z columns

% Create a new figure
figure;

% Plot Acceleration
subplot(3,1,1); % Create subplot in a 3x1 grid, first position
plot(A.Acceleration.X);
hold on;
plot(A.Acceleration.Y);
plot(A.Acceleration.Z);
title('Acceleration');
legend('X', 'Y', 'Z');

% Plot Orientation
subplot(3,1,2); % Create subplot in a 3x1 grid, second position
plot(A.Orientation.X);
hold on;
plot(A.Orientation.Y);
plot(A.Orientation.Z);
title('Orientation');
legend('X', 'Y', 'Z');


% Plot AngularVelocity
subplot(3,1,3); % Create subplot in a 3x1 grid, third position
plot(A.AngularVelocity.X);
hold on;
plot(A.AngularVelocity.Y);
plot(A.AngularVelocity.Z);
title('AngularVelocity');
legend('X', 'Y', 'Z');

%Calculate Resultant Acceleration for segmentation

Acceleration_Res = sqrt((A.Acceleration.X .* A.Acceleration.X)+(A.Acceleration.Y .* A.Acceleration.Y)+(A.Acceleration.Z .* A.Acceleration.Z));

[pks,locs] = findpeaks(Acceleration_Res, 'MinPeakHeight', 15);


figure;

subplot(2,1,1)
plot(Acceleration_Res);
title('Resultant Acceleration');

% subplot(2,1,2)
% plot(Acceleration_Res,pks,locs,"o");
% title('Sementation Attempt');



% % Plot detected steps on acceleration plot
% subplot(2,1,1); % Go back to the first subplot
% hold on;
% plot(locs, A.Acceleration.Z(locs), 'ro', 'MarkerSize', 4);
% xlabel('Time');
% ylabel('Acceleration (m/s^2)');
% legend('X', 'Y', 'Z', 'Detected Steps');
% 
% % Calculate stride length using angular velocity data (example)
% % Assuming walking on a straight path, stride length is proportional to the integral of the angular velocity
% % You may need calibration depending on your sensor orientation and walking conditions
% stride_length = cumtrapz(A.AngularVelocity.Y); 
% 
% % Plot stride length
% figure;
% plot(stride_length);
% title('Stride Length');
% xlabel('Time');
% ylabel('Stride Length (arbitrary unit)');
% 
% % Gait cycle analysis (example)
% % You may analyze gait phases using various methods such as zero crossings of angular velocity or acceleration signals
% 
% 
% % Plot Angular Acceleration
% subplot(3,1,3); % Create subplot in a 3x1 grid, third position
% plot(A.AngularVelocity.X);
% hold on;
% plot(A.AngularVelocity.Y);
% plot(A.AngularVelocity.Z);
% title('Angular Velocity');
% legend('X', 'Y', 'Z');