--
-- Notion main configuration file
--
-- This file only includes some settings that are rather frequently altered.
-- The rest of the settings are in cfg_notioncore.lua and individual modules'
-- configuration files (cfg_modulename.lua). 

META="Mod1+"
META2="Mod4+"
ALTMETA="Mod4+"
CTRL="Control+"

-- Terminal emulator
if os and os.execute("test -x /usr/bin/urxvt") == 0 then
    XTERM="/usr/bin/urxvt -sk -sr -si -sl 5000 -scrollstyle plain -urgentOnBell"
else
    XTERM="/usr/bin/xterm"
end

-- Program launcher
if os and os.execute("test -x /usr/bin/gmrun") == 0 then
    LAUNCHER="ioncore.exec_on(_, '/usr/bin/gmrun')"
else
    LAUNCHER="mod_query.query_exec(_)"
end

dopath("cfg_defaults")
