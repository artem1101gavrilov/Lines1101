--рисуем все наши кружочки
function drawcircle( tableGame )
	for i = 1,9 do
		for j = 1,9 do
			if tableGame[i][j].pole ~= 0 then
				if tableGame[i][j].pole == 1 then
					love.graphics.setColor(250, 0, 0)
				elseif tableGame[i][j].pole == 2 then
					love.graphics.setColor(250, 130, 0)
				elseif tableGame[i][j].pole == 3 then	
					love.graphics.setColor(250, 250, 0)
				elseif tableGame[i][j].pole == 4 then	
					love.graphics.setColor(0, 250, 0)
				elseif tableGame[i][j].pole == 5 then	
					love.graphics.setColor(0, 150, 250)	
				elseif tableGame[i][j].pole == 6 then	
					love.graphics.setColor(0, 0, 250)
				elseif tableGame[i][j].pole == 7 then	
					love.graphics.setColor(250, 0, 250)
				end
				love.graphics.circle("fill", 50*(i-1)+25, 50*(j-1)+25, 20, 20)
			end
		end
	end
end

--добавляем по три элемента
function add3circle( tableGame )
	for i = 1,3 do
		zapolnenie = true
		while zapolnenie do
			x = math.random(1,9)
			y = math.random(1,9)
			color = math.random(1,7)
			if tableGame[x][y].pole == 0 then
				tableGame[x][y].pole = color
				zapolnenie = false
			end
		end
	end
end

--проверяем, можно ли добавить три элемента в игру
-- если можно - добавляем
-- если нельзя - заканчиваем игру.
function canadd3circle( tableGame )
	countNULL = 0
	for i = 1,9 do
		for j = 1,9 do
			if tableGame[i][j].pole == 0 then
				countNULL = countNULL + 1
			end
		end
	end
	if countNULL > 3 then
		add3circle(tableGame)
	else
		return false
	end 
	return true
end

function allCheckLines( tableGame )
	CheckRightLines(tableGame)
	CheckDawnLines(tableGame)
	CheckUpDiagonal(tableGame)
	CheckDawnDiagonal(tableGame)
	--updateAfterCheck(tableGame)
end

function CheckDawnLines( tableGame )
	for i = 1,9 do
		--после пятого элемента в строке нет смысла проверять слудющие элементы
		for j = 1,9 do
			if tableGame[i][j].pole > 0 then
				if j < 2 then
					--если все 9 элементов в линию сошлись 
					if tableGame[i][1].pole == tableGame[i][2].pole and tableGame[i][1].pole == tableGame[i][3].pole and tableGame[i][1].pole == tableGame[i][4].pole and tableGame[i][1].pole == tableGame[i][5].pole and tableGame[i][1].pole == tableGame[i][6].pole and tableGame[i][1].pole == tableGame[i][7].pole and tableGame[i][1].pole == tableGame[i][8].pole and tableGame[i][1].pole == tableGame[i][9].pole then
						tableGame[i][1].y = 1
						tableGame[i][2].y = 1
						tableGame[i][3].y = 1
						tableGame[i][4].y = 1
						tableGame[i][5].y = 1
						tableGame[i][6].y = 1
						tableGame[i][7].y = 1
						tableGame[i][8].y = 1
						tableGame[i][9].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 45
						break
					end
				end
				if j < 3 then
					--если 8 элементов в линию сошлись 
					if tableGame[i][j].pole == tableGame[i][j+1].pole and tableGame[i][j].pole == tableGame[i][j+2].pole and tableGame[i][j].pole == tableGame[i][j+3].pole and tableGame[i][j].pole == tableGame[i][j+4].pole and tableGame[i][j].pole == tableGame[i][j+5].pole and tableGame[i][j].pole == tableGame[i][j+6].pole and tableGame[i][j].pole == tableGame[i][j+7].pole then
						tableGame[i][j].y = 1
						tableGame[i][j+1].y = 1
						tableGame[i][j+2].y = 1
						tableGame[i][j+3].y = 1
						tableGame[i][j+4].y = 1
						tableGame[i][j+5].y = 1
						tableGame[i][j+6].y = 1
						tableGame[i][j+7].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 32
						break
					end
				end
				if j < 4 then
					--если 7 элементов в линию
					if tableGame[i][j].pole == tableGame[i][j+1].pole and tableGame[i][j].pole == tableGame[i][j+2].pole and tableGame[i][j].pole == tableGame[i][j+3].pole and tableGame[i][j].pole == tableGame[i][j+4].pole and tableGame[i][j].pole == tableGame[i][j+5].pole and tableGame[i][j].pole == tableGame[i][j+6].pole then
						tableGame[i][j].y = 1
						tableGame[i][j+1].y = 1
						tableGame[i][j+2].y = 1
						tableGame[i][j+3].y = 1
						tableGame[i][j+4].y = 1
						tableGame[i][j+5].y = 1
						tableGame[i][j+6].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 21
						break
					end
				end
				if j < 5 then
					-- если 6 элементов в линию
					if tableGame[i][j].pole == tableGame[i][j+1].pole and tableGame[i][j].pole == tableGame[i][j+2].pole and tableGame[i][j].pole == tableGame[i][j+3].pole and tableGame[i][j].pole == tableGame[i][j+4].pole and tableGame[i][j].pole == tableGame[i][j+5].pole then
						tableGame[i][j].y = 1
						tableGame[i][j+1].y = 1
						tableGame[i][j+2].y = 1
						tableGame[i][j+3].y = 1
						tableGame[i][j+4].y = 1
						tableGame[i][j+5].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 12
						break
					end 
				end
				if j < 6 then
					--если 5 элементов в линию
					if tableGame[i][j].pole == tableGame[i][j+1].pole and tableGame[i][j].pole == tableGame[i][j+2].pole and tableGame[i][j].pole == tableGame[i][j+3].pole and tableGame[i][j].pole == tableGame[i][j+4].pole then
						tableGame[i][j].y = 1
						tableGame[i][j+1].y = 1
						tableGame[i][j+2].y = 1
						tableGame[i][j+3].y = 1
						tableGame[i][j+4].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 5
						break
					end 
				end
			end
		end
	end
