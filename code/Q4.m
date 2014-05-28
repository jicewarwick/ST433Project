% Common Costants:
sigma = 5;
T = 10;
N_int = 200;
N_sim = 200;

% Part Switch
Part1 = 0;
Part2 = 0;
Part3_a = 1;
Part3_sigma = 0;
Part3_N = 1;

% Question 1
%----------------------------------
N = 10;
a = 0;
X0 = 0;

if (Part1 == 1)
	Xa0 = SystemRiskModel(X0, a, sigma, N, T, N_int);
	t = (0:1/N_int:T)';

	% plot
	plot(t,Xa0);
	xlabel('time');
	ylabel('log reserve');
	saveTightFigure('4.Xa0.pdf');
	pause();
	close;
end


% Question 2
%----------------------------------
a = 10;
if (Part2 == 1)
	Xa10 = SystemRiskModel(X0, a, sigma, N, T, N_int);
	t = (0:1/N_int:T)';

	% plot
	plot(t,Xa10);
	xlabel('time');
	ylabel('log reserve');
	saveTightFigure('4.Xa10.pdf');
	pause();
	close;
end

% Question 3 & 4 & 5
%----------------------------------
D = -0.75;
N = 10;
a = 10;
T = 10;
sigma = 1;
a_bound = (0:5:20)';
sigma_bound = (0.1:0.5:1.6)';
N_bound = (5:5:20)';

if (Part3_a == 1)
	% default_time_a stores the default time at the first N entry,
	% followed by the mean and variance of default time, mean and variance
	% of number of default banks in this simulation.
	for	i = 1:size(a_bound)
		for	sim = 1:N_sim
			X_a = SystemRiskModel(X0, a_bound(i), sigma, N, T, N_int);
			default_time_a(i,sim,1:N) = getDefaultTime(X_a, D, T, N_int);
			default_time_a(i,sim,N+1) = mean(default_time_a(i,sim,1:N));
			default_time_a(i,sim,N+2) = var(default_time_a(i,sim,1:N));
			default_time_a(i,sim,N+3) = getNumofDefault(default_time_a(i,sim,1:N), T);
		end
		ETTau_a(i) = mean(default_time_a(i,:,N+1));
		VarTTau_a(i) = mean(default_time_a(i,:,N+2));
		mean_num_default_bank_a(i) = mean(default_time_a(i,:,N+3));
		var_num_default_bank_a(i) = var(default_time_a(i,:,N+3));
	end

	name = ['system_risk_model_a_', num2str(D)];
	DefaultReport('a', a_bound, ETTau_a, VarTTau_a, mean_num_default_bank_a, var_num_default_bank_a, name);
end

if (Part3_sigma == 1)
	for	i = 1:size(sigma_bound)
		for	sim = 1:N_sim
			X_sigma = SystemRiskModel(X0, a, sigma_bound(i), N, T, N_int);
			default_time_sigma(i,sim,1:N) = getDefaultTime(X_sigma, D, T, N_int);
			default_time_sigma(i,sim,N+1) = mean(default_time_sigma(i,sim,1:N));
			default_time_sigma(i,sim,N+2) = var(default_time_sigma(i,sim,1:N));
			default_time_sigma(i,sim,N+3) = getNumofDefault(default_time_sigma(i,sim,1:N), T);
		end
		ETTau_sigma(i) = mean(default_time_sigma(i,:,N+1));
		VarTTau_sigma(i) = mean(default_time_sigma(i,:,N+2));
		mean_num_default_bank_sigma(i) = mean(default_time_sigma(i,:,N+3));
		var_num_default_bank_sigma(i) = var(default_time_sigma(i,:,N+3));
	end

	name = ['system_risk_model_sigma_', num2str(D)];
	DefaultReport('\sigma', sigma_bound, ETTau_sigma, VarTTau_sigma, mean_num_default_bank_sigma, var_num_default_bank_sigma, name);
end

if (Part3_N == 1)
	for	i = 1:size(N_bound)
		N = N_bound(i);
		for	sim = 1:N_sim
			X_N = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_N(i,sim,1:N) = getDefaultTime(X_N, D, T, N_int);
			default_time_N(i,sim,N+1) = mean(default_time_N(i,sim,1:N));
			default_time_N(i,sim,N+2) = var(default_time_N(i,sim,1:N));
			default_time_N(i,sim,N+3) = getNumofDefault(default_time_N(i,sim,1:N), T);
		end
		ETTau_N(i) = mean(default_time_N(i,:,N+1));
		VarTTau_N(i) = mean(default_time_N(i,:,N+2));
		mean_num_default_bank_N(i) = mean(default_time_N(i,:,N+3));
		var_num_default_bank_N(i) = var(default_time_N(i,:,N+3));
	end

	name = ['system_risk_model_N_', num2str(D)];
	DefaultReport('N', N_bound, ETTau_N, VarTTau_N, mean_num_default_bank_N, var_num_default_bank_N, name);
end
