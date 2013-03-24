
daagar.CARDINAL_EXITS_LONG = {"north", "south", "east", "west", "northeast", "northwest", "southeast", "southwest", "up", "down"}

-- NOTE: Ordering reflects mudlet defaults for converting exits to numeric values
daagar.CARDINAL_EXITS_SHORT = {"n", "ne", "nw", "e", "w", "s", "se", "sw", "u", "d"}

daagar.CARDINAL_EXITS_SHRINK = {north = "n", south = "s", east = "e", west = "w", northeast = "ne", northwest = "nw", southeast = "se", southwest = "sw", up = "u", down = "d"}

function daagar.map:getExitNum(dir)
  if not daagar.map:isCardinalExit(dir) then
    daagar.log:error("Can't get an exit number for a non-cardinal direction!")
    return
  end
  local exit = daagar.map:getShortExit(dir)
  for k,v in pairs(daagar.CARDINAL_EXITS_SHORT) do
    if exit == v then
      return k
    end
  end

  daagar.log:error("Unable to find exit number for direction "..exit)
end

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
  local exits = room_data.info.exits
  local room_id = room_data.info.num
  
  for direction, room in pairs(exits) do
    local dir_num = daagar.map:getExitNum(direction)
    if roomExists(room) then
      daagar.log:debug("The room exists, connecting stubs")
      --setExit(room_id, room, direction)
      setExitStub(room_id, dir_num, true)
      connectExitStub(room_id, dir_num)
      local stubs = getExitStubs(room_id)
--      if stubs and table.contains(stubs, dir_num) then
--        daagar.log:debug("Removing stub in dir "..dir_num)
--        setExitStub(room_id, dir_num, 0)
--      end
    else
      daagar.log:debug("Unexplored exit, creating stub")
      daagar.log:debug("Setting stub in direction "..dir_num)
      setExitStub(room_id, dir_num, true) 
    end
  end
  daagar.log:debug("Leaving connectExits()") 
end

function daagar.map:connectSpecialExits()
  if not daagar.map:isCardinalExit(daagar.command) 
    and daagar.command ~= "l" 
    and daagar.command ~= "look" 
    and daagar.command ~= "recall" then
    daagar.log:debug("Saw special exit command, linking to prior room")

    local special_exits = getSpecialExits(gmcp.room.info.num)
    if not table.contains(special_exits, daagar.command) then
      addSpecialExit(daagar.map.prior_room, gmcp.room.info.num, daagar.command)
    end
  end

end