end

function CheckRightLines( tableGame)
	for j = 1,9 do
		--после пятого элемента в строке нет смысла проверять слудющие элементы
		for i = 1,9 do
			if tableGame[i][j].pole > 0 then 
				if i < 2 then 
					--если все 9 элементов в линию сошлись 
					if tableGame[1][j].pole == tableGame[2][j].pole and tableGame[1][j].pole == tableGame[3][j].pole and tableGame[1][j].pole == tableGame[4][j].pole and tableGame[1][j].pole == tableGame[5][j].pole and tableGame[1][j].pole == tableGame[6][j].pole and tableGame[1][j].pole == tableGame[7][j].pole and tableGame[1][j].pole == tableGame[8][j].pole and tableGame[1][j].pole == tableGame[9][j].pole then
						tableGame[1][j].y = 1
						tableGame[2][j].y = 1
						tableGame[3][j].y = 1
						tableGame[4][j].y = 1
						tableGame[5][j].y = 1
						tableGame[6][j].y = 1
						tableGame[7][j].y = 1
						tableGame[8][j].y = 1
						tableGame[9][j].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 45
						break
					end
				end
				if i < 3 then 
					--если 8 элементов в линию сошлись 
					if tableGame[i][j].pole == tableGame[i+1][j].pole and tableGame[i][j].pole == tableGame[i+2][j].pole and tableGame[i][j].pole == tableGame[i+3][j].pole and tableGame[i][j].pole == tableGame[i+4][j].pole and tableGame[i][j].pole == tableGame[i+5][j].pole and tableGame[i][j].pole == tableGame[i+6][j].pole and tableGame[i][j].pole == tableGame[i+7][j].pole then
						tableGame[i][j].y = 1
						tableGame[i+1][j].y = 1
						tableGame[i+2][j].y = 1
						tableGame[i+3][j].y = 1
						tableGame[i+4][j].y = 1
						tableGame[i+5][j].y = 1
						tableGame[i+6][j].y = 1
						tableGame[i+7][j].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 32
						break
					end
				end
				if i < 4 then
					--если 7 элементов в линию
					if tableGame[i][j].pole == tableGame[i+1][j].pole and tableGame[i][j].pole == tableGame[i+2][j].pole and tableGame[i][j].pole == tableGame[i+3][j].pole and tableGame[i][j].pole == tableGame[i+4][j].pole and tableGame[i][j].pole == tableGame[i+5][j].pole and tableGame[i][j].pole == tableGame[i+6][j].pole then
						tableGame[i][j].y = 1
						tableGame[i+1][j].y = 1
						tableGame[i+2][j].y = 1
						tableGame[i+3][j].y = 1
						tableGame[i+4][j].y = 1
						tableGame[i+5][j].y = 1
						tableGame[i+6][j].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 21
						break
					end
				end
				if i < 5 then
					-- если 6 элементов в линию
					if tableGame[i][j].pole == tableGame[i+1][j].pole and tableGame[i][j].pole == tableGame[i+2][j].pole and tableGame[i][j].pole == tableGame[i+3][j].pole and tableGame[i][j].pole == tableGame[i+4][j].pole and tableGame[i][j].pole == tableGame[i+5][j].pole then
						tableGame[i][j].y = 1
						tableGame[i+1][j].y = 1
						tableGame[i+2][j].y = 1
						tableGame[i+3][j].y = 1
						tableGame[i+4][j].y = 1
						tableGame[i+5][j].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 12
						break
					end
				end
				if i < 6 then
					--если 5 элементов в линию
					if tableGame[i][j].pole == tableGame[i+1][j].pole and tableGame[i][j].pole == tableGame[i+2][j].pole and tableGame[i][j].pole == tableGame[i+3][j].pole and tableGame[i][j].pole == tableGame[i+4][j].pole then
						tableGame[i][j].y = 1
						tableGame[i+1][j].y = 1
						tableGame[i+2][j].y = 1
						tableGame[i+3][j].y = 1
						tableGame[i+4][j].y = 1
						tableGame[1][1].result = tableGame[1][1].result + 5
						break
					end 
				end
			end
		end
	end
