% Common constants:
N = 1000;
sim_N = 1000;
T = 5;
time = 0:1/N:T-1/N;
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

plot(time, Uu);

% Varying alpha:
for i = 1:4
	Uu(:,i) = getU(u, alpha * i, c, lambda, T, N);
end

%plot(time, Uu);

% Varying c:
for i = 1:4
	Uu(:,i) = getU(u, alpha, c * i, lambda, T, N);
end

%plot(time, Uu);

% Varying lambda:
for i = 1:4
	Uu(:,i) = getU(u, alpha, c, lambda * i, T, N);
end

%plot(time, Uu);

% Question 3
%----------------------------
trial_u = [1, 8, 9, 100];
tiral_c = [1, 2, 5, 10, 100];
tiral_lambda = [1, 2, 5, 10, 100];

%for	trial_u
%	for	trial_c
%		for tiral_lambda
%
%
%		end
%	end
%end

ruinProb = ruinProbSimulation(u, alpha, c, lambda, T, N, sim_N);

