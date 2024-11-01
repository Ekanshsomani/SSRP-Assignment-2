%% Part A

fs = 100; % sampling frequency = 100 Hz
t = 0 : 1/fs : 10 - 1/fs;
x = repmat([ (t(1:fs).^2)./2, zeros(1, fs)], [1 5]); % creating periodic x

% Plotting x(t)
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(t, x);

title('x(t)')
xlim([0,10]);
ylim([0, 0.5]);   % optional to resize axis limits
xlabel('t');
ylabel('x');

% Set the remaining axes properties
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

% Calculate X_m
X = fft(x);
X_magnitude = abs(X);
f = (0: length(X)-1) * fs/length(X);

% Plotting magnitude of fourier transform of X
figure2 = figure;
axes2 = axes('Parent',figure2);
hold(axes2,'on');
stem(f, X_magnitude);

title('X-Magnitude Line Spectrum');
xlim([0,10]);
ylim([0, 50]);   % optional to resize axis limits
xlabel('f');
ylabel('X_m');

% Set the remaining axes properties
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'off');
set(axes2,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

%% Part C

y = repmat([zeros(1, 3*fs) + 2, zeros(1, 2*fs)], [1 2]);

% Plotting y(t)
plot(t, y);
ylim([0, 2.5]);

% Plotting z(t) = y(t) + x(t)
z = y + x;
plot(t, z)

% Calculate Y_m, Z_m
Y_magnitude = abs(fft(y));
Z_magnitude = abs(fft(z));

% Plotting Z_m
figure3= figure;
axes3 = axes('Parent',figure3);
hold(axes3,'on');
stem(f, Z_magnitude);

title('Z-Magnitude Line Spectrum');
xlim([0,10]);
ylim([0, 200]);   % optional to resize axis limits
xlabel('f');
ylabel('Z_m');

% Set the remaining axes properties
box(axes3,'on');
grid(axes3,'on');
hold(axes3,'off');
set(axes3,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

% Plotting X_m + Y_m to compare plot with Z_m
figure4= figure;
axes4 = axes('Parent',figure4);
hold(axes4,'on');
stem(f, X_magnitude + Y_magnitude);

title('Magnitude Line Spectrum');
xlim([0,10]);
ylim([0, 200]);   % optional to resize axis limits
xlabel('f');
ylabel('X_m + Y_m');

box(axes4,'on');
grid(axes4,'on');
hold(axes4,'off');

% Set the remaining axes properties
set(axes4,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')

set(gca,'FontSize',12)