end

function CheckUpDiagonal( tableGame )
	--Для первой диагонали (начало в (1,1))
	if CheckUpDiagonal9(tableGame, 1, 1) == false then
		if CheckUpDiagonal8(tableGame, 1, 1) == false then
			if CheckUpDiagonal8(tableGame, 2, 2) == false then
				if CheckUpDiagonal7(tableGame, 1, 1) == false then
					if CheckUpDiagonal7(tableGame, 2, 2) == false then
						if CheckUpDiagonal7(tableGame, 3, 3) == false then
							if CheckUpDiagonal6(tableGame, 1, 1) == false then
								if CheckUpDiagonal6(tableGame, 2, 2) == false then
									if CheckUpDiagonal6(tableGame, 3, 3) == false then
										if CheckUpDiagonal6(tableGame, 4, 4) == false then
											if CheckUpDiagonal5(tableGame, 1, 1) == false then
												if CheckUpDiagonal5(tableGame, 2, 2) == false then
													if CheckUpDiagonal5(tableGame, 3, 3) == false then
														if CheckUpDiagonal5(tableGame, 4, 4) == false then
															CheckUpDiagonal5(tableGame, 5, 5)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end	
		end
	end
	
	--Для второй диагонали (начало в (2,1))
	if CheckUpDiagonal8(tableGame, 2, 1) == false then
		if CheckUpDiagonal7(tableGame, 2, 1) == false then
			if CheckUpDiagonal7(tableGame, 3, 2) == false then
					if CheckUpDiagonal6(tableGame, 2, 1) == false then
						if CheckUpDiagonal6(tableGame, 3, 2) == false then
							if CheckUpDiagonal6(tableGame, 4, 3) == false then
									if CheckUpDiagonal5(tableGame, 2, 1) == false then
										if CheckUpDiagonal5(tableGame, 3, 2) == false then
											if CheckUpDiagonal5(tableGame, 4, 3) == false then
													CheckUpDiagonal5(tableGame, 5, 4)
											end
										end
									end
							end
						end
					end
			end
		end
	end	
	
	--для третий диагонали (начало в (1,2))
	if CheckUpDiagonal8(tableGame, 1, 2) == false then
		if CheckUpDiagonal7(tableGame, 1, 2) == false then
			if CheckUpDiagonal7(tableGame, 2, 3) == false then
					if CheckUpDiagonal6(tableGame, 1, 2) == false then
						if CheckUpDiagonal6(tableGame, 2, 3) == false then
							if CheckUpDiagonal6(tableGame, 3, 4) == false then
									if CheckUpDiagonal5(tableGame, 1, 2) == false then
										if CheckUpDiagonal5(tableGame, 2, 3) == false then
											if CheckUpDiagonal5(tableGame, 3, 4) == false then
													CheckUpDiagonal5(tableGame, 4, 5)
											end
										end
									end
							end
						end
					end
			end
		end
	end	
	
	--Для 4 диагонали (начало в (3,1))
	if CheckUpDiagonal7(tableGame, 3, 1) == false then
				if CheckUpDiagonal6(tableGame, 3, 1) == false then
					if CheckUpDiagonal6(tableGame, 4, 2) == false then
								if CheckUpDiagonal5(tableGame, 3, 1) == false then
									if CheckUpDiagonal5(tableGame, 4, 2) == false then
												CheckUpDiagonal5(tableGame, 5, 3)
									end
								end
					end
				end
	end	
		
	--для 5 диагонали (начало в (1,3))
	if CheckUpDiagonal7(tableGame, 1, 3) == false then
				if CheckUpDiagonal6(tableGame, 1, 3) == false then
					if CheckUpDiagonal6(tableGame, 2, 4) == false then
								if CheckUpDiagonal5(tableGame, 1, 3) == false then
									if CheckUpDiagonal5(tableGame, 2, 4) == false then
												CheckUpDiagonal5(tableGame, 3, 5)
									end
								end
					end
				end
	end
		
	--Для 6 диагонали (начало в (4,1))
	if CheckUpDiagonal6(tableGame, 4, 1) == false then
					if CheckUpDiagonal5(tableGame, 4, 1) == false then
									CheckUpDiagonal5(tableGame, 5, 2)
					end
	end
	
	--для 7 диагонали (начало в (1,4))
				if CheckUpDiagonal6(tableGame, 1, 4) == false then
								if CheckUpDiagonal5(tableGame, 1, 4) == false then
												CheckUpDiagonal5(tableGame, 2, 5)
								end
				end
				
	--Для 8 диагонали (начало в (5,1))
	CheckUpDiagonal5(tableGame, 5, 1) 
	
	--Для 9 диагонали (начало в (1,5))
	CheckUpDiagonal5(tableGame, 1, 5) 
