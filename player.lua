print("2")
player = {}
function load_player()
  player.player = {}
  player.player.body = love.physics.newBody(world, 0, 0, "dynamic")
  player.player.body:setFixedRotation(true)
  player.player.shape = love.physics.newRectangleShape(0, 0, 50, 100)
  player.player.fixture = love.physics.newFixture(player.player.body, player.player.shape, 0.1)
  player.player.fixture:setUserData("player")
end
function love.keypressed(key, unicode)
   if key == 'up' then
      if on_ground == true then
        local x,y = player.player.body:getLinearVelocity()
        player.player.body:setLinearVelocity( x, -600  )
      end
   end
end
