print("1")

 objects = {}
 
function load_level()
 
  for w = 1,chunkamount do
    dofile("worlddata/chunk"..w..".lua")
    
    
    chunk_blocks = 0
    for _,v in pairs(chunk) do
      if v then
        chunk_blocks = chunk_blocks + 1
      end
    end
    
    objects[w] = {}
    
    for i = 1,chunkamount do
      objects[w]["block"..i] = {}
      objects[w]["block"..i].body = love.physics.newBody(world, chunk["block"..i].position[1], chunk["block"..i].position[2])
      objects[w]["block"..i].shape = love.physics.newRectangleShape(chunk["block"..i].size[1], chunk["block"..i].size[2])
      objects[w]["block"..i].fixture = love.physics.newFixture(objects[w]["block"..i].body, objects[w]["block"..i].shape)
      objects[w]["block"..i].fixture:setUserData("block"..i)
      if chunk["block"..i].friction ~= nil then
  	    objects[w]["block"..i].fixture:setFriction(chunk["block"..i].friction[1])
	  else
	    objects[w]["block"..i].fixture:setFriction(5)
	  end
	  --objects.ball.fixture:setRestitution(0.9)
      if chunk["block"..i].restitution ~= nil then
	    objects[w]["block"..i].fixture:setRestitution(chunk["block"..i].restitution[1])
	  end
    end
  end
end

  
