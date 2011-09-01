-- Parse gmcp.room data from the mud

function daagar.map:parseGmcpRoom()
--  local room_data = gmcp.room
  local zone_name = gmcp.room.info.zone

  -- Zone Handling
  if daagar.map.current_zone ~= zone_name then
    daagar.log:debug("Entered different zone")
    daagar.map:setZone(zone_name)
  end
 
  -- Continent handling
  if gmcp.room.info.coord.cont == 1 then
    daagar.log:debug("Continent room seen")
    local found_zone, zone_id = daagar.map:isKnownZone(zone_name)
--    setGridMode(zone_id, true)
  end

  -- Room Handling
  daagar.map.seen_room = gmcp.room.info.num
  daagar.map.prior_room = daagar.map.current_room

  if daagar.map.seen_room == -1 then
    -- Eventually needs to work to map "nomap" areas...
    daagar.log:debug("Can't find room based on mud id - none given")
  elseif roomExists(daagar.map.seen_room) then
    if getRoomEnv(daagar.map.seen_room) == 999 then
      daagar.log:debug("Existing room is a temp room - recreating")
      deleteRoom(daagar.map.seen_room)  -- Causes exits to get delinked!
      daagar.map:createRoom()
      daagar.map:connectExits(daagar.map.prior_room_data) -- Relink missing exits
    else
      daagar.log:debug("Found existing room - moving there")
      daagar.map.current_room = daagar.map.seen_room
      centerview(daagar.map.seen_room)
    end
  else
    daagar.log:debug("New room seen - creating...")
    --display(room_data)
    daagar.map:createRoom()
  end
  daagar.map.prior_room_data = table.copy(gmcp.room)
  daagar.map.prior_zone_name = zone_name
end

function table.copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end
