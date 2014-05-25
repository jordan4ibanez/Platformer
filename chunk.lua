print("chunk")
chunksize = 8
blocksize = 80
--total chunks
chunkamount = 4
 
math.randomseed( os.time() )

function generate_chunk()
  for c = 1,chunkamount do
  
    local chunkposx,chunkposy = c*(chunksize*blocksize),200
    local file = io.open("worlddata/chunk"..c, "w")
    local i = 0
    file:write("chunk = { \n")
    for x = 1,chunksize do
      for y = 1,chunksize do
        i = i + 1
        file:write("  block"..i.." = {\n"..
        "    position = {"..((x-1)*blocksize)+chunkposx..","..((y-1)*blocksize)+chunkposy.."},\n"..
        "    size = {"..blocksize..","..blocksize.."},\n"..
        "    color = {"..math.random(255)..","..math.random(255)..","..math.random(255).."},\n"..
        "    alive = {true},\n"..
        --"    restitution = {"..math.random().."},\n"..
        "  },\n"
        )
      end
    end
    file:write("}")
    file:close()
  end
end

--generate_chunk()

