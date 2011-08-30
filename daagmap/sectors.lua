
function daagar.map:setCustomColors()

  daagar.log:debug("Setting color environment")

  for k,v in pairs(gmcp.room.sectors.sectors) do
    daagar.map.terrain[v.name] = v.id
  end
display(daagar.map.terrain)
  -- Roads --
  setCustomEnvColor(daagar.map.terrain["road_eastwest"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["road"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["bridge"], unpack(color_table.SaddleBrown))

end
