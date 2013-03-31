-- Parse gmcp.room data from the mud

function damp.map:parseGmcpRoom()
--  local room_data = gmcp.room
  local zone_name = gmcp.room.info.zone

  -- Zone Handling
  if damp.map.current_zone ~= zone_name then
    damp.log:debug("Entered different zone")
    damp.map:setZone(zone_name)
  end
 
  -- Continent handling
  if gmcp.room.info.coord.cont == 1 then
    damp.log:debug("Continent room seen")
    local found_zone, zone_id = damp.map:isKnownZone(zone_name)
--    setGridMode(zone_id, true)
  end

  -- Room Handling
  damp.map.seen_room = gmcp.room.info.num
  damp.map.prior_room = damp.map.current_room

  if damp.map.seen_room == -1 then
    -- Eventually needs to work to map "nomap" areas...
    damp.log:debug("Can't find room based on mud id - none given")
  elseif roomExists(damp.map.seen_room) then
    if getRoomEnv(damp.map.seen_room) == 999 then
--      damp.log:debug("Existing room is a temp room - recreating")
--      deleteRoom(damp.map.seen_room)  -- Causes exits to get delinked!
--      damp.map:createRoom()
--      damp.map:connectExits(damp.map.prior_room_data) -- Relink missing exits
    else
      damp.log:debug("Found existing room - moving there")
      damp.map.current_room = damp.map.seen_room
      damp.map:connectSpecialExits()
      centerview(damp.map.seen_room)
    end
  else
    damp.log:debug("New room seen - creating...")
    --display(room_data)
    damp.map:createRoom()
  end
  damp.map.prior_room_data = table.copy(gmcp.room)
  damp.map.prior_zone_name = zone_name
end

function table.copy(t)
  local t2 = {}
  for k,v in pairs(t) do
    t2[k] = v
  end
  return t2
end
