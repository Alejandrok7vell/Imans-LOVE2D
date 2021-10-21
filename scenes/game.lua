require "libs/players"
require "libs/imanes"
scene2 = {}
scene2.isLoaded = true



function scene2.load()
   j1 = newPlayer(love.graphics.getWidth()/4, (love.graphics.getHeight()/2) + 100, "JUGADOR1")
   j2 = newPlayer((love.graphics.getWidth()/4) * 3, (love.graphics.getHeight()/2) + 100, "JUGADOR2")
   m1Pressed = false
   m2Pressed = false
   gImans = {}
   gSide = 2
   iTimerL = love.timer.getTime()
   iTimerU = 0

   tiempoI = love.timer.getTime()
   tiempoF = 0
   tiempoR = 60

   velocity = 2 -- 1-6 2-3
   iVelocity = 3

   gBG = love.graphics.newImage("imgs/gbg.png")
   gBGl = love.graphics.newImage("imgs/gbgl.png")
   gBGlx = 200

   gfont = love.graphics.newFont("fonts/f1.ttf", 50)
   gfontC = love.graphics.newFont("fonts/clock.ttf", 70)

   table.insert(gImans, 1, newIman(1))

   gBGs = love.audio.newSource("sounds/game.wav", "stream")
   love.audio.play(gBGs)
end

function scene2.update()
   if scene2.isLoaded then
      scene2.load()
      scene2.isLoaded = false
   end

   iTimerU = love.timer.getTime() - iTimerL
   tiempoF = love.timer.getTime() - tiempoI
   tiempoR = 60 - math.floor(tiempoF)

   if tiempoR < 30 then
      velocity = 1
      iVelocity = 6
   end

   j1.update()
   j2.update()

   for index in ipairs(gImans) do
      gImans[index].update()
   end

   if iTimerU > velocity then
      table.insert(gImans, newIman(gSide))
      gSide = gSide + 1
      if gSide == 3 then
         gSide = 1
      end
      iTimerU = 0
      iTimerL = love.timer.getTime()
   end

   if love.mouse.isDown(1) and not m1Pressed then
      j1.r = j1.r + 1
      m1Pressed = true
   elseif not love.mouse.isDown(1) then
      m1Pressed = false
   end

   if love.mouse.isDown(2) and not m2Pressed then
      j2.r = j2.r + 1
      m2Pressed = true
   elseif not love.mouse.isDown(2) then
      m2Pressed = false
   end

   if gBGlx < love.graphics.getWidth()/2 then
      gBGlx = gBGlx + 10
   end

   if tiempoR <= 0 then
      cScene = 3
      rscene.isLoaded = true
   end

end

function scene2.draw()
   if not scene2.isLoaded then
      love.graphics.setFont(gfont)
      love.graphics.draw(gBG, -150, 0, 0, 0.9, 0.9)
      love.graphics.draw(gBGl, gBGlx, 0)
      j1.draw()
      j2.draw()
      for index in ipairs(gImans) do
         gImans[index].draw()
      end
      love.graphics.setColor(0, 0, 0)
      love.graphics.print(j1.s, j1.x - 100, j1.y + 60)
      love.graphics.print(j2.s, j2.x + 150, j1.y + 60)
      love.graphics.setFont(gfontC)
      love.graphics.print(tiempoR, love.graphics.getWidth() - 100, 30)
      love.graphics.setColor(1, 1, 1)
   end
end