end

function CheckUpDiagonal9( tableGame, i, j )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j+1].pole and tableGame[i][j].pole == tableGame[i+2][j+2].pole and tableGame[i][j].pole == tableGame[i+3][j+3].pole and tableGame[i][j].pole == tableGame[i+4][j+4].pole and tableGame[i][j].pole == tableGame[i+5][j+5].pole and tableGame[i][j].pole == tableGame[i+6][j+6].pole and tableGame[i][j].pole == tableGame[i+7][j+7].pole and tableGame[i][j].pole == tableGame[i+8][j+8].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j+1].y = 1
			tableGame[i+2][j+2].y = 1
			tableGame[i+3][j+3].y = 1
			tableGame[i+4][j+4].y = 1
			tableGame[i+5][j+5].y = 1
			tableGame[i+6][j+6].y = 1
			tableGame[i+7][j+7].y = 1
			tableGame[i+8][j+8].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 45
			return true
		end
	end
	return false
end

function CheckUpDiagonal8( tableGame, i, j )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j+1].pole and tableGame[i][j].pole == tableGame[i+2][j+2].pole and tableGame[i][j].pole == tableGame[i+3][j+3].pole and tableGame[i][j].pole == tableGame[i+4][j+4].pole and tableGame[i][j].pole == tableGame[i+5][j+5].pole and tableGame[i][j].pole == tableGame[i+6][j+6].pole and tableGame[i][j].pole == tableGame[i+7][j+7].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j+1].y = 1
			tableGame[i+2][j+2].y = 1
			tableGame[i+3][j+3].y = 1
			tableGame[i+4][j+4].y = 1
			tableGame[i+5][j+5].y = 1
			tableGame[i+6][j+6].y = 1
			tableGame[i+7][j+7].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 32
			return true
		end
	end
	return false
end

