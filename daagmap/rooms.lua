
function daagar.map:createTempRoom(room_id, direction)
  local found_zone, zone_id = daagar.map:isKnownZone("fake_zone")
  addRoom(room_id)
  setRoomName(room_id, "Unexplored Room")
  setRoomArea(room_id, zone_id)
  local x, y, z = daagar.map:getNewCoords(direction)
  setRoomCoordinates(room_id, x, y, z)
  setRoomEnv(room_id, 999)
end

function daagar.map:createRoom(room_data)
  
  local room_id = room_data.info.num
  local isCreated = false
  local found_zone, zone_id = daagar.map:isKnownZone(room_data.info.zone)
  
  if not found_zone then
    daagar.log:error("Unknown zone! Can't create room in an unknown zone")
    return
  end

  daagar.log:debug("Attempting to create room for "..room_id)
  if room_id == -1 then
    daagar.log:error("Unable to create room - no room id given by mud")
    return
  end

  isCreated = addRoom(room_id)
  setRoomName(room_id, room_data.info.name)
  setRoomArea(room_id, zone_id)

  -- If there is no prior room, then this is the first room of the map
  if not daagar.map.prior_room then
    setRoomCoordinates(room_id, 0, 0, 0)
    daagar.map.prior_room = room_id
    daagar.log:debug("Created first map room at 0,0,0 for id "..room_id)
  else
    daagar.map.prior_room = daagar.map.current_room
    daagar.log:debug("Attempting to find coords for new room")
    local x,y,z = daagar.map:getNewCoords(daagar.command)

    local rooms_at_location = getRoomsByPosition(zone_id, x, y, z)
    display(rooms_at_location)
    if table.size(rooms_at_location) > 0 then 
      daagar.log:debug("Found colliding rooms... moving")
      daagar.map:moveCollidingRooms(zone_id, x, y, z) 
    end

    daagar.log:debug("New coords set to:"..x.." "..y.." "..z)
    setRoomCoordinates(room_id, x, y, z)
  end

  daagar.map.current_room = room_id
  daagar.map:connectExits(room_data)
  centerview(room_id)
  daagar.log:debug("Created new room")
 
  if not isCreated then
    daagar.log:error("Failed to create new room!")
  end
end

function daagar.map:getNewCoords(command)

  if not command then
    daagar.log:error("No direction has been sent - can't find new coords")
    return
  end

  if daagar.map:isCardinalExit(command) then
    local direction_traveled = daagar.map:getShortExit(command)
    daagar.log:debug("Last command was a cardinal exit")
    local prior_room_x, prior_room_y, prior_room_z = getRoomCoordinates(daagar.map.prior_room)
    if direction_traveled == "n" then
      return prior_room_x, prior_room_y+2, prior_room_z
    elseif direction_traveled == "s" then
      return prior_room_x, prior_room_y-2, prior_room_z
    elseif direction_traveled == "e" then
      return prior_room_x+2, prior_room_y, prior_room_z
    elseif direction_traveled == "w" then
      return prior_room_x-2, prior_room_y, prior_room_z
    elseif direction_traveled == "ne" then
      return prior_room_x+2, prior_room_y+2, prior_room_z
    elseif direction_traveled == "nw" then
      return prior_room_x-2, prior_room_y+2, prior_room_z
    elseif direction_traveled == "se" then
      return prior_room_x+2, prior_room_y-2, prior_room_z
    elseif direction_traveled == "sw" then
      return prior_room_x-2, prior_room_y-2, prior_room_z
    elseif direction_traveled == "u" then
      return prior_room_x, prior_room_y, prior_room_z+2
    elseif direction_traveled == "d" then
      return prior_room_x, prior_room_y, prior_room_z-2
    else
      return prior_room_x, prior_room_y, prior_room_z
    end
  end
end

function daagar.map:moveCollidingRooms(zone_id, cur_x, cur_y, cur_z)
  local x_axis_pos = {"e"}
  local x_axis_neg = {"w"}
  local y_axis_pos = {"n","nw","ne"}
  local y_axis_neg = {"s","sw","se"}
  local z_axis_pos = {"u"}
  local z_axis_neg = {"d"}

  local rooms = getAreaRooms(zone_id)
  local dir = daagar.map:getShortExit(daagar.command)

  if table.contains(y_axis_pos, dir) then
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if y >= cur_y then
        setRoomCoordinates(id, x, y+2, z)
      end
    end
  elseif table.contains(y_axis_neg, dir) then
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if y <= cur_y then
        setRoomCoordinates(id, x, y-2, z)
      end
    end
  elseif table.contains(x_axis_pos, dir) then
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if x >= cur_x then
        setRoomCoordinates(id, x+2, y, z)
      end
    end
  elseif table.contains(x_axis_neg, dir) then
    daagar.log:debug("Shifting rooms lower in x")
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if x <= cur_x then
        setRoomCoordinates(id, x-2, y, z)
      end
    end
  elseif table.contains(z_axis_pos, dir) then
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if z >= cur_z then
        setRoomCoordinates(id, x, y, z+2)
      end
    end
  elseif table.contains(z_axis_neg, dir) then
    for name, id in pairs(rooms) do
      local x,y,z = getRoomCoordinates(id)
      if z <= cur_z then
        setRoomCoordinates(id, x, y, z-2)
      end
    end
  end
end

