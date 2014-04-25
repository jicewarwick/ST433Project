function [V_t, V_s, V] = DownAndOutOptionPricingBySolvingPDE(r, sigma, K, barrier, T, x_max, N_tau_int, N_x_int)
	% solving Heat Equation:
	lambda = (1/N_tau_int) / ( (1/N_x_int) ^2 );

	tau = 0:1/N_tau_int:(sigma^2 * T/2);
	tau_dim = floor(0.5 * T * sigma^2 * N_tau_int + 1);

	x = -x_max:1/N_x_int:x_max;
	x_dim = 2 * x_max * N_x_int + 1;

	a = -0.5 * ((2*r) / (sigma^2) - 1);
	b = -a^2 - 2*r/(sigma^2);

	% barrier condition in the heat equation
	knocked_out = log(barrier / K);
	knocked_out_index = floor(x_max*N_x_int + knocked_out * N_x_int);

	u = zeros(tau_dim, x_dim);
	% initial boundary condiiton at bottom of 68
	u(1,:) = exp(-a * x) .* max(exp(x) - 1, 0);
	u(1,1:knocked_out_index) = 0;

	A = (1+lambda) * eye(x_dim, x_dim);
	A(1,2) = -lambda;
	A(x_dim, x_dim-1) = -lambda;
	for i = 2:x_dim-1
		A(i,i-1) = -lambda/2;
		A(i,i+1) = -lambda/2;
	end
	Ainv = inv(A);

	B = (1-lambda) * eye(x_dim, x_dim); 
	B(1,2) = lambda;
	B(x_dim, x_dim-1) = lambda;
	for i = 2:x_dim-1
		B(i,i-1) = lambda/2;
		B(i,i+1) = lambda/2;
	end

	for i = 1:tau_dim
		u(i+1,:) = (Ainv*B)*(u(i,:)');
		u(i+1,1:knocked_out_index) = 0;
	end

	% translate back into black and scholes price on page 79

	for	i = 1:tau_dim
		for	j = 1:x_dim
			V(i,j) = exp( a*x(j) + b*tau(i) ) * u(i,j) * K;
		end
	end

	V_t = T - 2 / (sigma^2) * tau;
	V_s = K * exp(x);
	V_t = repmat(V_t',1,x_dim);
	V_s = repmat(V_s,tau_dim,1);
	mesh(V_t, V_s, V);
end
