require "libs/buttons"
require "libs/imanes"
mp = {}
mp.isLoaded = true

function mp.load()
   playB = newButton((love.graphics.getWidth() / 2) - 100, (love.graphics.getHeight() / 2) - 100, 200, 200, 1)
   exitB = newButton(love.graphics.getWidth() - 100, 0, 100, 100, 2)
   mainBG = love.graphics.newImage("imgs/mainbg.jpg")
   mainTitle = love.graphics.newImage("imgs/title.png")
   mtr = 0
   mtrot = 0.01
   imans = {}
   for i = 1, 10, 1 do
      table.insert(imans, i, newMainIman(i))
   end
   mBGs = love.audio.newSource("sounds/bg1.wav", "stream")
   love.audio.play(mBGs)
end

function mp.update()
   mx = love.mouse.getX()
   my = love.mouse.getY()
   if mp.isLoaded then
      mp.load()
      mp.isLoaded = false
   end
   if not mBGs:isPlaying() then
      love.audio.play(mBGs)
   end
   playB.update()
   exitB.update()
   for key in pairs(imans) do
      imans[key].update()
   end
   mtr = mtr + mtrot
   if mtr > 0.2 or mtr < -0.2 then
      mtrot = mtrot * -1
   end
end

function mp.draw()
   if not mp.isLoaded then
      love.graphics.draw(mainBG, -150, 0, 0, 0.9, 0.9)
      for key in pairs(imans) do
         imans[key].draw()
      end
      playB.draw()
      exitB.draw()
      love.graphics.translate(love.graphics.getWidth()/2, 160)
      love.graphics.rotate(mtr)
      love.graphics.translate(-love.graphics.getWidth()/2, -160)
      love.graphics.draw(mainTitle, (love.graphics.getWidth() / 2) - 400, 10)
   end
end