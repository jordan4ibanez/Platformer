print("2")
function load_player()
  objects.player = {}
  objects.player.body = love.physics.newBody(world, 700, 0, "dynamic")
  objects.player.body:setFixedRotation(true)
  objects.player.shape = love.physics.newRectangleShape(0, 0, 50, 100)
  objects.player.fixture = love.physics.newFixture(objects.player.body, objects.player.shape, 0.1)
  objects.player.fixture:setUserData("player")
end
function love.keypressed(key, unicode)
   if key == 'up' then
      if on_ground == true then
        local x,y = objects.player.body:getLinearVelocity()
        objects.player.body:setLinearVelocity( x, -600  )
      end
   end
end
