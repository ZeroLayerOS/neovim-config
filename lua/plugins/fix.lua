-- ~/.config/nvim/lua/plugins/fix.lua
-- This file previously held a blink.cmp override that disabled the
-- completion menu's auto-show (menu.auto_show = false / trigger.show_on_keyword
-- = false), which is what was causing the completion popup to require
-- manually pressing <C-space> every time. That block has been removed
-- and merged into lua/plugins/blink.lua, which is now the single place
-- blink.cmp gets configured -- keeping the same plugin's opts in two
-- files is what caused this bug in the first place (whichever loaded
-- last silently won).
return {}