function CheckUpDiagonal7( tableGame, i, j )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j+1].pole and tableGame[i][j].pole == tableGame[i+2][j+2].pole and tableGame[i][j].pole == tableGame[i+3][j+3].pole and tableGame[i][j].pole == tableGame[i+4][j+4].pole and tableGame[i][j].pole == tableGame[i+5][j+5].pole and tableGame[i][j].pole == tableGame[i+6][j+6].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j+1].y = 1
			tableGame[i+2][j+2].y = 1
			tableGame[i+3][j+3].y = 1
			tableGame[i+4][j+4].y = 1
			tableGame[i+5][j+5].y = 1
			tableGame[i+6][j+6].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 21
			return true
		end
	end
	return false
end

function CheckUpDiagonal6( tableGame, i, j )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j+1].pole and tableGame[i][j].pole == tableGame[i+2][j+2].pole and tableGame[i][j].pole == tableGame[i+3][j+3].pole and tableGame[i][j].pole == tableGame[i+4][j+4].pole and tableGame[i][j].pole == tableGame[i+5][j+5].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j+1].y = 1
			tableGame[i+2][j+2].y = 1
			tableGame[i+3][j+3].y = 1
			tableGame[i+4][j+4].y = 1
			tableGame[i+5][j+5].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 12
			return true
		end
	end
	return false
end

function CheckUpDiagonal5( tableGame, i, j )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j+1].pole and tableGame[i][j].pole == tableGame[i+2][j+2].pole and tableGame[i][j].pole == tableGame[i+3][j+3].pole and tableGame[i][j].pole == tableGame[i+4][j+4].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j+1].y = 1
			tableGame[i+2][j+2].y = 1
			tableGame[i+3][j+3].y = 1
			tableGame[i+4][j+4].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 5
			return true
		end
	end
	return false
end

function CheckDawnDiagonal( tableGame )
	--Для первой диагонали (начало в (9,1))
	if CheckDawnDiagonal9(tableGame, 9, 1) == false then
		if CheckDawnDiagonal8(tableGame, 9, 1) == false then
			if CheckDawnDiagonal8(tableGame, 8, 2) == false then
				if CheckDawnDiagonal7(tableGame, 9, 1) == false then
					if CheckDawnDiagonal7(tableGame, 8, 2) == false then
						if CheckDawnDiagonal7(tableGame, 7, 3) == false then
							if CheckDawnDiagonal6(tableGame, 9, 1) == false then
								if CheckDawnDiagonal6(tableGame, 8, 2) == false then
									if CheckDawnDiagonal6(tableGame, 7, 3) == false then
										if CheckDawnDiagonal6(tableGame, 6, 4) == false then
											if CheckDawnDiagonal5(tableGame, 9, 1) == false then
												if CheckDawnDiagonal5(tableGame, 8, 2) == false then
													if CheckDawnDiagonal5(tableGame, 7, 3) == false then
														if CheckDawnDiagonal5(tableGame, 6, 4) == false then
															CheckDawnDiagonal5(tableGame, 5, 5)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end	
		end
	end
	
	--Для второй диагонали (начало в (8,1))
	if CheckDawnDiagonal8(tableGame, 8, 1) == false then
		if CheckDawnDiagonal7(tableGame, 8, 1) == false then
			if CheckDawnDiagonal7(tableGame, 7, 2) == false then
					if CheckDawnDiagonal6(tableGame, 8, 1) == false then
						if CheckDawnDiagonal6(tableGame, 7, 2) == false then
							if CheckDawnDiagonal6(tableGame, 6, 3) == false then
									if CheckDawnDiagonal5(tableGame, 8, 1) == false then
										if CheckDawnDiagonal5(tableGame, 7, 2) == false then
											if CheckDawnDiagonal5(tableGame, 6, 3) == false then
													CheckDawnDiagonal5(tableGame, 5, 4)
											end
										end
									end
							end
						end
					end
			end
		end
	end	
	
	--для третий диагонали (начало в (9,2))
	if CheckDawnDiagonal8(tableGame, 9, 2) == false then
		if CheckDawnDiagonal7(tableGame, 9, 2) == false then
			if CheckDawnDiagonal7(tableGame, 8, 3) == false then
					if CheckDawnDiagonal6(tableGame, 9, 2) == false then
						if CheckDawnDiagonal6(tableGame, 8, 3) == false then
							if CheckDawnDiagonal6(tableGame, 7, 4) == false then
									if CheckDawnDiagonal5(tableGame, 9, 2) == false then
										if CheckDawnDiagonal5(tableGame, 8, 3) == false then
											if CheckDawnDiagonal5(tableGame, 7, 4) == false then
													CheckDawnDiagonal5(tableGame, 6, 5)
											end
										end
									end
							end
						end
					end
			end
		end
	end	
	
	--Для 4 диагонали (начало в (7,1))
	if CheckDawnDiagonal7(tableGame, 7, 1) == false then
				if CheckDawnDiagonal6(tableGame, 7, 1) == false then
					if CheckDawnDiagonal6(tableGame, 6, 2) == false then
								if CheckDawnDiagonal5(tableGame, 7, 1) == false then
									if CheckDawnDiagonal5(tableGame, 6, 2) == false then
												CheckDawnDiagonal5(tableGame, 5, 3)
									end
								end
					end
				end
	end	
		
	--для 5 диагонали (начало в (9,3))
	if CheckDawnDiagonal7(tableGame, 9, 3) == false then
				if CheckDawnDiagonal6(tableGame, 9, 3) == false then
					if CheckDawnDiagonal6(tableGame, 8, 4) == false then
								if CheckDawnDiagonal5(tableGame, 9, 3) == false then
									if CheckDawnDiagonal5(tableGame, 8, 4) == false then
												CheckDawnDiagonal5(tableGame, 7, 5)
									end
								end
					end
				end
	end
		
	--Для 6 диагонали (начало в (6,1))
	if CheckDawnDiagonal6(tableGame, 6, 1) == false then
					if CheckDawnDiagonal5(tableGame, 6, 1) == false then
									CheckDawnDiagonal5(tableGame, 5, 2)
					end
	end
	
	--для 7 диагонали (начало в (9,4))
				if CheckDawnDiagonal6(tableGame, 9, 4) == false then
								if CheckDawnDiagonal5(tableGame, 9, 4) == false then
												CheckDawnDiagonal5(tableGame, 8, 5)
								end
				end
				
	--Для 8 диагонали (начало в (5,1))
	CheckDawnDiagonal5(tableGame, 5, 1) 
	
	--Для 9 диагонали (начало в (9,5))
	CheckDawnDiagonal5(tableGame, 9, 5) 
