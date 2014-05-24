function output = RuinProbOutput(ruinProb, x, x_bound, T_bound, filename)
	FID = fopen([filename, '.tex'], 'w');
	row = size(T_bound);
	fprintf(FID, '\\begin{tabular}{r|%s}\\hline \n', repmat('r', 1, row(1)));
	% banner
	fprintf(FID, 'T');
	for j = 1:size(T_bound)
		fprintf(FID, '&%8.2f ', T_bound(j));
	end
	fprintf(FID, '\\\\ \\hline \n');

	% Content
	for i=1:size(x_bound)
		fprintf(FID, '$%s$ = %8.2f ',x, x_bound(i,1));
		for j = 1:size(T_bound)
			fprintf(FID, '& %8.2f ', ruinProb(i,j));
		end
		fprintf(FID, '\\\\ \n');
	end
	fprintf(FID, '\\end{tabular}\n');
	fclose(FID);
end
