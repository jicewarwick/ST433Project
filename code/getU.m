function U = getU(u, alpha, c, lambda, T, N_int)
    time = 0:1/N_int:T;
    U = u + c * time' - CompoundPoissonGenerator(lambda, alpha, T, N_int);
end
