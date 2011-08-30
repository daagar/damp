
daagar.CARDINAL_EXITS_LONG = {"north", "south", "east", "west", "northeast", "northwest", "southeast", "southwest", "up", "down"}

daagar.CARDINAL_EXITS_SHORT = {"n", "s", "e", "w", "ne", "nw", "se", "sw", "u", "d"}

daagar.CARDINAL_EXITS_SHRINK = {north = "n", south = "s", east = "e", west = "w", northeast = "ne", northwest = "nw", southeast = "se", southwest = "sw", up = "u", down = "d"}

function daagar.map:isCardinalExit(command)
  local isCardinal = false

  if table.contains(daagar.CARDINAL_EXITS_LONG, command) or table.contains(daagar.CARDINAL_EXITS_SHORT, command) then
    isCardinal = true
  end

  return isCardinal
end

function daagar.map:getShortExit(command)
  if table.contains(daagar.CARDINAL_EXITS_SHORT, command) then
    return command
  elseif table.contains(daagar.CARDINAL_EXITS_LONG, command) then
    return daagar.CARDNAL_EXITS_SHRINK[command]
  end
end

function daagar.map:connectExits(room_data)
--  display(room_data)

  local exits = room_data.info.exits
  local room_id = room_data.info.num
  
  for direction, room in pairs(exits) do
    if roomExists(room) then
      setExit(room_id, room, direction)
    else
      --local fake_room_id = daagar.map:createFakeRoom()
      local zone_id = getRoomArea(room_id)
      daagar.map:createTempRoom(room, direction)
      setExit(room_id, room, direction)
    end
  end
  
end


