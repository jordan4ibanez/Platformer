print("1")

objects = {}

function load_level()

  
  --start from 0 and go up
  testhigh = 0
  while true do
    if file_exists("worlddata/chunk"..testhigh) == true then
      testhigh = testhigh + 1
    else
      testhigh = testhigh - 1
      break
    end
    
  end
  --start from -1 and go down
  testlow = 0
  while true do
    if file_exists("worlddata/chunk"..testlow) == true then
      testlow = testlow - 1
    else
      testlow = testlow + 1
      break
    end
  end
  
  
  
  for w = testlow,testhigh do
    objects[w] = {}
    for i = 1,(chunksize*chunksize) do
      dofile("worlddata/chunk"..w)
      --print("chunk "..w.." block "..i)
      
      objects[w]["block"..i] = {}
      objects[w]["block"..i].body = love.physics.newBody(world, chunk["block"..i].position[1], chunk["block"..i].position[2])
      objects[w]["block"..i].shape = love.physics.newRectangleShape(chunk["block"..i].size[1], chunk["block"..i].size[2])
      objects[w]["block"..i].fixture = love.physics.newFixture(objects[w]["block"..i].body, objects[w]["block"..i].shape)
      objects[w]["block"..i].fixture:setUserData("block"..i)
      objects[w]["block"..i].color = chunk["block"..i].color
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

  
