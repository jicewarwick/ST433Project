% Common Costants:
sigma = 1;
T = 10;
N_sim = 100;

% Part Switch
Part1 = 0;
Part2 = 1;
Part3 = 0;
Part4 = 0;
Part5 = 0;
Part6 = 0;

% Question 1
%----------------------------------
N = 10;
a = 0;
X0 = 0;

if (Part1 == 1)
	X2 = SystemRiskModel(X0, a, sigma, N, T, N_sim);
	plot(X2);
end


% Question 2
%----------------------------------
a = 10;
if (Part2 == 1)
	X3 = SystemRiskModel(X0, a, sigma, N, T, N_sim);
	plot(X3);
end

% Question 3
%----------------------------------
D = -0.5;
if (Part3 == 1)
	

end

% Question 4
%----------------------------------
if (Part4 == 1)

end


% Question 5
%----------------------------------
if (Part5 == 1)

end

% Question 6
%----------------------------------
if (Part6 == 1)

end
