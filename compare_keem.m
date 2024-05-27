% Load the data from the .mat files
A = load('MobileSensorData/sensorlog_20240515_120007.mat');
B = load('MobileSensorData/sensorlog_20240515_120008.mat');


% Create a new figure
figure;

% Plot Acceleration
subplot(3,1,1); % Create subplot in a 3x1 grid, first position
plot(A.Acceleration.X);
hold on;
plot(B.Acceleration.X);
title('Acceleration X');
legend('OnePlus', 'iPhone');


subplot(3,1,2); % Create subplot in a 3x1 grid, second position
plot(A.Acceleration.Y);
hold on;
plot(B.Acceleration.Y);
title('Acceleration Y');
legend('OnePlus', 'iPhone');

subplot(3,1,3); % Create subplot in a 3x1 grid, third position
plot(A.Acceleration.Z);
hold on;
plot(B.Acceleration.Z);
title('Acceleration Z');
legend('OnePlus', 'iPhone');


% Create a new figure
figure;

% Plot Orientation
subplot(3,1,1); % Create subplot in a 3x1 grid, first position
plot(A.Orientation.X);
hold on;
plot(B.Orientation.X);
title('Orientation X');
legend('OnePlus', 'iPhone');


subplot(3,1,2); % Create subplot in a 3x1 grid, second position
plot(A.Orientation.Y);
hold on;
plot(B.Orientation.Y);
title('Orientation Y');
legend('OnePlus', 'iPhone');

subplot(3,1,3); % Create subplot in a 3x1 grid, third position

plot(A.Orientation.Z);
hold on;
plot(B.Orientation.Z);
title('Orientation Z');
legend('OnePlus', 'iPhone');

% Create a new figure
figure;

% Plot Angular Velocity X
subplot(3,1,1); % Create subplot in a 3x1 grid, first position
plot(A.AngularVelocity.X);
hold on;
plot(B.AngularVelocity.X);
title('Angular Velocity X');
legend('OnePlus', 'iPhone');

% Plot Angular Velocity Y
subplot(3,1,2); % Create subplot in a 3x1 grid, second position
plot(A.AngularVelocity.Y);
hold on;
plot(B.AngularVelocity.Y);
title('Angular Velocity Y');
legend('OnePlus', 'iPhone');

% Plot Angular Velocity Z
subplot(3,1,3); % Create subplot in a 3x1 grid, third position
plot(A.AngularVelocity.Z);
hold on;
plot(B.AngularVelocity.Z);
title('Angular Velocity Z');
legend('OnePlus', 'iPhone');


%REMOVE STATIC BIAS
%ACCELERATION

% Calculate average values for Acceleration components for sensor A
avg_Acc_A_X = mean(A.Acceleration.X);
avg_Acc_A_Y = mean(A.Acceleration.Y);
avg_Acc_A_Z = mean(A.Acceleration.Z);

% Calculate average values for Acceleration components for sensor B
avg_Acc_B_X = mean(B.Acceleration.X);
avg_Acc_B_Y = mean(B.Acceleration.Y);
avg_Acc_B_Z = mean(B.Acceleration.Z);

% Subtract average values of sensor B from sensor A to remove bias
bias_removed_Acc_A_X = A.Acceleration.X - (abs(avg_Acc_A_X - avg_Acc_B_X));
bias_removed_Acc_A_Y = A.Acceleration.Y - (abs(avg_Acc_A_Y - avg_Acc_B_Y));
bias_removed_Acc_A_Z = A.Acceleration.Z - abs(avg_Acc_A_Z - avg_Acc_B_Z);

% Subtract average values of sensor A from sensor B to remove bias
bias_removed_Acc_B_X = B.Acceleration.X - (abs(avg_Acc_A_X - avg_Acc_B_X));
bias_removed_Acc_B_Y = B.Acceleration.Y - (abs(avg_Acc_A_Y - avg_Acc_B_Y));
bias_removed_Acc_B_Z = B.Acceleration.Z - (abs(avg_Acc_A_Z - avg_Acc_B_Z));

%ORIENTATION

% Calculate average values for Orientation components for sensor A
avg_Orr_A_X = mean(A.Orientation.X);
avg_Orr_A_Y = mean(A.Orientation.Y);
avg_Orr_A_Z = mean(A.Orientation.Z);

% Calculate average values for Orientation components for sensor B
avg_Orr_B_X = mean(B.Orientation.X);
avg_Orr_B_Y = mean(B.Orientation.Y);
avg_Orr_B_Z = mean(B.Orientation.Z);

% Subtract average values of sensor B from sensor A to remove bias
bias_removed_Orr_A_X = A.Orientation.X - avg_Orr_B_X;
bias_removed_Orr_A_Y = A.Orientation.Y - avg_Orr_B_Y;
bias_removed_Orr_A_Z = A.Orientation.Z - avg_Orr_B_Z;

% Subtract average values of sensor A from sensor B to remove bias
bias_removed_B_Orr_X = B.Orientation.X - avg_Orr_A_X;
bias_removed_B_Orr_Y = B.Orientation.Y - avg_Orr_A_Y;
bias_removed_B_Orr_Z = B.Orientation.Z - avg_Orr_A_Z;


%ANGULAR VELOCITY
% Calculate average values for Angular Velocity components for sensor A
avg_AngVel_A_X = mean(A.AngularVelocity.X);
avg_AngVel_A_Y = mean(A.AngularVelocity.Y);
avg_AngVel_A_Z = mean(A.AngularVelocity.Z);

% Calculate average values for Angular Velocity components for sensor B
avg_AngVel_B_X = mean(B.AngularVelocity.X);
avg_AngVel_B_Y = mean(B.AngularVelocity.Y);
avg_AngVel_B_Z = mean(B.AngularVelocity.Z);

% Subtract average values of sensor B from sensor A to remove bias
bias_removed_AngVel_A_X = A.AngularVelocity.X - abs(avg_AngVel_B_X - avg_AngVel_A_X);
bias_removed_AngVel_A_Y = A.AngularVelocity.Y - avg_AngVel_B_Y;
bias_removed_AngVel_A_Z = A.AngularVelocity.Z - avg_AngVel_B_Z;

% Subtract average values of sensor A from sensor B to remove bias
bias_removed_AngVel_B_X = B.AngularVelocity.X - avg_AngVel_A_X;
bias_removed_AngVel_B_Y = B.AngularVelocity.Y - avg_AngVel_A_Y;
bias_removed_AngVel_B_Z = B.AngularVelocity.Z - avg_AngVel_A_Z;


%Bias Adjusted Plots?

figure;

% Plot Acceleration
subplot(3,1,1); % Create subplot in a 3x1 grid, first position
plot(bias_removed_Acc_A_X);
hold on;
plot(B.Acceleration.X);
title('Acceleration X');
legend('OnePlusAdjusted', 'iPhone');


subplot(3,1,2); % Create subplot in a 3x1 grid, second position
plot(bias_removed_Acc_A_Y);
hold on;
plot(B.Acceleration.Y);
title('Acceleration Y');
legend('OnePlusAdjusted', 'iPhone');


subplot(3,1,3); % Create subplot in a 3x1 grid, third position
plot(bias_removed_Acc_A_Z);
hold on;
plot(B.Acceleration.Z);
title('Acceleration Z');
legend('OnePlusAdjusted', 'iPhone');

