function doSpeedWalk()

  if #speedWalkPath == 0 then
    daagar.log:error("No speedwalk path found!")
  end

  local exits = daagar.map:getAllExits(daagar.map.current_room)
  local path = {}

  for i, room_id in pairs(speedWalkPath) do
    for j, exit in pairs(exits) do
      if tonumber(room_id) == exit then
        table.insert(path, j)
        break
      end
    end
    exits = daagar.map:getAllExits(room_id)
  end

  while path[1] do 
    local dir_to_send = path[1]
    table.remove(path, 1)
    send(dir_to_send)
  end
end

function daagar.map:getAllExits(room_id)
  local exits = getRoomExits(room_id)
  local sexits = getSpecialExitsSwap(room_id)
  return daagar.map:concatTables(exits, sexits)
end

function daagar.map:concatTables(table1, table2)
  local output = {}
  for i,v in pairs(table1) do
    output[i] = v
  end
  for i,v in pairs(table2) do
    output[i] = v
  end
  return output
end
