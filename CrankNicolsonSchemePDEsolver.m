%function reat_equation CrankNicolsonSchemePDESolver(r, sigma, strike, barrier, T, x_max, N_tau_int, N_x_int)
	% solving Heat Equation:
	lambda = (1/N_tau_int) / ( (1/N_x_int) ^2 );
	x_dim = 2 * x_max * N_x_int + 1;
	tau_dim = T * N_tau_int + 1;
	knocked_out = log(barrier / strike);
	knocked_out_index = floor(x_max*N_x_int + knocked_out * N_x_int);

	u = zeros(tau_dim, x_dim);

	tau = 0:1/N_tau_int:T;
	x = -x_max:1/N_x_int:x_max;
	u(1,:) = exp(0.5 * ( 2*r/ (sigma^2) -1) * x) .* max(K*exp(x) - K, 0) / K;
	u(1,1:knocked_out_index) = 0;


	A = (1+lambda) * eye(x_dim, x_dim);
	A(1,2) = -lambda/2;
	A(x_dim-1, x_dim) = -lambda/2;
	for i = 2:x_dim-1
		A(i,i-1) = -lambda/2;
		A(i,i+1) = -lambda/2;
	end
	Ainv = inv(A);

	B = (1-lambda) * eye(x_dim, x_dim); 
	B(1,2) = lambda/2;
	B(x_dim-1, x_dim) = lambda/2;
	for i = 2:x_dim-1
		B(i,i-1) = lambda/2;
		B(i,i+1) = lambda/2;
	end

	for i = 1:tau_dim
		u(i+1,:) = (Ainv*B)*(u(i,:)');
		u(i+1,1:knocked_out_index) = 0;
	end

	% translate back into black and scholes price on page 79
	a = -0.5 * ((2*r) / (sigma^2) - 1);
	b = -a^2 - 2*r/(sigma^2);

	for	i = 1:tau_dim
		for	j = 1:x_dim
			V(i,j) = exp(b*i/N_tau_int + a*(j-x_max*N_x_int-1)/N_x_int);
			V(i,j) = V(i,j) * u(i,j) * spot;
		end
	end
	V_t_index = T - 2 / (sigma^2) * tau;
	V_s_index = K * exp(x);
	V_t = repmat(V_t_index',1,x_dim);
	V_s = repmat(V_s_index,tau_dim,1);
%end

