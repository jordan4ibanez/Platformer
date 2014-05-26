dofile("helpers.lua")
dofile("chunk.lua")
dofile("level_handler.lua")
dofile("player.lua")
dofile("camera.lua")
dofile("physics.lua")



--do this to test world generator
--love.event.quit()
winx,winy = 1280,800

function love.load()
  objects = {}

  love.window.setTitle("Space Game 0.01")
  font = love.graphics.newFont("timeburner_regular.ttf", 20)
  love.graphics.setFont(font)
  
  love.window.setMode(winx,winy)
  love.graphics.setBackgroundColor(104, 136, 248)
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  --world = love.physics.newWorld(0, 0, true)
  world:setCallbacks( beginContact, endContact, preSolve, postSolve )
  
  
  dirt = love.graphics.newImage("image/dirt.png")
  
  
  
  
  
  load_player()
  
  generate_chunk(player.player.body:getPosition())
  load_level(chunkshowlimit*-1,chunkshowlimit)
  
  
end

function love.update(dt)
  world:update(dt)
  
  generate_chunk(player.player.body:getPosition())
    
  move()
  
end


function love.draw()
  camera_follow()
  
  for w = 1,3 do
    for i = 1,(chunksize*chunksize) do
      if objects[w] then
        love.graphics.setColor(objects[w]["block"..i].color)
        local quards1,quards2 = objects[w]["block"..i].body:getWorldPoints(objects[w]["block"..i].shape:getPoints())
        love.graphics.draw(dirt, quards1, quards2)

        --debug
        love.graphics.setColor(objects[w]["block"..i].color[2],objects[w]["block"..i].color[3],objects[w]["block"..i].color[1])
        love.graphics.print("CHUNK:", quards1, quards2)
        love.graphics.print(w, quards1, (quards2+19))
        love.graphics.print("BLOCK:", quards1, (quards2+38))
        love.graphics.print(i, quards1, (quards2+56))
        --love.graphics.polygon("fill", objects[w]["block"..i].body:getWorldPoints(objects[w]["block"..i].shape:getPoints()))
      end
      
    end
  end
 
  love.graphics.setColor(0,0,0)
  love.graphics.polygon("fill", player.player.body:getWorldPoints(player.player.shape:getPoints()))
  love.graphics.print("FPS: " .. love.timer.getFPS(), 2-camerax, 2-cameray)
  love.graphics.print("Ground: "..tostring(on_ground), 2-camerax, 22-cameray)
  love.graphics.print("Dead: "..tostring(dead), 2-camerax, 42-cameray)
  local posx,posy = player.player.body:getPosition()
  love.graphics.print("X: "..posx, 2-camerax, 62-cameray)
  love.graphics.print("Y: "..posy, 2-camerax, 82-cameray)
  if chunkmin and chunkmax then
    love.graphics.print("Chunk Min: "..chunkmin, 2-camerax, 102-cameray)
    love.graphics.print("Chunk Max: "..chunkmax, 2-camerax, 122-cameray)
  end
end
  

