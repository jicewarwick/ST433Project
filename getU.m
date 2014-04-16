function U = getU(u, alpha, c, lambda, T, N)
    time = 0:1/N:T - 1/N;
    U = u + c * time' - CompoundPoissonGenerator(lambda, alpha, T, N);

end
