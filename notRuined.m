% return 0 if it is not ruined, positive if it is ruined
function notruined = notRuined(U)
	notruined = 1 - isRuined(U);
end
