% return 0 if it is not ruined, positive if it is ruined
function ruined = isRuined(U)
	ruined = sum(U < 0);
end
