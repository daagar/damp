
function daagar.log:debug(msg)
  if daagar.log.enableDebug then
    cecho("\n<dark_slate_grey>[<white>::<dark_orchid>(debug):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
  end
end

function daagar.log:info(msg)
  cecho("\n<dark_slate_grey>[<white>::<light_slate_grey>(info):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
end

function daagar.log:error(msg)
  cecho("\n<dark_slate_grey>[<white>::<firebrick>(error):<light_grey> "..msg.." <white>::<dark_slate_grey>]\n")
end
