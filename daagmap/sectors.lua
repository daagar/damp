function daagar.map:setCustomColors()

  daagar.log:debug("Setting color environment")

  -- Must remap mud-specified IDs to be in non-ANSI ranges (0-15),
  -- otherwise colors won't function correctly
  for k,v in pairs(gmcp.room.sectors.sectors) do
    daagar.map.terrain[v.name] = v.id+16
  end

  --display(daagar.map.terrain)

  -- Roads --
  setCustomEnvColor(daagar.map.terrain["road_eastwest"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["road"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["bridge"], unpack(color_table.SaddleBrown))
  setCustomEnvColor(daagar.map.terrain["road_crossroads"], unpack(color_table.peru))
  setCustomEnvColor(daagar.map.terrain["crossroad_nw"], unpack(color_table.peru))
  setCustomEnvColor(daagar.map.terrain["crossroad_se"], unpack(color_table.peru))
  setCustomEnvColor(daagar.map.terrain["crossroad_ews"], unpack(color_table.peru))
  setCustomEnvColor(daagar.map.terrain["smallroad"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["smallroad_ew"], unpack(color_table.DarkGoldenrod))
  setCustomEnvColor(daagar.map.terrain["trail_ew"], unpack(color_table.tan))

  -- Misc --
  setCustomEnvColor(daagar.map.terrain["inside"], unpack(color_table.light_gray))
  setCustomEnvColor(daagar.map.terrain["city"], unpack(color_table.LightCoral))
  setCustomEnvColor(daagar.map.terrain["unused"], unpack(color_table.slate_grey))
  setCustomEnvColor(daagar.map.terrain["Mudschool"], unpack(color_table.maroon))
  setCustomEnvColor(daagar.map.terrain["areaexit"], unpack(color_table.dim_gray))
  setCustomEnvColor(daagar.map.terrain["castle"], unpack(color_table.plum))
  setCustomEnvColor(daagar.map.terrain["pillar"], unpack(color_table.light_pink))
  setCustomEnvColor(daagar.map.terrain["temple"], unpack(color_table.medium_purple))
  setCustomEnvColor(daagar.map.terrain["shop"], unpack(color_table.orange))
  setCustomEnvColor(daagar.map.terrain["clanexit"], unpack(color_table.red))
  setCustomEnvColor(daagar.map.terrain["chessblack"], unpack(color_table.dim_gray))
  setCustomEnvColor(daagar.map.terrain["chesswhite"], unpack(color_table.white))
  setCustomEnvColor(daagar.map.terrain["lottery"], unpack(color_table.yellow_green))
  setCustomEnvColor(daagar.map.terrain["alley"], unpack(color_table.yellow))
  setCustomEnvColor(daagar.map.terrain["office"], unpack(color_table.linen))
  setCustomEnvColor(daagar.map.terrain["electric"], unpack(color_table.DodgerBlue))
  setCustomEnvColor(daagar.map.terrain["well"], unpack(color_table.DarkSlateBlue))
  setCustomEnvColor(daagar.map.terrain["bloodyhall"], unpack(color_table.maroon))
  setCustomEnvColor(daagar.map.terrain["bloodyroom"], unpack(color_table.firebrick))
  setCustomEnvColor(daagar.map.terrain["palace_room"], unpack(color_table.MediumOrchid))
  setCustomEnvColor(daagar.map.terrain["ship"], unpack(color_table.SaddleBrown))
  setCustomEnvColor(daagar.map.terrain["hut"], unpack(color_table.LightGoldenrod))
  setCustomEnvColor(daagar.map.terrain["redcarpet"], unpack(color_table.red))
  setCustomEnvColor(daagar.map.terrain["city_underground"], unpack(color_table.DarkSlateGray))
  setCustomEnvColor(daagar.map.terrain["cabin"], unpack(color_table.LightGoldenrod))
  setCustomEnvColor(daagar.map.terrain["hallway"], unpack(color_table.slate_grey))
  setCustomEnvColor(daagar.map.terrain["stairs"], unpack(color_table.dim_gray))
  setCustomEnvColor(daagar.map.terrain["aylorcity"], unpack(color_table.magenta))
  setCustomEnvColor(daagar.map.terrain["ruins"], unpack(color_table.aquamarine))

  setCustomEnvColor(daagar.map.terrain["graveyard"], unpack(color_table.LightGrey))
  setCustomEnvColor(daagar.map.terrain["crypt"], unpack(color_table.LightSlateGrey))

  -- Weather/Environment --
  setCustomEnvColor(daagar.map.terrain["mist"], unpack(color_table.alice_blue))
  setCustomEnvColor(daagar.map.terrain["snow"], unpack(color_table.snow))
  setCustomEnvColor(daagar.map.terrain["dark"], unpack(color_table.dark_slate_grey))
  setCustomEnvColor(daagar.map.terrain["air"], unpack(color_table.mint_cream))
  setCustomEnvColor(daagar.map.terrain["moon"], unpack(color_table.slate_grey))
  setCustomEnvColor(daagar.map.terrain["tornado"], unpack(color_table.light_grey))
  setCustomEnvColor(daagar.map.terrain["dustdevil"], unpack(color_table.DarkKhaki))
  setCustomEnvColor(daagar.map.terrain["wind1"], unpack(color_table.white_smoke))
  setCustomEnvColor(daagar.map.terrain["wind2"], unpack(color_table.alice_blue))
  setCustomEnvColor(daagar.map.terrain["lightning"], unpack(color_table.steel_blue))
  setCustomEnvColor(daagar.map.terrain["rain"], unpack(color_table.cyan))
  setCustomEnvColor(daagar.map.terrain["sun"], unpack(color_table.gold))
  setCustomEnvColor(daagar.map.terrain["cloud1"], unpack(color_table.snow))
  setCustomEnvColor(daagar.map.terrain["cloud2"], unpack(color_table.light_grey))
  setCustomEnvColor(daagar.map.terrain["cloud3"], unpack(color_table.gray))
  setCustomEnvColor(daagar.map.terrain["rainbow"], unpack(color_table.DeepPink))

  -- Outdoors --

  setCustomEnvColor(daagar.map.terrain["plain"], unpack(color_table.papaya_whip))
  setCustomEnvColor(daagar.map.terrain["field"], unpack(color_table.green_yellow))
  setCustomEnvColor(daagar.map.terrain["field2"], unpack(color_table.LawnGreen))
  setCustomEnvColor(daagar.map.terrain["field3"], unpack(color_table.yellow_green))
  setCustomEnvColor(daagar.map.terrain["field4"], unpack(color_table.green))
  setCustomEnvColor(daagar.map.terrain["dead_field"], unpack(color_table.dark_sea_green))
  setCustomEnvColor(daagar.map.terrain["ashen_field"], unpack(color_table.bisque))
  setCustomEnvColor(daagar.map.terrain["forest"], unpack(color_table.ForestGreen))
  setCustomEnvColor(daagar.map.terrain["dead_forest"], unpack(color_table.OliveDrab))
  setCustomEnvColor(daagar.map.terrain["hills"], unpack(color_table.MediumSpringGreen))
  setCustomEnvColor(daagar.map.terrain["mountain"], unpack(color_table.RosyBrown))
  setCustomEnvColor(daagar.map.terrain["mountain_cyan"], unpack(color_table.thistle))
  setCustomEnvColor(daagar.map.terrain["desert"], unpack(color_table.moccasin))
  setCustomEnvColor(daagar.map.terrain["quicksand"], unpack(color_table.sandy_brown))
  setCustomEnvColor(daagar.map.terrain["underground"], unpack(color_table.DarkSlateGray))
  setCustomEnvColor(daagar.map.terrain["volcano"], unpack(color_table.firebrick))
  setCustomEnvColor(daagar.map.terrain["cave"], unpack(color_table.dark_orange))
  setCustomEnvColor(daagar.map.terrain["fiery_cave"], unpack(color_table.maroon))
  setCustomEnvColor(daagar.map.terrain["dungeon"], unpack(color_table.purple))
  setCustomEnvColor(daagar.map.terrain["beach"], unpack(color_table.LightGoldenrod ))
  setCustomEnvColor(daagar.map.terrain["shore"], unpack(color_table.pale_goldenrod))
  setCustomEnvColor(daagar.map.terrain["jungle"], unpack(color_table.green))
  setCustomEnvColor(daagar.map.terrain["dead_jungle"], unpack(color_table.OliveDrab))
  setCustomEnvColor(daagar.map.terrain["swamp"], unpack(color_table.OliveDrab))
  setCustomEnvColor(daagar.map.terrain["rocks"], unpack(color_table.light_grey))

  setCustomEnvColor(daagar.map.terrain["ice"], unpack(color_table.LightCyan))
  setCustomEnvColor(daagar.map.terrain["insideice"], unpack(color_table.light_blue))
  setCustomEnvColor(daagar.map.terrain["icemount"], unpack(color_table.turquoise))
  setCustomEnvColor(daagar.map.terrain["icehills"], unpack(color_table.pale_turquoise))

  setCustomEnvColor(daagar.map.terrain["flowers1"], unpack(color_table.DarkOrchid))
  setCustomEnvColor(daagar.map.terrain["flowers2"], unpack(color_table.MediumPurple))

  -- Water --
  setCustomEnvColor(daagar.map.terrain["waterswim"], unpack(color_table.cornflower_blue))
  setCustomEnvColor(daagar.map.terrain["waternoswim"], unpack(color_table.medium_slate_blue))
  setCustomEnvColor(daagar.map.terrain["ocean"], unpack(color_table.deep_sky_blue))
  setCustomEnvColor(daagar.map.terrain["ocean2"], unpack(color_table.dodger_blue ))
  setCustomEnvColor(daagar.map.terrain["ocean3"], unpack(color_table.medium_blue))
  setCustomEnvColor(daagar.map.terrain["ocean4"], unpack(color_table.midnight_blue))
  setCustomEnvColor(daagar.map.terrain["underwater"], unpack(color_table.NavyBlue))
  setCustomEnvColor(daagar.map.terrain["river"], unpack(color_table.medium_aquamarine))
  setCustomEnvColor(daagar.map.terrain["afountain"], unpack(color_table.cornflower_blue))
  setCustomEnvColor(daagar.map.terrain["fountain"], unpack(color_table.cornflower_blue))
  setCustomEnvColor(daagar.map.terrain["chaos_sea"], unpack(color_table.purple))

  -- Library --
  setCustomEnvColor(daagar.map.terrain["archive"], unpack(color_table.OldLace))
  setCustomEnvColor(daagar.map.terrain["bookshelves"], unpack(color_table.DarkKhaki))
  setCustomEnvColor(daagar.map.terrain["bookshelves_ns"], unpack(color_table.DarkKhaki))

  -- Hell --
  setCustomEnvColor(daagar.map.terrain["hellinside"], unpack(color_table.maroon))
  setCustomEnvColor(daagar.map.terrain["hellhall"], unpack(color_table.violet_red))
  setCustomEnvColor(daagar.map.terrain["hellfountain"], unpack(color_table.firebrick))
  setCustomEnvColor(daagar.map.terrain["hell1"], unpack(color_table.red))
  setCustomEnvColor(daagar.map.terrain["hell2"], unpack(color_table.tomato))
  setCustomEnvColor(daagar.map.terrain["hell3"], unpack(color_table.OrangeRed))
  setCustomEnvColor(daagar.map.terrain["hell4"], unpack(color_table.coral))
 
  -- Space --
  setCustomEnvColor(daagar.map.terrain["space1"], unpack(color_table.light_grey))
  setCustomEnvColor(daagar.map.terrain["space2"], unpack(color_table.gray))
  setCustomEnvColor(daagar.map.terrain["space3"], unpack(color_table.dim_gray))
  setCustomEnvColor(daagar.map.terrain["space4"], unpack(color_table.dark_slate_grey))

end
