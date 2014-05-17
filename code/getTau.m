function tau = getTau(U, T, N_int)
	[m, n] = size(U);
	tau = T * ones(n, 1);
	for	i = 1:n
		for	t=1:T*N_int
			if (U(t, i) < 0)
				tau(i) = t / N_int;
				break;
		end
	end
end

