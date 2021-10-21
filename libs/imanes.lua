function newIman(l)
	math.randomseed(os.time())
	local iman = {}
	iman.l = l or 1
	iman.y = love.graphics.getHeight() / 2 - 150
	iman.t = math.random(4)
	iman.s = math.random(2)
	iman.a = 1
	iman.bajar = false
	iman.subir = false
	iman.velocity = iVelocity
	iman.img = {
		love.graphics.newImage("imgs/imans/up" .. iman.s .. ".png"),
		love.graphics.newImage("imgs/imans/max" .. iman.s .. ".png"),
		love.graphics.newImage("imgs/imans/down" .. iman.s .. ".png"),
		love.graphics.newImage("imgs/imans/bad" .. iman.s .. ".png")
	}
	iman.isOn = true
	if iman.l == 1 then
		-- Left
		iman.x = -50
		iman.xVel = 1 * iman.velocity

		function iman.update()
			if iman.isOn then
				iman.x = iman.x + iman.xVel
				if iman.a == 1 then
					if iman.x > j1.x - 19 then
						if iman.s == j1.r then
							iman.xVel = 0
							iman.bajar = true
							if iman.t == 1 then j1.s = j1.s + 1
							elseif iman.t == 2 then j1.s = j1.s + 2
							elseif iman.t == 3 then j1.s = j1.s - 1
							elseif iman.t == 4 then j1.s = j1.s - 2 end
						elseif iman.s ~= j1.r then iman.subir = true end
						iman.a = 2
					end
				elseif iman.a == 2 then
					if iman.x > j2.x - 19 then
						if iman.s == j2.r then
							iman.xVel = 0
							iman.bajar = true
                     iman.subir = false
							if iman.t == 1 then j2.s = j2.s + 1
							elseif iman.t == 2 then j2.s = j2.s + 2
							elseif iman.t == 3 then j2.s = j2.s - 1
							elseif iman.t == 4 then j2.s = j2.s - 2 end
						elseif iman.s ~= j2.r then iman.subir = true end
						iman.a = 3
					end
				end
				if iman.subir and iman.y > love.graphics.getHeight() / 2 - 350 and iman.a == 2 then iman.y = iman.y - 10 end
            if iman.subir and iman.y > love.graphics.getHeight() / 2 - 700 and iman.a == 3 then iman.y = iman.y - 10 end

            if iman.bajar and iman.y < j1.y then iman.y = iman.y + 50 end

            if iman.y >= j1.y or iman.y <= -200 then
               iman.isOn = false
            end
			end
		end

		function iman.draw()
         if iman.isOn then
            love.graphics.draw(iman.img[iman.t], iman.x, iman.y)
         end
      end
	elseif iman.l == 2 then
		-- Right
		iman.x = love.graphics.getWidth() + 50
		iman.xVel = -1 * iman.velocity

		function iman.update()
         if iman.isOn then
            iman.x = iman.x + iman.xVel
            if iman.a == 1 then
               if iman.x < j2.x - 19 then
                  if iman.s == j2.r then
                     iman.xVel = 0
                     iman.bajar = true
                     if iman.t == 1 then j2.s = j2.s + 1
                     elseif iman.t == 2 then j2.s = j2.s + 2
                     elseif iman.t == 3 then j2.s = j2.s - 1
                     elseif iman.t == 4 then j2.s = j2.s - 2 end
                  elseif iman.s ~= j2.r then iman.subir = true end
                  iman.a = 2
               end
            elseif iman.a == 2 then
               if iman.x < j1.x - 19 then
                  if iman.s == j1.r then
                     iman.xVel = 0
                     iman.bajar = true
                     iman.subir = false
                     if iman.t == 1 then j1.s = j1.s + 1
                     elseif iman.t == 2 then j1.s = j1.s + 2
                     elseif iman.t == 3 then j1.s = j1.s - 1
                     elseif iman.t == 4 then j1.s = j1.s - 2 end
                  elseif iman.s ~= j1.r then iman.subir = true end
                  iman.a = 3
               end
            end
            if iman.subir and iman.y > love.graphics.getHeight() / 2 - 350 and iman.a == 2 then iman.y = iman.y - 10 end
            if iman.subir and iman.y > love.graphics.getHeight() / 2 - 700 and iman.a == 3 then iman.y = iman.y - 10 end

            if iman.bajar and iman.y < j1.y then iman.y = iman.y + 50 end

            if iman.y >= j1.y or iman.y <= -200 then
               iman.isOn = false
            end
         end
		end

		function iman.draw()
         if iman.isOn then
            love.graphics.draw(iman.img[iman.t], iman.x, iman.y)
         end
      end
	end
	return iman