end

function CheckDawnDiagonal9( tableGame, j, i )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j-1].pole and tableGame[i][j].pole == tableGame[i+2][j-2].pole and tableGame[i][j].pole == tableGame[i+3][j-3].pole and tableGame[i][j].pole == tableGame[i+4][j-4].pole and tableGame[i][j].pole == tableGame[i+5][j-5].pole and tableGame[i][j].pole == tableGame[i+6][j-6].pole and tableGame[i][j].pole == tableGame[i+7][j-7].pole and tableGame[i][j].pole == tableGame[i+8][j-8].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j-1].y = 1
			tableGame[i+2][j-2].y = 1
			tableGame[i+3][j-3].y = 1
			tableGame[i+4][j-4].y = 1
			tableGame[i+5][j-5].y = 1
			tableGame[i+6][j-6].y = 1
			tableGame[i+7][j-7].y = 1
			tableGame[i+8][j-8].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 45
			return true
		end
	end
	return false
end

function CheckDawnDiagonal8( tableGame, j, i )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j-1].pole and tableGame[i][j].pole == tableGame[i+2][j-2].pole and tableGame[i][j].pole == tableGame[i+3][j-3].pole and tableGame[i][j].pole == tableGame[i+4][j-4].pole and tableGame[i][j].pole == tableGame[i+5][j-5].pole and tableGame[i][j].pole == tableGame[i+6][j-6].pole and tableGame[i][j].pole == tableGame[i+7][j-7].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j-1].y = 1
			tableGame[i+2][j-2].y = 1
			tableGame[i+3][j-3].y = 1
			tableGame[i+4][j-4].y = 1
			tableGame[i+5][j-5].y = 1
			tableGame[i+6][j-6].y = 1
			tableGame[i+7][j-7].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 32
			return true
		end
	end
	return false
end

