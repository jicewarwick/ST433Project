function output = DefaultReport(x, x_bound, mean_def_time, var_def_time, mean_num_defs, var_num_defs, filename)
	FID = fopen([filename, '.tex'], 'w');
	fprintf(FID, '\\begin{tabular}{r|rrrr}\\hline \n');
	% banner
	fprintf(FID, '& $\\mathbb{E}[\\tau_i]$&Var$[\\tau_i]$&$\\mathbb{E}[L]$&Var$[L]$\\\\ \\hline\n');

	% Content
	for i=1:size(x_bound)
		fprintf(FID, '$%s$ = %6.2f ',x, x_bound(i));
		fprintf(FID, '& %6.2f & %6.2f& %6.2f& %6.2f', mean_def_time(i), var_def_time(i), mean_num_defs(i), var_num_defs(i));
		fprintf(FID, '\\\\ \n');
	end
	fprintf(FID, '\\end{tabular}\n');
	fclose(FID);
end
