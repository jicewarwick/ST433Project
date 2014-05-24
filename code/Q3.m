% Common constants:
N_int= 3000;
N_trial = 20;
N_sim = 500;
N_hist = 50;
T = 10;
time = 0:1/N_int:T;
%fig = figure;

% Question Stwich
Part1 = 0;
Part2 = 0;
Part3 = 0;
Part4 = 0;
Part5 = 1;
Part6 = 0;
Part7 = 0;

% Question 1
%----------------------------
if (Part1 == 1)
	expRand = -log(1-rand(N_sim));
	hist(expRand,N_hist);
	saveTightFigure('3.expRand.pdf')
end
% Question 2
%----------------------------
% base variable
u = 1;
alpha = 3;
c = 1.5;
lambda = 2;

% keeping all other variables constant
%--------

if (Part2 == 1)
	% Varying u:
	u_2 = (2:5)';
	for i = 1:size(u_2)
		Uu(:,i) = getU(u_2(i), alpha, c, lambda, T, N_int);
	end

	% Varying alpha:
	alpha_2 = 0.2*(1:4)';
	for i = 1:size(alpha_2)
		Ualpha(:,i) = getU(u, alpha_2(i), c, lambda, T, N_int);
	end

	% Varying c:
	c_2 = 2*(1:4)';
	for i = 1:size(c_2)
		Uc(:,i) = getU(u, alpha, c_2(i), lambda, T, N_int);
	end

	% Varying lambda:
	lambda_2 = 2*(1:4)';
	for i = 1:size(lambda_2)
		Ulambda(:,i) = getU(u, alpha, c, lambda_2(i), T, N_int);
	end

	% plot graphs
	plot(time, Uu);
		xlabel('t');
		ylabel('U');
		legend(num2str(u_2));
		saveTightFigure('3.Uu.pdf');
		pause();

	plot(time, Uc);
		xlabel('t');
		ylabel('U');
		legend(num2str(c_2));
		saveTightFigure('3.Uc.pdf');
		pause();

	plot(time, Ulambda);
		xlabel('t');
		ylabel('U');
		legend(num2str(lambda_2));
		saveTightFigure('3.Ulambda.pdf');
		pause();

	plot(time, Ualpha);
		xlabel('t')
		ylabel('U');
		legend(num2str(alpha_2));
		saveTightFigure('3.Ualpha.pdf');
		pause();
end

% Question 3
%----------------------------
u = 2;
alpha = 3;
lambda = 2;
T = 10;
c = 1;
u_bound = (2:6)';
c_bound = (1:0.5:4)';
lambda_bound = (0.5:0.4:3)';
T_bound = [1,5,10]';
sigma_bound = (0.5:0.5:3)';
sigma = 1;

if (Part3 == 1)
	for j = 1:size(T_bound)
		% varying u
		for i = 1:size(u_bound)
			ruinProbU(i,j) = ruinProbSimulation(u_bound(i), alpha, c, lambda, T_bound(j), N_int, N_sim);
			ruinProbNewU(i,j) = ruinProbSimulationWithSigma(u_bound(i), alpha, c, lambda, sigma, T_bound(j), N_int, N_sim);
		end

		% varying c
		for i = 1:size(c_bound)
			ruinProbC(i,j) = ruinProbSimulation(u, alpha, c_bound(i), lambda, T_bound(j), N_int, N_sim);
		end

		% varying lambda
		for i = 1:size(lambda_bound)
			ruinProbLambda(i,j) = ruinProbSimulation(u, alpha, c, lambda_bound(i), T_bound(j), N_int, N_sim);
			ruinProbNewLambda(i,j) = ruinProbSimulationWithSigma(u, alpha, c, lambda_bound(i), sigma, T_bound(j), N_int, N_sim);
		end

		% varying sigma
		for i = 1:size(sigma_bound)
			ruinProbNewSigma(i,j) = ruinProbSimulationWithSigma(u, alpha, c, lambda, sigma_bound(i), T_bound(j), N_int, N_sim);
		end
	end
	RuinProbOutput(ruinProbU, 'u', u_bound, T_bound, 'ruin_vs_u');
	RuinProbOutput(ruinProbC, 'c', c_bound, T_bound, 'ruin_vs_c');
	RuinProbOutput(ruinProbLambda, '\lambda', lambda_bound, T_bound, 'ruin_vs_lambda');

	RuinProbOutput(ruinProbNewU, 'u', u_bound, T_bound, 'ruin_vs_u_with_simga');
	RuinProbOutput(ruinProbNewSigma, '\sigma', sigma_bound, T_bound, 'ruin_vs_sigma_with_simga');
	RuinProbOutput(ruinProbNewLambda, '\lambda', lambda_bound, T_bound, 'ruin_vs_lambda_with_simga');
