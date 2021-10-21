rscene = {}
rscene.isLoaded = true

function rscene.load()
   empate = false
   tFont = love.graphics.newFont("fonts/carloMelow.otf", 50)
   wFont = love.graphics.newFont("fonts/otr.ttf", 100)
   resultTitle = love.graphics.newText(tFont)
   resultWinner = love.graphics.newText(wFont)
   resultTitle:setf("Ganador:", love.graphics.getWidth(), "center")
   if j1.s > j2.s then
      resultWinner:setf(j1.n, love.graphics.getWidth(), "center")
   elseif j2.s > j1.s then
      resultWinner:setf(j2.n, love.graphics.getWidth(), "center")
   elseif j1.s == j2.s then
      empate = true
      resultWinner:setf("Empate", love.graphics.getWidth(), "center")
   end

   resultSound = love.audio.newSource("sounds/final.wav", "static")
   love.audio.play(resultSound)
end

function rscene.update()
   if rscene.isLoaded then
      rscene.load()
      rscene.isLoaded = false
   end
   if love.mouse.isDown(2) then
      cScene = 1
      mp.isLoaded = true
   end
end

function rscene.draw()
   if not rscene.isLoaded then
      love.graphics.setBackgroundColor(0.9, 0.9, 0.9)
      love.graphics.setColor(0, 0, 0)
      if not empate then
         love.graphics.draw(resultTitle, 0, 100)
         love.graphics.draw(resultWinner, 0, 300)
      else
         love.graphics.draw(resultTitle, 0, 500)
      end
      love.graphics.setColor(1, 1, 1)
   end
end