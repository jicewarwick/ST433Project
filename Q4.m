% Common Costants:
sigma = 1;
T = 10;
N_int = 10;
N_sim = 10;

% Part Switch
Part1 = 0;
Part2 = 0;
Part3 = 1;
Part5 = 0;

% Question 1
%----------------------------------
N = 10;
a = 0;
X0 = 0;

if (Part1 == 1)
	Xa0 = SystemRiskModel(X0, a, sigma, N, T, N_int);
	plot(Xa0);
end


% Question 2
%----------------------------------
a = 10;
if (Part2 == 1)
	Xa10 = SystemRiskModel(X0, a, sigma, N, T, N_int);
	plot(Xa10);
end

% Question 3 & 4
%----------------------------------
D = -0.5;
if (Part3 == 1)
	a_bound = 1:20;
	sigma_bound = 1:10;
	N_bound = 1:20;
	for	i = a_bound
		a = i;
		for	sim = 1:N_sim
			X_a = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_a(i,sim,:) = getDefaultTime(X_a, D, T, N);
		end
		ETTau_a(i) = mean(default_time_a(i,:));

	end
		DefaultTimeDiffSummary(default_time_a);

	a = 10;
	for	i = sigma_bound;
		sigma = i;
			for	sim = 1:N_sim
			X_sigma = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_sigma(i,sim,:) = getDefaultTime(X_a, D, T, N);
		end
		ETTau_sigma(i) = mean(default_time_sigma(i,:));

	end

	sigma = 1;
	for	i = N_bound;
		N = i;
	end

	% plot
	%for	ETau_plot = [ETTau_a, ETTau_sigma, ETTau_N]
	%end
	
end

% Question 5
%----------------------------------
if (Part5 == 1)
	for	i = 1:20
		for sim = 1:N_sim;
			num_default(sim) = getNumofDefault(default_time_a(i,sim), T);
			mean_num_default_bank(i) = mean(num_default);
			var_num_default_bank(i) = var(num_default);
		end
	end

end

