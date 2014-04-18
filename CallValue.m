function callVal = CallValue(stock_price, strike)
	callVal = max(0, stock_price - strike);
end
