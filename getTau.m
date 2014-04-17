function tau = getTau(U, T, N)
	tau = T;
	for	i=1:T*N
		if (U(i) < 0)
			tau = i;
	end
end

