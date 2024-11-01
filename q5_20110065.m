% Define omega, X(omega) and Y(omega)
omega = -50:0.1:50;
Y = - exp(1.5i .* omega) - 2 * exp(-0.5i .* omega) + 2 * exp(0.5i .* omega) + exp(-1.5i .* omega);
X = Y./ (-1i * omega);

%% Part - A
% Plot Magnitude line spectra
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(omega, abs(X), 'DisplayName', '|X(\Omega)|')
plot(omega, abs(Y), 'DisplayName', '|Y(\Omega)|')
title('Magnitude Line Spectra');
% xlim([0,10]);
% ylim([0, 50]);   % optional to resize axis limits
xlabel('\Omega');
ylabel('Magnitude');

% Set the remaining axes properties
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

% Plot Phase Line Spectra 
figure2 = figure;
axes2 = axes('Parent',figure2);
hold(axes2,'on');
scatter(omega, angle(X), 'DisplayName', 'arg(X(\Omega))')
scatter(omega, angle(Y), 'DisplayName', 'arg(Y(\Omega))')
title('Phase Spectrum');
% xlim([0,10]);
% ylim([0, 50]);   % optional to resize axis limits
xlabel('\Omega');
ylabel('Phase');
legend

% Set the remaining axes properties
box(axes2,'on');
grid(axes2,'on');
hold(axes2,'off');
set(axes2,'GridAlpha',0.5,'MinorGridAlpha',0.4,'XMinorGrid','on')
set(gca,'FontSize',12)

%% Part - B
% Plot the logarithm of magnitude
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(omega, 20.*log10(abs(X)), 'DisplayName', '20 log_{10}|X(\Omega)|')
plot(omega, 20.*log10(abs(Y)), 'DisplayName', '20 log_{10}|Y(\Omega)|')
title('Magnitude Line Spectrum');
% xlim([0,10]);
% ylim([0, 50]);   % optional to resize axis limits
xlabel('\Omega');
ylabel('Magnitude');
legend