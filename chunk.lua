print("chunk")
chunksize = 8
blocksize = 80
--total chunks
chunkamount = 4
chunkshowlimit = 1
chunk_pos = 0
last_chunk_pos = nil


function generate_chunk(playerposx,playerposy)
    
    if playerposx >= 0 then
      c = (math.floor((playerposx/(blocksize*chunksize)) + 0.5))
    elseif playerposx < 0 then
      c = ((math.floor((playerposx/(blocksize*chunksize)) + 0.5))-1)
    end
    
    for z = (c-chunkshowlimit),(c+chunkshowlimit) do
      if file_exists("worlddata/chunk"..(c+z)) == false then
 
        local chunkposx,chunkposy = (c+z)*(chunksize*blocksize),200
        local file = io.open("worlddata/chunk"..(c+z), "w")
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
    chunk_pos = c
    if chunk_pos ~= last_chunk_pos then
      last_chunk_pos = chunk_pos
      load_level((c-chunkshowlimit),(c+chunkshowlimit))
      chunkmin,chunkmax = (c-chunkshowlimit),(c+chunkshowlimit)
    end
end

--generate_chunk()

