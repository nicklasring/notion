dopath("app")
dopath("xinerama_switcher")
dopath("move_current")
dopath("mod_notionflux")
dopath("net_client_list")

function toggle_tab_bar(frame)
  local mode = frame:mode()
  if mode == "tiled" then
    frame:set_mode('tiled-alt')
  else
    frame:set_mode('tiled')
  end
end

CTRL="Control+"
META="Mod1+"
META2="Mod4+"

-- Terminal emulator
if os and os.execute("test -x /usr/bin/urxvt") == 0 then
    XTERM="/usr/bin/urxvt"
else
    XTERM="/usr/bin/xterm"
end

ioncore.set {
  dblclick_delay=250,
  kbresize_delay=3600000,
}

defmenu("session", {
  menuentry("Restart", "ioncore.restart()"),
  menuentry("Exit",  "ioncore.shutdown()"),
})

defmenu("system", {
  menuentry("Reboot", "ioncore.exec('xterm -e sudo reboot')"),
  menuentry("Shutdown",  "ioncore.exec('xterm -e sudo shutdown -h now')"),
})

defmenu("ssh", {
  menuentry("nik", "ioncore.exec(ssh('nik'))"),
})

defmenu("custommenu", {
  submenu("Session", "session"),
  submenu("System", "system"),
  submenu("Ssh", "ssh"),
})

-- Defbindings
defbindings("WScreen", {
  kpress("F12", nil),
})

defbindings("WMPlex.toplevel", {
  kpress(META2.."R", "ioncore.exec('rofi -show run')"),
  kpress(META2.."P", "ioncore.exec('rofi -show window')"),
  kpress(META2.."Return", "ioncore.exec_on(_, XTERM)"),
  kpress("F1", "mod_query.query_menu(_, _sub, 'custommenu', 'Shortcut:')"),
  kpress("F2", "ioncore.exec_on(_, XTERM)"),
  kpress("F5", nil),
  kpress("F6", "ioncore.create_ws(_)"),
  submap(CTRL.."K", {
    kpress("R", "ioncore.restart()"),
    kpress("T", "toggle_tab_bar(_)"),
    kpress("plus", "WMPlex.inc_index(_)"),
    kpress("minus", "WMPlex.dec_index(_)"),
  })
})

defbindings("WClientWin", {
  submap(CTRL.."K", {
    kpress("Q", "ioncore.shutdown()"),
    kpress("semicolon", "WClientWin.quote_next(_)"),
  })
})

defbindings("WFrame", {
  submap(CTRL.."K", {
    kpress("K", "ioncore.goto_next(_, 'up')"),
    kpress("L", "xinerama_switcher(_, 'right')"),
    kpress("H", "xinerama_switcher(_, 'left')"),
    kpress("J", "ioncore.goto_next(_, 'down')"),
    kpress("N", "WFrame.switch_prev(_)"),
    kpress("M", "WFrame.switch_next(_)"),
    kpress("U", "WFrame.set_mode(_, 'floating')"),
    kpress("Y", "WFrame.set_mode(_, 'tiled')"),
    kpress("0", "WFrame.begin_kbresize(_)"),
  }),
  mdrag(META2.."Button1", "WFrame.p_tabdrag(_)"),
})

defbindings("WTiling", {
  submap(CTRL.."K", {
    kpress("V", "WTiling.split_at(_, _sub, 'right', true)"),
    kpress("S", "WTiling.split_at(_, _sub, 'bottom', true)"),
    kpress("X", "WTiling.unsplit_at(_, _sub)"),
    kpress("Up", "move_current.move(_, 'up')"),
    kpress("Down", "move_current.move(_, 'down')"),
    kpress("Left", "move_current.move(_, 'left')"),
    kpress("Right", "move_current.move(_, 'right')"),
  })
})