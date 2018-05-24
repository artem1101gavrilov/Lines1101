function love.load()
	math.randomseed( os.time() )
	love.window.setMode(450, 450)
	background = love.graphics.newImage("background.png")
	backgroundGameOver = love.graphics.newImage("gameover.png")
	require "drawcircle"
	-- Таблица для хранения информации где находятся какие шары
	-- 0 - пусто
	-- 1 - красный
	-- 2 - оранжевый 
	-- 3 - желтый
	-- 4 - зеленый
	-- 5 - голубой
	-- 6 - синий 
	-- 7 - фиолетовый
	tableGame = {
		--первый столбец
        {{pole = 0; y = 0; result = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        --второй столбец
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        --так далее
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}},
        {{pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}, {pole = 0; y = 0;}}
    }
	StartGameRAndom(tableGame)
    --если больше нет возможности добавить шары, значит надо заканчивать игру
    gaming = true
    colorformouse = 0
	
	timeotriovka = 0
	otrisovka = true
end
 
function love.update(dt)
	timeotriovka = timeotriovka + dt
	if timeotriovka > 0.4 then
		timeotriovka = 0
		if otrisovka == false then
			otrisovka = true
		else
			otrisovka = false
		end
	end
end
 
function love.keypressed(key, unicode)
	if key == "1" then
		--gaming = canadd3circle(tableGame)
	end
	if key == "2" then
		--updateAfterCheck(tableGame)
	end
	if key == "3" then

	end
	if key == "r" or key == "space" then
		love.load()
	end
end

function love.keyreleased(key, unicode)
end 

function love.mousepressed(x, y, button, istouch)
   if button == 1 then
   		--if y <= 449.99 then 
		if x > 0 and x < 450 and y > 0 and y < 450 then
   	  		imgx = x -- переместить изображение туда, где мышь нажата
      		imgy = y
      
	      chooseX = math.ceil(imgx/50)
	      chooseY = math.ceil(imgy/50)
	      if tableGame[chooseX][chooseY].pole > 0 then
	      	leftbutton = true
	      	colorformouse = tableGame[chooseX][chooseY].pole
	      	tableGame[chooseX][chooseY].pole = 0
	      end
	    end
      --end
   end
end

function love.mousereleased(x, y, button, istouch)
   if button == 1 then
   		--if y <= 449.99 then 
		if leftbutton == true then
			if x > 0 and x < 450 and y > 0 and y < 450 then
		   	  RELimgx = x 
		      RELimgy = y
		      RELchooseX = math.ceil(RELimgx/50)
		      RELchooseY = math.ceil(RELimgy/50)
		      
		      if tableGame[RELchooseX][RELchooseY].pole == 0 and FindPath(tableGame, chooseX, chooseY, RELchooseX, RELchooseY) then
		      	tableGame[chooseX][chooseY].pole = 0
		      	tableGame[RELchooseX][RELchooseY].pole = colorformouse
		      	allCheckLines(tableGame)
		      	lalala = HaveLine(tableGame)
		      	if lalala == true then
		      		updateAfterCheck(tableGame)
		      	else
		      		gaming = canadd3circle(tableGame)
		      		allCheckLines(tableGame)
		      		updateAfterCheck(tableGame)
		      	end
		  	  else
		  	  	tableGame[chooseX][chooseY].pole = colorformouse
		      end
		      colorformouse = 0;
		      leftbutton = false
		  end
		end
   end
end

function love.draw()
	if gaming == true then
		love.graphics.setColor(250, 250, 250)
		love.graphics.draw(background, 0, 0)
		drawcircle(tableGame)
		if leftbutton == true then
			--love.graphics.print("Meow" .. chooseX .. " " .. chooseY, imgx, imgy)
			if colorformouse == 1 then
				love.graphics.setColor(250, 0, 0)
			elseif colorformouse == 2 then
				love.graphics.setColor(250, 130, 0)
			elseif colorformouse == 3 then	
				love.graphics.setColor(250, 250, 0)
			elseif colorformouse == 4 then	
				love.graphics.setColor(0, 250, 0)
			elseif colorformouse == 5 then	
				love.graphics.setColor(0, 150, 250)	
			elseif colorformouse == 6 then	
				love.graphics.setColor(0, 0, 250)
			elseif colorformouse == 7 then	
				love.graphics.setColor(250, 0, 250)
			end
			if otrisovka == true then
				love.graphics.circle("fill", 50*(chooseX-1)+25, 50*(chooseY-1)+25, 20, 20)
			else
				love.graphics.circle("line", 50*(chooseX-1)+25, 50*(chooseY-1)+25, 20, 20)
			end
   		end
	else
		love.graphics.setColor(250, 250, 250)
		love.graphics.draw(backgroundGameOver, 0, 0)
		love.graphics.setColor(10, 10, 10)
		love.graphics.print("Result: " .. tableGame[1][1].result, 100, 400)
	end
end

