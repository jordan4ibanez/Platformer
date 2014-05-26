print("3")
camerax,cameray = 0,0
function camera_follow()
  playerx,playery = player.player.body:getPosition()
  playervelx,playervely = player.player.body:getLinearVelocity()
  --print("playery: "..playery.." vs cameray: "..cameray)
  if playery < 800/2 then
    camerax,cameray = ((1280/2)-playerx),((800/2)-playery)
  else
    camerax,cameray = ((1280/2)-playerx),0
  end
  
  love.graphics.translate(camerax,cameray)
  
  
end
