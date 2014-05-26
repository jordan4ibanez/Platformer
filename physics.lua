print("4")

on_ground = false
dead = false

function beginContact(a, b, coll)
  local aposx,aposy = a:getBody():getPosition()
  local bposx,bposy = b:getBody():getPosition()
  
  if a:getUserData() ~= "player" then
    --so a is block
    if aposy-bposy > 0 then
      on_ground = true
    end
  elseif b:getUserData() ~= "player" then
    --so b is block
    if aposy-bposy < 0 then
      on_ground = true
    end
  end
end

function endContact(a, b, coll)
  local aposx,aposy = a:getBody():getPosition()
  local bposx,bposy = b:getBody():getPosition()
  if a:getUserData() ~= "player" then
    --so a is block
    if aposy-bposy > 0 then
      on_ground = false
    end
  elseif b:getUserData() ~= "player" then
    --so b is block
    if aposy-bposy < 0 then
      on_ground = false
    end
  end
end

function move()
  if love.keyboard.isDown("right") then
    --camerax = camerax+10
    player.player.body:applyForce(100, 0)
  elseif love.keyboard.isDown("left") then
    --camerax = camerax-10
    player.player.body:applyForce(-100, 0)
  end
  local x,y = player.player.body:getPosition()
  if y > 800+50 then
    dead = true
  end
end
