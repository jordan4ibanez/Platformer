print("1")



function load_level(low, high)
  objects = {}
  memoryblock = 0
  for w = low,high do
  
    --do this because you can't do block[-1]
    memoryblock = memoryblock + 1

    objects[memoryblock] = {}
    
    for i = 1,(chunksize*chunksize) do
      dofile("worlddata/chunk"..w)
      --print("chunk "..w.." block "..i)
      print(memoryblock)
      objects[memoryblock]["block"..i] = {}
      objects[memoryblock]["block"..i].body = love.physics.newBody(world, chunk["block"..i].position[1], chunk["block"..i].position[2])
      objects[memoryblock]["block"..i].shape = love.physics.newRectangleShape(chunk["block"..i].size[1], chunk["block"..i].size[2])
      objects[memoryblock]["block"..i].fixture = love.physics.newFixture(objects[memoryblock]["block"..i].body, objects[memoryblock]["block"..i].shape)
      objects[memoryblock]["block"..i].fixture:setUserData("block"..i)
      objects[memoryblock]["block"..i].color = chunk["block"..i].color
      if chunk["block"..i].friction ~= nil then
    	  objects[memoryblock]["block"..i].fixture:setFriction(chunk["block"..i].friction[1])
  	  else
	    objects[memoryblock]["block"..i].fixture:setFriction(5)
      end
      --objects.ball.fixture:setRestitution(0.9)
      if chunk["block"..i].restitution ~= nil then
        objects[memoryblock]["block"..i].fixture:setRestitution(chunk["block"..i].restitution[1])
      end
    end
  end
end

  
