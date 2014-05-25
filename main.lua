dofile("chunk.lua")
dofile("level_handler.lua")
dofile("player.lua")
dofile("camera.lua")
dofile("physics.lua")



--do this to test world generator
--love.event.quit()


function love.load()
  objects = {}

  love.window.setTitle("Space Game 0.01")
  font = love.graphics.newFont("timeburner_regular.ttf", 20)
  love.graphics.setFont(font)
  love.window.setMode(1280, 800)
  love.graphics.setBackgroundColor(104, 136, 248)
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  
  
  generate_chunk()
  load_level()
  
  load_player()
  world:setCallbacks( beginContact, endContact, preSolve, postSolve )
  
  
end

function love.update(dt)
  world:update(dt)
  
  move()

  
end
function love.draw()
  camera_follow()
  
  for w = 1,chunkamount do
    for i = 1,(chunksize*chunksize) do
      --love.graphics.setColor(chunk["block"..i].color)
      love.graphics.setColor(math.random(255),math.random(255),math.random(255))
      love.graphics.polygon("fill", objects[w]["block"..i].body:getWorldPoints(objects[w]["block"..i].shape:getPoints()))
      
    end
  end
  love.graphics.setColor(0,0,0)
  love.graphics.polygon("fill", objects.player.body:getWorldPoints(objects.player.shape:getPoints()))
  love.graphics.print("FPS: " .. love.timer.getFPS(), 2-camerax, 2-cameray)
  love.graphics.print("Ground: "..tostring(on_ground), 2-camerax, 22-cameray)
  love.graphics.print("Dead: "..tostring(dead), 2-camerax, 42-cameray)
end
  

