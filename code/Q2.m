% Common Constants:
S0 = 40;
r = 0.03;
sigma = 0.3;
V0 = sigma^2;
K = 40;
T = 1;
N_int = 1000;
N_sim = 1000;
N_tau_int = 1000;
N_x_int = 80;
x_max = 1;

% Question Switch
Part1 = 0;
Part3 = 0;
Part4 = 1;
Part5 = 1;
Part6 = 1;
Part7 = 1;

% Part 1:
%-----------------------
alpha = 2;
beta = 0.04;
gamma = 0.1;
rho = -0.5;

if (Part1 == 1)
	time = 0:1/N_int:T;
	stock_process = getHestonSimulation(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int);

	% plot
	fig = figure;
	plot(time, stock_process);
	title('stock price evolution under Heston model');
	xlabel('time');
	ylabel('stock price');
	saveTightFigure('2.stock_price_under_Heston.pdf');
	pause();
	close;
end

% Part 3:
%-----------------------
rho = -0.3;
K = 40;
r = 0.03;
S0 = 40;
T = 1;
N_int = 250;
alpha = 0.5;
beta = 0.5;
gamma = 0.8;

if (Part3 == 1)
	for	i = 1:100;
		T = i / 100;
		call_price_by_change_T(i) = HestonCallPricingByMonteCarlo(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int, N_sim);
	end

	% plot
	plot(call_price_by_change_T);
	xlabel('Maturity');
	ylabel('Call Option Price');
	saveTightFigure('2.call_price_by_change_T.pdf');
	pause();
	close;
end

% Part 4:
%-----------------------
if (Part4 == 1)
	K = (30:50)';
	for j = 1:N_sim
			St(:,j) = getHestonSimulation(V0, alpha, beta, gamma, S0, r, rho, K, T, N_int);
	end
	for	i = 1:size(K)
		for j = 1:N_sim
			call_val(i,j) = exp(-r*T) * max(St(T*N_int+1,j)-K(i), 0);
		end
		call_price_by_change_K(i) = mean(call_val(i,:));
	end


	% plot
	fig = figure;
	plot(K',call_price_by_change_K);
	xlabel('Strike Price');
	ylabel('Call Option Price');
	saveTightFigure('2.call_price_by_change_K.pdf');
	pause();
end

% Part 5:
%-----------------------
K = (30:50)';
t = 0;
if (Part5 == 1)
	%implied_vol = getImpliedVolatility(r, S0, K, t, T, call_price_by_change_K);
	for i = 1:size(K)
		implied_vol(i) = blkimpv(S0, K(i), r, T, call_price_by_change_K(i));
	end
	% plot
%	for i = 1:size(K);
%		BS_call_price(i) = CallPricingByBSFormula(r, sqrt(implied_vol(i)), S0, K(i), t, T);
%	end
	
	plot(K', implied_vol);
	xlabel('K');
	ylabel('Implied Volatility');
	saveTightFigure('2.implied_vol.pdf');
	pause();
	close;
end

% Part 6:
%-----------------------
K = 40;
sigma = sqrt(implied_vol(11));
barrier_bound = [25, 30, 35, 39]';

if (Part6 == 1)
	for i = 1:size(barrier_bound)
		sim_down_and_out_option_price(i) = DownAndOutOptionPricingByMonteCarlo(S0, r, sigma, K, barrier_bound(i), T, N_sim);
	end
end

% Part 7:
%-----------------------

if (Part7 == 1)
	for i = 1:size(barrier_bound)
		[V_t, V_s, V] = DownAndOutOptionPricingBySolvingPDE(r, sigma, K, barrier_bound(i), T, x_max, N_tau_int, N_x_int);

		% plot
		mesh(V_t, V_s, V);
		xlabel('time');
		ylabel('spot price');
		zlabel('barrier option price');
		name = ['2.sim_down_and_out_option_price_with_barrier_', num2str(barrier_bound(i)), '.pdf'];
		pause();
		saveTightFigure(name);
		clf;
		close;
	end
end
