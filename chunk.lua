print("chunk")
local chunksize = 8
local blocksize = 80


--total chunks
chunkamount = 4
 
 
for c = 1,chunkamount do
  math.randomseed( os.time() )
  local chunkposx,chunkposy = c*(chunksize*blocksize),500-(c*10)
  local file = io.open("worlddata/chunk"..c..".lua", "w")
  local i = 0
  file:write("chunk = { \n")
  for x = 1,chunksize do
    for y = 1,chunksize do
      i = i + 1
      file:write("  block"..i.." = {\n"..
      "    position = {"..((x-1)*blocksize)+chunkposx..","..((y-1)*blocksize)+chunkposy.."},\n"..
      "    size = {"..blocksize..","..blocksize.."},\n"..
      "    color = {"..math.random(255)..","..math.random(255)..","..math.random(255).."},\n"..
      "  },\n"
      )
    end
  end
  file:write("}")
  file:close()
end
