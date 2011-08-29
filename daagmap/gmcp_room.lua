-- Parse gmcp.room data from the mud

function daagar.map:parseGmcpRoom()
  local room_data = gmcp.room
  local zone_name = gmcp.room.info.zone

  -- Zone Handling
  if daagar.map.current_zone ~= zone_name then
    daagar.log:debug("Entered different zone")
    daagar.map:setZone(zone_name)
  end
 
  -- Room Handling
  daagar.map.seen_room = gmcp.room.info.num
  daagar.map.prior_room = daagar.map.current_room

  if daagar.map.seen_room == -1 then
    daagar.log:debug("Can't find room based on mud id - none given")
  elseif roomExists(daagar.map.seen_room) then
    if getRoomEnv(daagar.map.seen_room) == 999 then
      daagar.log:debug("Existing room is a temp room - recreating")
      deleteRoom(daagar.map.seen_room)  -- Causes exits to get delinked!
      daagar.map:createRoom(room_data)
    else
      daagar.log:debug("Found existing room - moving there")
      daagar.map:connectExits(room_data)
      daagar.map.current_room = daagar.map.seen_room
      centerview(daagar.map.seen_room)
    end
  else
    daagar.log:debug("New room seen - creating...")
    daagar.map:createRoom(room_data)
  end
end
