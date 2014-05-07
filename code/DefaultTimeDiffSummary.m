function [min_diff_default_time mean_diff_default_time, max_diff_default_time] = DefaultTimeDiffSummary(default_time)
	[N_diff_para N_sim, N] = size(default_time);
	for	i = 1:N_diff_para
		for	sim = 1:N_sim
			diff_default_time(sim) = max(default_time(i,sim,:)) - min(default_time(i,sim,:));
		end
		max_diff_default_time(i) = max(diff_default_time);
		mean_diff_default_time(i) = mean(diff_default_time);
		min_diff_default_time(i) = min(diff_default_time);
	end

	%plot
	figure;
	hold on;
	plot(1:N_diff_para, min_diff_default_time, 1:N_diff_para, mean_diff_default_time, 1:N_diff_para, max_diff_default_time);
	diff_legend = legend('Min Defualt Time Difference', 'Mean Defualt Time Difference', 'Max Defualt Time Difference');
	pause();
	close;

end
