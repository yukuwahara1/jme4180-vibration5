% results part 1

m1 = 0.2;
m2 = 0.5;
m3 = 0.3;

g = 9.81;

x11 = .067;
x12 = .105;

x21 = .067;
x22 = .171;

x31 = .067;
x32 = .127;

f1 = m1 * g;
f2 = m2 * g;
f3 = m3 * g;

x1 = x12 - x11;
x2 = x22 - x21;
x3 = x32 - x31;

F = [ f1, f2, f3 ] 

x = [ x1, x2, x3 ]

figure 
plot(F, x)
title('Spring Stiffness Calibration')
xlabel('Displacement (m)')
ylabel('Force (N)')

Sf = f2 - f1

Sx = x2 - x1

slope = Sf ./ Sx


results part 2

load('run5.mat')

plot(X3(:,1),X3(:,2))
title('Time Series of Mass 1')
xlabel('Time (second)')
ylabel('Magnitude (m/s^2)')a

load('run5.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD of Mass 1')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run6.mat')

plot(X3(:,1),X3(:,2))
title('Time Series of Mass 2')
xlabel('Time (second)')
ylabel('Magnitude (m/s^2)')

load('run6.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD of Mass 2')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run7.mat')

plot(X3(:,1),X3(:,2))
title('Time Series of Mass 3')
xlabel('Time (second)')
ylabel('Magnitude (m/s^2)')

load('run7.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD of Mass 3')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run9.mat')

plot(X3(:,1),X3(:,2))
title('Time Series of Mass 4')
xlabel('Time (second)')
ylabel('Magnitude (m/s^2)')

load('run9.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD of Mass 4')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run10.mat')

plot(X3(:,1),X3(:,2))
title('Time Series of Mass 5')
xlabel('Time (second)')
ylabel('Magnitude (m/s^2)')

load('run10.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD of Mass 5')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')


% Results Part 3

load('run11.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD with 1.2 Hz and 7.0V')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run13.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD with 2.112 Hz and 7.0V')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run15.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD with 3.0 Hz and 7.0V')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run16.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD with 3.8 Hz and 7.0V')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')

load('run17.mat')

plot(abs(S3(:,2)))
plot(S3(:,1),abs(S3(:,2)))
title('Sampling Parameters PSD with 4.2 Hz and 7.0V')
xlabel('Frequency (Hz)')
ylabel('Magnitude (m/s^2)')


%% results part 4
% theoretical

clc
clear all
close all

M = [1 0 0 0 0; 
     0 2 0 0 0;
     0 0 3 0 0;
     0 0 0 4 0
     0 0 0 0 5];             % Mass Matrix(kg)

k = 100;                   % Spring stiffness(N/m)
K = k*[4 -1 0 0 0; 
      -1 4 -1 0 0;
      0 -1 4 -1 0;
      0 0 -1 4 -1
      0 0 0 -1 4];            % Stiffness Matrix(N/m)

F0 = 0;                      % Applied force (N)
F = F0*[0;0;0;1];            %

[phi,wn]=eig(K,M);          % Solve the eigenvalue problem
f = sqrt(diag(wn))/(2*pi);  % Natural frequencies (Hz)

alpha = phi'*M*phi;         % Diagonal matrix 
phiNormalized = phi/sqrt(alpha);	% Mass-normalization
 
% INCREASE MASS. OUTPUT NATURAL FREQUENCIES

% INCREASE STIFFNESS. OUTPUT NATURAL FREQUENCIES

% PLOT MODE SHAPES - BASE SYSTEM
modeShape = [zeros(1,5);real(phiNormalized);zeros(1,5)]';
massPoint = 0:1:6;

 for x = 1:5
   subplot(2,3,x)
   plot(massPoint, modeShape(x,:),'DisplayName', ['Mode ' num2str(x)],'LineWidth',2)         
   title(['MODE ' num2str(x)])
   xlabel({'MASS',''})
   ylabel({'Mass Normalized','Displacement Amplitude'})   
   set(gca,'XTick',[0 1 2 3 4 5 6],'XTickLabel',{'Fixed End','1','2','3','4','5','Fixed End'});
   grid on
   
   hold all
 end


%% Experimental 
Experimental begins

clc
clear all
close all


M = [.23 0 0 0 0;
0 .18 0 0 0;
0 0 .23 0 0;
0 0 0 .18 0;             % Mass Matrix(kg)
0 0 0 0 .255];

k = 51.6;                   % Spring stiffness(N/m)
K = k*[2 -1 0 0 0;
-  1 2 -1 0 0;
0 -1 2 -1 0;
0 0 -1 2 -1;
0 0 0 -1 2];            % Stiffness Matrix(N/m)
F0 = 0;                      % Applied force (N)
F = F0*[0;0;0;1];            %

[phi,wn]=eig(K,M);          % Solve the eigenvalue problem
f = sqrt(diag(wn))/(2*pi);  % Natural frequencies (Hz)

alpha = phi'*M*phi;         % Diagonal matrix 
phiNormalized = phi/sqrt(alpha);	% Mass-normalization
 
% INCREASE MASS. OUTPUT NATURAL FREQUENCIES

% INCREASE STIFFNESS. OUTPUT NATURAL FREQUENCIES

% PLOT MODE SHAPES - BASE SYSTEM
modeShape = [zeros(1,5);real(phiNormalized);zeros(1,5)]';
massPoint = 0:1:6;

 for x = 1:5
   subplot(2,3,x)
   plot(massPoint, modeShape(x,:),'DisplayName', ['Mode ' num2str(x)],'LineWidth',2)         
   title(['MODE ' num2str(x)])
   xlabel({'MASS',''})
   ylabel({'Mass Normalized','Displacement Amplitude'})   
   set(gca,'XTick',[0 1 2 3 4 5 6],'XTickLabel',{'Fixed End','1','2','3','4','5','Fixed End'});
   grid on
   
   hold all
 end
