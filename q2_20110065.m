t = 0:0.01:2; % Define the time vector
u = @(t) heaviside(t); % Define the unit step function

% Define and plot the signal
x = u(t) - 2 * u(t - 1) + u(t - 2);
plot(t, x)
title('x(t) (from t = 0 to 2)');
xlim([-0.5,2.5]);
ylim([-1.5, 1.5]);
grid on;

% Calculate the coefficients
x = @(t) u(t) - 2 * u(t - 1) + u(t - 2);

a_k = @(k) integral(@(t) x(t).*cos(k*pi*t), 0, 2);
b_k = @(k) integral(@(t) x(t).*sin(k*pi*t), 0, 2);

a = zeros(1, 30);
b = zeros(1, 30);
for k = 1:30
    a(k) = a_k(k);
    b(k) = b_k(k);
end

% Create a table for a_k and b_k
disp(table((1:30)', a', b', 'VariableNames', {'k', 'a_k', 'b_k'}));

% Approximate and plot x_t_prime using the 30 harmonics
x_t_prime = zeros(size(t)); % Start with the a0 term
for k = 1:30
    x_t_prime = x_t_prime + a(k) * cos(k * pi * t) + b(k) * sin(k * pi * t);
end

figure;
plot(t, x_t_prime, 'LineWidth', 1.5);
xlabel('Time t');
ylabel('x''(t)');
title('Approximation of x(t) with 30 Harmonics');
grid on;