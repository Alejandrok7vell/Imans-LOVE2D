require "scenes/mainPage"
require "scenes/game"
require "scenes/results"

function love.load()
   cScene = 1
   m1Pressed = false
   m2Pressed = false
end

function love.update()
   if cScene == 1 then
      mp.update()
   elseif cScene == 2 then
      scene2.update()
   elseif  cScene == 3 then
      rscene.update()
   end
end

function love.draw()
   if cScene == 1 then
      mp.draw()
   elseif cScene == 2 then
      scene2.draw()
   elseif cScene == 3 then
      rscene.draw()
   end
end