local menubar = require("menubar")

local TopMenu = {}

menubar.utils.terminal = terminal

menubar.cache_entries = true

function TopMenu.show()
    menubar.show()
end

return TopMenu
