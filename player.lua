local player={}


local x=100
local y=100

local speed=1


player.draw=function()
	
	local top_x=x
	local top_y=y-20
	
	local left_x=x-10
	local left_y=y+10
	
	local right_x=x+10
	local right_y=y+10
	
	love.graphics.polygon("line",top_x,top_y,left_x,left_y,right_x,right_y)
	
	local shift=100
	love.graphics.polygon("line",top_x+shift,top_y+shift,left_x+shift,left_y+shift,right_x+shift,right_y+shift)
end


player.update=function()
	if love.keyboard.isDown("d") then
		x=x+speed
	end
	if love.keyboard.isDown("a") then
		x=x-speed
	end
	
	if love.keyboard.isDown("w") then
		y=y-speed
	end
	if love.keyboard.isDown("s") then
		y=y+speed
	end
	
end



return player