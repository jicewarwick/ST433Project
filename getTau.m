function tau = getTau(U, T, N)
	[m, n] = size(U);
	tau = T * ones(n, 1);
	for	i = 1:n
		for	t=1:T*N
			if (U(t, i) < 0)
				tau(i) = t / N;
		end
	end
end

