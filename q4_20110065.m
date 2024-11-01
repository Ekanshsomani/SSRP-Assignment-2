t = 0:1/100:10-1/100; % Time vector
x = sin(2*pi*15*t) + sin(2*pi*40*t); % Signal

% Get fourier transform of x.
X = zeros([1 20]);
omega_0 = 10*pi;
for k = 1:20
    Angle = k * omega_0 * t;
    X(k) = x * (cos(Angle) + 1i*sin(Angle))';
end

% Define the x-axis frequencies for plot
f = 5:5:100;

% Plot the magnitude line spectrum
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
stem(f, abs(X))
title('X-Magnitude Line Spectrum');
% xlim([0,10]);
% ylim([0, 50]);   % optional to resize axis limits
xlabel('f');
ylabel('X_m');

% Set the remaining axes properties
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

% Plot the phase spectrum
figure2 = figure;
axes2 = axes('Parent',figure2);
hold(axes2,'on');
stem(f, angle(X))
title('X-Phase Spectrum');
% xlim([0,10]);
% ylim([0, 50]);   % optional to resize axis limits
xlabel('f');
ylabel('X_m');

% Set the remaining axes properties
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'off');
set(axes2,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)