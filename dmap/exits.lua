
damp.CARDINAL_EXITS_LONG = {"north", "south", "east", "west", "northeast", "northwest", "southeast", "southwest", "up", "down"}

-- NOTE: Ordering reflects mudlet defaults for converting exits to numeric values
damp.CARDINAL_EXITS_SHORT = {"n", "ne", "nw", "e", "w", "s", "se", "sw", "u", "d"}

damp.CARDINAL_EXITS_SHRINK = {north = "n", south = "s", east = "e", west = "w", northeast = "ne", northwest = "nw", southeast = "se", southwest = "sw", up = "u", down = "d"}

damp.CARDINAL_EXITS_EXPAND = {n = "north", s = "south", e = "east", w = "west", ne = "northeast", nw = "northwest", se = "southeast", sw = "southwest", u = "up", d = "down"}

function damp.map:getExitNum(dir)
  if not damp.map:isCardinalExit(dir) then
    damp.log:error("Can't get an exit number for a non-cardinal direction!")
    return
  end
  local exit = damp.map:getShortExit(dir)
  for k,v in pairs(damp.CARDINAL_EXITS_SHORT) do
    if exit == v then
      return k
    end
  end

  damp.log:error("Unable to find exit number for direction "..exit)
end

function damp.map:isCardinalExit(command)
  local isCardinal = false

  if table.contains(damp.CARDINAL_EXITS_LONG, command) or table.contains(damp.CARDINAL_EXITS_SHORT, command) then
    isCardinal = true
  end

  return isCardinal
end

function damp.map:getShortExit(command)
  if table.contains(damp.CARDINAL_EXITS_SHORT, command) then
    return command
  elseif table.contains(damp.CARDINAL_EXITS_LONG, command) then
    
    return damp.CARDINAL_EXITS_SHRINK[command]
  end
end

function damp.map:connectExits(room_data)
  local exits = room_data.info.exits
  local room_id = room_data.info.num
  
  for direction, room in pairs(exits) do
    local dir_num = damp.map:getExitNum(direction)
    if roomExists(room) then
      damp.log:debug("The room exists, connecting stubs")
      --setExit(room_id, room, direction)
      setExitStub(room_id, dir_num, true)
      connectExitStub(room_id, dir_num)
      local stubs = getExitStubs(room_id)
--      if stubs and table.contains(stubs, dir_num) then
--        damp.log:debug("Removing stub in dir "..dir_num)
--        setExitStub(room_id, dir_num, 0)
--      end
    else
      damp.log:debug("Unexplored exit, creating stub")
      damp.log:debug("Setting stub in direction "..dir_num)
      setExitStub(room_id, dir_num, true) 
    end
  end
  damp.log:debug("Leaving connectExits()") 
end

function damp.map:connectSpecialExits()
  if not damp.map:isCardinalExit(damp.command) 
    and damp.command ~= "l" 
    and damp.command ~= "look" 
    and damp.command ~= "recall" then
    damp.log:debug("Saw special exit command ("..damp.command.."), linking to prior room")

    local special_exits = getSpecialExits(gmcp.room.info.num)
    if not table.contains(special_exits, damp.command) then
      addSpecialExit(damp.map.prior_room, gmcp.room.info.num, damp.command)
    end
  end

end