end

% Question 4
%----------------------------
alpha = 4;
lambda = 2;
c = 0.5;
T = 5;
N_int = 5000;

if (Part4 == 1)
	u = [0.5, 2, 4]';
	for i = 1:size(u)
		for	j = 1:N_sim
			U5 = getU(u(i), alpha, c, lambda, T, N_int);
			% ceil function is needed due to rounding error
			UTau5(j) = U5(ceil(N_int*getTau(U5, T, N_int)));
		end
			
		hist(-UTau5, N_hist);
		name = ['3.u_is_', num2str(u(i)), '.pdf'];
		saveTightFigure(name);
		pause();
		close();
	end
end
N_int = 1000;

% Question 5
%----------------------------
% keeping all other variables constant
%--------
alpha = 4;
lambda = 2;
c = 0.5;
T = 10;
time = 0:1/N_int:T;
sigma = 3;
T = 10;

u_5 = 2*(1:4)';
alpha_5 = 2*(1:4)';
c_5 = 2*(1:4)';
lambda_5 = 2*(1:4)';
sigma_5 = 0.5*(1:4)';

if (Part5 == 1)
	% Varying u:
	for i = 1:size(u_5)
		NewUu(:,i) = getNewU(u_5(i), alpha, c, lambda, sigma, T, N_int);
	end

	% Varying alpha:
	for i = 1:size(alpha_5)
		NewUalpha(:,i) = getNewU(u, alpha_5(i), c, lambda, sigma, T, N_int);
	end

	% Varying c:
	for i = 1:size(c_5)
		NewUc(:,i) = getNewU(u, alpha, c_5(i), lambda, sigma, T, N_int);
	end

	% Varying lambda:
	for i = 1:size(lambda_5)
		NewUlambda(:,i) = getNewU(u, alpha, c, lambda_5(i), sigma, T, N_int);
	end

	% Varying sigma:
	for i = 1:size(sigma_5)
		NewUsigma(:,i) = getNewU(u, alpha, c, lambda, sigma_5(i), T, N_int);
	end

	% Plot
		plot(time, NewUu);
		xlabel('t');
		ylabel('U');
		legend(num2str(u_5));
		saveTightFigure('3.NewUu.pdf');
		pause();

	plot(time, NewUc);
		xlabel('t');
		ylabel('U');
		legend(num2str(c_5));
		saveTightFigure('3.NewUc.pdf');
		pause();

	plot(time, NewUlambda);
		xlabel('t');
		ylabel('U');
		legend(num2str(lambda_5));
		saveTightFigure('3.NewUlambda.pdf');
		pause();

	plot(time, NewUalpha);
		xlabel('t')
		ylabel('U');
		legend(num2str(alpha_5));
		saveTightFigure('3.NewUalpha.pdf');
		pause();

	plot(time, NewUsigma);
		xlabel('t')
		ylabel('U');
		legend(num2str(sigma_5));
		saveTightFigure('3.NewUsigma.pdf');
		pause();
end

% Question 7
%----------------------------
alpha = 2;
lambda = 2;
c = 1.1;
sigma = 0.3;

if (Part7 == 1)
	for	sigma = [0.3, 1]
		for	u = [0.5, 2, 4]
			for	i= 1:N_sim
				U5 = getNewU(u, alpha, c, lambda, sigma, T, N_int);
				UTau5(i) = U5(ceil(N_int*getTau(U5, T, N_int)));
			end
				
			fig = figure;
			hist(-UTau5, N_hist);
			%title(['u = ', num2str(u), 'with sigma = ', num2str(sigma)]);
			name = ['3.u_is_', num2str(u), '_with_sigma_be_', num2str(sigma), '.pdf'];
			saveTightFigure(name);
			pause();
			close(fig);
		end
	end
end

