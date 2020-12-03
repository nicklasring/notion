CTRL="Control+"
META="Mod1+"
META2="Mod4+"

--- Terminal emulator
if os and os.execute("test -x /usr/bin/urxvt") == 0 then
    XTERM="/usr/bin/urxvt"
else
    XTERM="/usr/bin/xterm"
end

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

-- WMPlex context bindings
--
-- These bindings work in frames and on screens. The innermost of such
-- contexts/objects always gets to handle the key press. 

defbindings("WMPlex", {
  kpress(META2.."R", "ioncore.exec('rofi -show run')"),
  kpress(CTRL.."Q", "WRegion.rqclose_propagate(_, _sub)"),
  kpress(META2.."P", "ioncore.exec('rofi -show window')"),
  kpress(META.."Tab", "ioncore.exec('rofi -show window')"),
  kpress(META.."Return", "term_with_name(_, _sub, nil, 'XTERM name:', false)"),
  kpress("F1", "mod_query.query_menu(_, _sub, 'custommenu', 'Shortcut:')"),
  kpress("F2", "ioncore.exec_on(_, XTERM)"),
  kpress("F3", "term_with_name(_, _sub, nil, 'TMUX name:', true)"),
  kpress("F9", "mod_query.query_workspace(_)"),
  submap(CTRL.."K", {
    kpress("R", "ioncore.restart()"),
    kpress("T", "toggle_tab_bar(_)"),
    kpress("plus", "WMPlex.inc_index(_)"),
    kpress("minus", "WMPlex.dec_index(_)"),
  })
})

-- WFrame context bindings
--
-- These bindings are common to all types of frames. Some additional
-- frame bindings are found in some modules' configuration files.

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