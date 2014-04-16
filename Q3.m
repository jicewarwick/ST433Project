% Common constants:
N = 1000;
N_trial = 20;
sim_N = 100;
T = 5;
time = 0:1/N:T-1/N;

% plot config
PLOT2 = 0;
PLOT5 = 0;

% Question 1
%----------------------------
expRand = -log(1-rand(N));
% hist(expRand,100);

% Question 2
%----------------------------
% base variable
u = 1;
alpha = 1;
c = 1;
lambda = 1;

% keeping all other variables constant
%--------
% Varying u:
for i = 1:4
	Uu(:,i) = getU(i*5, alpha, c, lambda, T, N);
end

% Varying alpha:
for i = 1:4
	Ualpha(:,i) = getU(u, alpha * i, c, lambda, T, N);
end

% Varying c:
for i = 1:4
	Uc(:,i) = getU(u, alpha, c * i, lambda, T, N);
end

% Varying lambda:
for i = 1:4
	Ulambda(:,i) = getU(u, alpha, c, lambda * i, T, N);
end

if (PLOT2 == 1)
	plot(time, Uu);
	pause();
	plot(time, Uc);
	pause();
	plot(time, Ulambda);
	pause();
	plot(time, Ualpha);
end

% Question 3
%----------------------------
trial_u = [1, 8, 9, 100];
tiral_c = [1, 2, 5, 10, 100];
tiral_lambda = [1, 2, 5, 10, 100];

ruinProb = ruinProbSimulation(u, alpha, c, lambda, T, N, sim_N);

% varying u
for i = 1:N_trial
	ruinProbU(i) = ruinProbSimulation(i, alpha, c, lambda, T, N, sim_N);
end

% varying c
for i = 1:N_trial
	ruinProbC(i) = ruinProbSimulation(u, alpha, i, lambda, T, N, sim_N);
end

% varying lambda
for i = 1:N_trial
	ruinProbLambda(i) = ruinProbSimulation(u, alpha, c, i, T, N, sim_N);
end

% Question 4
%----------------------------
alpha = 4;
lambda = 2;
c = 0.5;
sigma = 1;
%for	u = [0.5, 2, 4];

%end

% Question 5
%----------------------------
% keeping all other variables constant
%--------
% Varying u:
for i = 1:4
	NewUu(:,i) = getNewU(i*5, alpha, c, lambda, sigma, T, N);
end

% Varying alpha:
for i = 1:4
	NewUalpha(:,i) = getNewU(u, alpha * i, c, lambda, sigma, T, N);
end

% Varying c:
for i = 1:4
	NewUc(:,i) = getNewU(u, alpha, c * i, lambda, sigma, T, N);
end

% Varying lambda:
for i = 1:4
	NewUlambda(:,i) = getNewU(u, alpha, c, lambda * i, sigma, T, N);
end

% Varying sigma:
for i = 1:4
	NewUsigma(:,i) = getNewU(u, alpha, c, lambda, i, T, N);
end
if	(PLOT5 == 1)
	plot(time, NewUu);
	pause();
	plot(time, NewUalpha);
	pause();
	plot(time, Uc);
	pause();
	plot(time, NewUlambda);
	pause();
	plot(time, NewUsigma);
end