function CheckDawnDiagonal7( tableGame, j, i )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j-1].pole and tableGame[i][j].pole == tableGame[i+2][j-2].pole and tableGame[i][j].pole == tableGame[i+3][j-3].pole and tableGame[i][j].pole == tableGame[i+4][j-4].pole and tableGame[i][j].pole == tableGame[i+5][j-5].pole and tableGame[i][j].pole == tableGame[i+6][j-6].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j-1].y = 1
			tableGame[i+2][j-2].y = 1
			tableGame[i+3][j-3].y = 1
			tableGame[i+4][j-4].y = 1
			tableGame[i+5][j-5].y = 1
			tableGame[i+6][j-6].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 21
			return true
		end
	end
	return false
end

function CheckDawnDiagonal6( tableGame, j, i )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j-1].pole and tableGame[i][j].pole == tableGame[i+2][j-2].pole and tableGame[i][j].pole == tableGame[i+3][j-3].pole and tableGame[i][j].pole == tableGame[i+4][j-4].pole and tableGame[i][j].pole == tableGame[i+5][j-5].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j-1].y = 1
			tableGame[i+2][j-2].y = 1
			tableGame[i+3][j-3].y = 1
			tableGame[i+4][j-4].y = 1
			tableGame[i+5][j-5].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 12
			return true
		end
	end
	return false
end

function CheckDawnDiagonal5( tableGame, j, i )
	if tableGame[i][j].pole > 0 then 
		if tableGame[i][j].pole == tableGame[i+1][j-1].pole and tableGame[i][j].pole == tableGame[i+2][j-2].pole and tableGame[i][j].pole == tableGame[i+3][j-3].pole and tableGame[i][j].pole == tableGame[i+4][j-4].pole then
			tableGame[i][j].y = 1
			tableGame[i+1][j-1].y = 1
			tableGame[i+2][j-2].y = 1
			tableGame[i+3][j-3].y = 1
			tableGame[i+4][j-4].y = 1
			tableGame[1][1].result = tableGame[1][1].result + 5
			return true
		end
	end
	return false
end

function updateAfterCheck( tableGame )
	for i = 1,9 do
		for j = 1,9 do
			if tableGame[i][j].y == 1 then
				tableGame[i][j].pole = 0
				tableGame[i][j].y = 0
			end
		end
	end
end

function HaveLine( tableGame )
	lalala = false
	for i = 1,9 do
		for j = 1,9 do
			if tableGame[i][j].y == 1 then
				lalala = true
			end
		end
	end
	return lalala
end

function FindPath( tableGame, oldX, oldY, newX, newY )
	tablePath = {
		--первый столбец
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        --второй столбец
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        --так далее
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0},
        {0, 0, 0, 0, 0, 0, 0, 0, 0}
    }
    for i = 1,9 do
		for j = 1,9 do
			if tableGame[i][j].pole > 0 then
				tablePath[i][j] = -1
			end
		end
	end
	tablePath[oldX][oldY] = 1
	tablePath[newX][newY] = 2
	while FindPathReserch1(tablePath) do
		for i = 1,9 do
			for j = 1,9 do
				if tablePath[i][j] == 1 then
					if i-1 > 0 then
						if tablePath[i-1][j] == 2 then
							return true
						end
						if tablePath[i-1][j] == 0 then
							tablePath[i-1][j] = 1
						end
					end
					if j-1 > 0 then 
						if tablePath[i][j-1] == 2 then
							return true
						end
						if tablePath[i][j-1] == 0 then
							tablePath[i][j-1] = 1
						end
					end
					if i+1 < 10 then
						if tablePath[i+1][j] == 2 then
							return true
						end
						if tablePath[i+1][j] == 0 then
							tablePath[i+1][j] = 1
						end
					end
					if j+1 < 10 then
						if tablePath[i][j+1] == 2 then
							return true
						end
						if tablePath[i][j+1] == 0 then
							tablePath[i][j+1] = 1
						end
					end
					tablePath[i][j] = -1
				end
			end
		end
	end
	return false
end

function FindPathReserch1( tablePath )
	for i = 1,9 do
		for j = 1,9 do
			if tablePath[i][j] == 1 then
				return true
			end
		end
	end
	return false
end

function StartGameRAndom(tablePath)	
	countN = 0
	while countN < 5 do
		x = math.random(1,9)
		y = math.random(1,9)
		color = math.random(1,7)
		if tableGame[x][y].pole == 0 then
			tableGame[x][y].pole = color
			countN = countN + 1
		end
	end
end