function newPlayer(x, y, n)
   local player = {}
   player.x = x
   player.y = y
   player.n = n
   player.s = 0
   player.cs = 0
   player.g = 0
   player.red = 0
   player.t = 0
   player.r = 1
   player.img1 = love.graphics.newImage("imgs/iman1.png")
   player.img2 = love.graphics.newImage("imgs/iman2.png")

   player.UPs = love.audio.newSource("sounds/up.wav", "static")
   player.Downs = love.audio.newSource("sounds/bad.wav", "static")

   function player.update()
      if player.r > 2 then
         player.r = 1
      end
      if player.cs == player.s then
         if not player.UPs:isPlaying() then
            love.audio.pause(player.UPs)
         end
         if not player.Downs:isPlaying() then
            love.audio.pause(player.Downs)
         end
      end
      if player.cs < player.s then
         player.g = 1
         player.red = 0
         player.t = 1
         player.cs = player.s
         love.audio.play(player.UPs)
      elseif player.cs > player.s then
         player.g = 0
         player.red = 1
         player.t = 1
         player.cs = player.s
         love.audio.play(player.Downs)
      end
      if player.t > 0 then
         player.t = player.t - (player.t / 100)
      end
   end

   function player.draw()
      love.graphics.setColor(1, 1, 1)
      if player.r == 1 then
         love.graphics.draw(player.img1, player.x - 19, player.y, 0, 1, 1)
      elseif player.r == 2 then
         love.graphics.draw(player.img2, player.x - 19, player.y, 0, 1, 1)
      end
      love.graphics.setColor(player.r, player.g, 0, player.t)
      love.graphics.rectangle("fill", player.x - 19, player.y, 39, 200)
      love.graphics.setColor(1, 1, 1)
   end

   return player
end