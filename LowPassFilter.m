% order
N = 2;

% cut-off frequency in radians
wc1 = 14000*pi;
wc2 = 28000*pi;

R = 2

% Coefficients of the analog transfer function H(s)
[a, b] = cheby1(N, R, [wc1 wc2], 's');

% frequency values
w = 0:0.5:44000*pi;

% Generation of the frequency response of the filter
H = freqs(a, b, w);

hold on
plot(w, abs(H))