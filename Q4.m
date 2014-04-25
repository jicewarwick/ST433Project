% Common Costants:
sigma = 1;
T = 10;
N_int = 10;
N_sim = 10;
fig = figure;

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

	% plot
	plot(Xa0);
	xlabel('time');
	ylabel('log reserve');
	print(fig, '-dpdf', '4.Xa0.pdf');
	pause();
	close;
end


% Question 2
%----------------------------------
a = 10;
if (Part2 == 1)
	Xa10 = SystemRiskModel(X0, a, sigma, N, T, N_int);

	% plot
	plot(Xa10);
	xlabel('time');
	ylabel('log reserve');
	print(fig, '-dpdf', '4.Xa10.pdf');
	pause();
	close;
end

% Question 3 & 4
%----------------------------------
D = -0.5;
if (Part3 == 1)
	a_bound = (1:20)';
	sigma_bound = (1:10)';
	N_bound = (1:20)';
	for	i = 1:size(a_bound)
		a = a_bound(i);
		for	sim = 1:N_sim
			X_a = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_a(i,sim,:) = getDefaultTime(X_a, D, T, N);
		end
		ETTau_a(i) = mean(default_time_a(i,:));
	end
	DefaultTimeDiffSummary(default_time_a);

	a = 10;
	for	i = 1:size(sigma_bound);
		sigma = sigma_bound(i);
		for	sim = 1:N_sim
			X_sigma = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_sigma(i,sim,:) = getDefaultTime(X_sigma, D, T, N);
		end
		ETTau_sigma(i) = mean(default_time_sigma(i,:));
	end
	DefaultTimeDiffSummary(default_time_sigma);

	sigma = 1;
	for	i = 1:size(N_bound)
		N = N_bound(i);
		default_time_N = zeros(i, N_sim, size(N_bound));
		for	sim = 1:N_sim
			X_N = SystemRiskModel(X0, a, sigma, N, T, N_int);
			default_time_N(i,sim,:) = getDefaultTime(X_N, D, T, N);
		end
		ETTau_N(i) = mean(default_time_N(i,:));
	end
	DefaultTimeDiffSummary(default_time_N);

	% plot
	x_label = ['a', 'sigma', 'N'];
	
	ETau_plot = [ETTau_a, ETTau_sigma, ETTau_N];
	for i = 1:size(ETau_plot)
		plot(ETau_plot(i));
		xlabel(x_label(i));
		ylabel('Expected Default Time');
		print(fig, '-dpdf', ['4.expected_default_time_vs_', x_label, '.pdf']);
		pause();
		close;
	end
	
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

