% Common constants:
N = 1000;
N_trial = 20;
sim_N = 1000;
T = 5;
time = 0:1/N:T-1/N;

% Question Stwich
Part1 = 0;
Part2 = 0;
Part3 = 0;
Part4 = 1;
Part5 = 0;
Part6 = 0;
Part7 = 0;

% Question 1
%----------------------------
if (Part1 == 1)
	expRand = -log(1-rand(N));
	hist(expRand,100);
end
% Question 2
%----------------------------
% base variable
u = 1;
alpha = 1;
c = 1;
lambda = 1;

% keeping all other variables constant
%--------

if (Part2 == 1)
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

	% plot graphs
	plot(time, Uu);
		xlabel('u');
		ylabel('U');
		print(fig, '-dpdf', '3.Uu.pdf');
		pause();

	plot(time, Uc);
		xlabel('c');
		ylabel('U');
		print(fig, '-dpdf', '3.Uc.pdf');
		pause();

	plot(time, Ulambda);
		xlabel('lambda');
		ylabel('U');
		print(fig, '-dpdf', '3.Ulambda.pdf');
		pause();

	plot(time, Ualpha);
		xlabel('alpha')
		ylabel('U');
		print(fig, '-dpdf', '3.Ualpha.pdf');
		pause();
end

% Question 3
%----------------------------
if (Part3 == 1)

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

end

% Question 4
%----------------------------
alpha = 4;
lambda = 2;
c = 0.5;

if (Part4 == 1)
	for	u = [0.5, 2, 4]
		for	i= 1:sim_N
			U5(:,i) = getU(u, alpha, c, lambda, T, N);
			if (notRuined( U5(:,i) ) == 1)
				UTau5(i) = U5(T*N, i);
			else
				UTau5(i) = U5(getTau(U5, T, N));
			end
		end
			
		hist(-UTau5, 50);
		title(['u is ', num2str(u)]);
		name = ['3.u is ', num2str(u)];
		print(fig, '-dpdf', name);
		pause();
	end
end

% Question 5
%----------------------------
% keeping all other variables constant
%--------
if (Part5 == 1)
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
		NewUsigma(:,i) = getNewU(u, alpha, c, lambda, i * sigma, T, N);
	end

	% Plot
		plot(time, NewUu);
		xlabel('u');
		ylabel('U');
		print(fig, '-dpdf', '3.NewUu.pdf');
		pause();

	plot(time, NewUc);
		xlabel('c');
		ylabel('U');
		print(fig, '-dpdf', '3.NewUc.pdf');
		pause();

	plot(time, NewUlambda);
		xlabel('lambda');
		ylabel('U');
		print(fig, '-dpdf', '3.NewUlambda.pdf');
		pause();

	plot(time, NewUalpha);
		xlabel('alpha')
		ylabel('U');
		print(fig, '-dpdf', '3.NewUalpha.pdf');
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
			for	i= 1:sim_N
				U5(:,i) = getNewU(u, alpha, c, lambda, sigma, T, N);
				if (notRuined( U5(:,i) ) == 1)
					UTau5(i) = U5(T*N, i);
				else
					UTau5(i) = U5(getTau(U5, T, N));
				end
			end
				
			fig = figure;
			hist(-UTau5, 50);
			title(['u = ', num2str(u), 'with sigma = ', num2str(sigma)]);
			name = ['3.uIs', num2str(u), 'WithSigmaBe', num2str(sigma), '.pdf'];
			print(fig, '-dpdf', name);
			pause();
			close(fig);
		end
	end
end

