local isDebug=arg[#arg] == "-debug"
if isDebug then require("mobdebug").start() end



local is_fullscreen=true
w=nil
h=nil
rnd=love.math.random
draw=love.graphics.draw

local entities={}

stars = {}
stars2 = {}
local max_stars = 100
local stars_r
local stars_g
local stars_b

local stars2_r
local stars2_g
local stars2_b


local stars_refresh=function()
	for i=1, max_stars do
		local x = rnd(w)
    local y = rnd(h)
    stars[i] = {x, y}
		
		x = rnd(w)
    y = rnd(h)
    stars2[i] = {x, y}
	end
	
	stars_r=rnd()
	stars_g=rnd()
	stars_b=rnd()
	
	stars2_r=rnd()
	stars2_g=rnd()
	stars2_b=rnd()
end
	

local stars_demo=function()
	if rnd()<0.02 then
		stars_refresh()
	end
	
	love.graphics.setColor(stars_r,stars_g,stars_b)
	love.graphics.points(stars) 
	
	love.graphics.setColor(stars2_r,stars2_g,stars2_b)
	love.graphics.points(stars2) 
end



local update_size=function()
	w = love.graphics.getWidth()
	h =	love.graphics.getHeight()
end




local lines_demo_1=function()
	local x1=rnd(w)
	local x2=rnd(w)
	
	local y1=rnd(h)
	local y2=rnd(h)
	love.graphics.line(x1,y1,x2,y2)
end


local lines_demo_2=function()
	local x1=rnd(w)
	local x2=rnd(w)
	local x3=rnd(w)
	
	local y1=rnd(h)
	local y2=rnd(h)
	local y3=rnd(h)
	love.graphics.line(x1,y1,x2,y2)
	love.graphics.line(x2,y2,x3,y3)
end

local lines_demo_3=function()
	local x1=rnd(w)
	local x2=rnd(w)
	local y1=rnd(h)
	
	love.graphics.setColor( 1,0, 0, 1 )
	love.graphics.line(x1,y1,x2,y1)
end

local lines_demo_4=function()
	local x1=rnd(w)
	local y2=rnd(w)
	local y1=rnd(h)
	
	love.graphics.setColor( 0,1, 1, 1 )
	love.graphics.line(x1,y1,x1,y2)
end

local lines_demo_5=function()
	local x1=rnd(w)
	local x2=rnd(w)
	local x3=rnd(w)
	local x4=rnd(w)
	
	local y1=rnd(h)
	local y2=rnd(h)
	local y3=rnd(h)
	local y4=rnd(h)
	
	love.graphics.setColor( rnd(),rnd(), rnd(), 1 )
	
	love.graphics.line(x1,y1,x2,y2)
	love.graphics.line(x2,y2,x3,y3)
	love.graphics.line(x3,y3,x4,y4)
end


local lines_demo_6=function()
	local x1=rnd(w)
	local y2=rnd(w)
	local y1=rnd(h)
	
	love.graphics.setColor( 0,1, 1, 1 )
	love.graphics.line(x1,y1,x1,y2)
end


---

rnd2=function()
	return rnd()-0.5
end



local lines7={}


local init_lines_7=function()
	--x1,y1,x2,y2,r,g,b
	local new_line=function()
		return {rnd(w),rnd(h),rnd(w),rnd(h),rnd(),rnd(),rnd()}
	end
	
	lines7[1]=new_line()
	lines7[2]=new_line()
	lines7[3]=new_line()
end


local lines_demo_7=function()
	for k,line in pairs(lines7) do
		line[1]=line[1]+rnd2()
		line[2]=line[2]+rnd2()
		line[3]=line[3]+rnd2()
		line[4]=line[4]+rnd2()
		
		love.graphics.setColor(line[5],line[6],line[7], 1 )
		love.graphics.line(line[1],line[2],line[3],line[4])
	end
	
	
	
end


---
love.keypressed=function(key)
	if key=="escape" then
		is_fullscreen=not is_fullscreen
		love.window.setFullscreen(is_fullscreen, "desktop")
		update_size()
	end
end


love.update=function()
	player.update()
end




local bg
local bg_y=-3000
bg_draw=function()
	bg_y=bg_y+1
	draw(bg,0,bg_y)
end


love.draw=function()
	love.graphics.setColor( 1,1, 1, 1 )
	
	-- out of style
	--bg_draw()
	lines_demo_1()
	lines_demo_2()
	lines_demo_3()
	lines_demo_4()
	lines_demo_5()
	lines_demo_6()
	lines_demo_7()
	stars_demo()
	-- love.graphics.polygon('line', 0, 0, 200, 400, 200, 100, 100,100, 90,70)
	player.draw()
	
end


love.load=function()
	player=require("player")
	
	stars_refresh()
	
	love.window.setFullscreen(is_fullscreen, "desktop")
	
	update_size()
	init_lines_7()
	-- bg=love.graphics.newImage("res/bg1.png")
end