end

function newMainIman(index)
	math.randomseed(index)
	local imgs = {
		"bad1",
		"bad2",
		"down1",
		"down2",
		"max1",
		"max2",
		"up1",
		"up2",
		"iman1",
		"iman2"
	}
	local iman = {}
	iman.x = math.random(-200, love.graphics.getWidth())
	iman.y = math.random(-200, love.graphics.getHeight())
	iman.r = math.random(-2, 2)
	iman.xVel = math.random(-2, 2)
	iman.yVel = math.random(-2, 2)
	if iman.xVel == 0 then iman.xVel = 1 end
	if iman.yVel == 0 then iman.yVel = 1 end
	iman.rot = 0.01
	if iman.r == 0 then iman.r = 1 end
	iman.img = love.graphics.newImage("imgs/imans/" .. imgs[math.random(10)] .. ".png")
	iman.isLoaded = false

	function iman.load()
		iman.p = math.random(0, 3)
		iman.img = love.graphics.newImage("imgs/imans/" .. imgs[math.random(10)] .. ".png")
		iman.r = math.random(-2, 2)
		iman.rot = 0.01
		if iman.r == 0 then iman.r = 1 end
		if iman.p == 0 then
			-- left
			iman.x = -200
			iman.y = math.random(-200, love.graphics.getHeight())
			iman.xVel = math.random(1, 2)
			iman.yVel = math.random(-2, 2)
			if iman.xVel == 0 then iman.xVel = 1 end
			if iman.yVel == 0 then iman.yVel = 1 end
		elseif iman.p == 1 then
			-- top
			iman.x = math.random(-200, love.graphics.getWidth())
			iman.y = -200
			iman.xVel = math.random(-2, 2)
			iman.yVel = math.random(1, 2)
			if iman.xVel == 0 then iman.xVel = 1 end
			if iman.yVel == 0 then iman.yVel = 1 end
		elseif iman.p == 2 then
			-- right
			iman.x = love.graphics.getWidth() + 200
			iman.y = math.random(-200, love.graphics.getHeight())
			iman.xVel = math.random(-2, -1)
			iman.yVel = math.random(-2, 2)
			if iman.xVel == 0 then iman.xVel = -1 end
			if iman.yVel == 0 then iman.yVel = 1 end
		elseif iman.p == 3 then
			-- bottom
			iman.x = math.random(-200, love.graphics.getWidth())
			iman.y = love.graphics.getHeight() + 200
			iman.xVel = math.random(-2, 2)
			iman.yVel = math.random(-2, -1)
			if iman.xVel == 0 then iman.xVel = 1 end
			if iman.yVel == 0 then iman.yVel = -1 end
		end
		iman.xVel, iman.yVel = iman.xVel * 5, iman.yVel * 5
		iman.isLoaded = false
	end

	function iman.update()
		if iman.isLoaded then iman.load() end
		if iman.x < -300 or iman.x > love.graphics.getWidth() + 300 or iman.y < -300 or iman.y > love.graphics.getHeight() + 300 then iman.isLoaded = true end
		iman.rot = iman.rot + iman.r / 100
		iman.x = iman.x + iman.xVel
		iman.y = iman.y + iman.yVel
	end

	function iman.draw() love.graphics.draw(iman.img, iman.x, iman.y, iman.rot, 1, 1) end

	return iman
end