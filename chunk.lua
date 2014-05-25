print("chunk")
chunksize = 8
blocksize = 80
--total chunks
chunkamount = 4
 


function generate_chunk(playerposx,playerposy)

    local c = (math.floor((playerposx/(blocksize*chunksize)) + 0.5))
    
    if file_exists("worlddata/chunk"..c) == false then
      print(c)
    
    
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
      load_level()
    end
end

--generate_chunk()

