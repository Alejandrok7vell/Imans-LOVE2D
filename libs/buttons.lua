function newButton(x, y, w, h, t)
   local b = {}
   b.x = x or love.graphics.getWidth() / 2
   b.y = y or love.graphics.getHeight() / 2
   b.w = w or 100
   b.h = h or 100
   b.s = 1

   if t == 1 then
      -- PLay button
      b.img = love.graphics.newImage("imgs/play.png")
      function b.update()
         if mx > b.x and mx < b.x + b.w and my > b.y and my < b.y + b.h then
            b.s = 1.1
            if love.mouse.isDown(1) then
               cScene = 2
               scene2.isLoaded = true
               love.audio.stop(mBGs)
            end
         else
            b.s = 1
         end
      end
      function b.draw()
         love.graphics.draw(b.img, b.x, b.y, 0, b.s, b.s)
      end
   elseif t == 2 then
      -- Exit button
      b.img = love.graphics.newImage("imgs/exit.png")
      function b.update()
         if mx > b.x and mx < b.x + b.w and my > b.y and my < b.y + b.h then
            b.s = 0.55
            if love.mouse.isDown(1) then
               love.event.quit()
            end
         else
            b.s = 0.5
         end
      end
      function b.draw()
         love.graphics.draw(b.img, b.x, b.y, 0, b.s, b.s)
      end
   end
   return b
end