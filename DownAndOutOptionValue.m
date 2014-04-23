function barrier_option_val = DownAndOutOptionValue(stock_process, strike, barrier)
	[stock_process_size, i] = size(stock_process);
	out = sum(stock_process < barrier);
	barrier_option_val = (out == 0) * stock_process(stock_process_size);
	barrier_option_val = max(barrier_option_val, 0);
end
