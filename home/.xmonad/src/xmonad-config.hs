import qualified Data.Monoid
import XMonad
import XMonad.Actions.CycleWS (Direction1D(..), nextScreen, prevScreen, shiftTo, WSType(..), moveTo)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (manageDocks)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Ungrab
import qualified XMonad.StackSet as W

main = xmonad . ewmhFullscreen . ewmh . xmobarProp $ myConfig

myTerminal = "kitty"

myConfig =
  def
    { terminal = myTerminal,
      normalBorderColor = "#333333",
      focusedBorderColor = "#FFFFFF",
      startupHook = myStartupHook,
      manageHook = myManageHook <+> manageDocks,
      workspaces = myWorkspaces
    }
    `additionalKeysP` myKeys

-- myWorkspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
myWorkspaces =
  [ " 1:ff ",
    " 2:chr ",
    " 3:dev ",
    " 4:expl ",
    " 5:doc ",
    " 6:vbox ",
    " 7:mus ",
    " 8:vid ",
    " 9:chat "
  ]

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook =
  composeAll
    [ title =? "firefox" --> doShift (myWorkspaces !! 0),
      className =? "Google-chrome" --> doShift (myWorkspaces !! 1),
      title =? "Discord" --> doShift (myWorkspaces !! 8),
      className =? "Thunderbird" --> doShift (myWorkspaces !! 8)
    ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "feh --randomize --bg-fill ~/.config/wallpapers/*"

myKeys :: [(String, X ())]
myKeys =
  let lockScreen = "betterlockscreen -l"
      volUp = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
      volDown = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
      volMute = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
      lightUp = "light -A 5"
      lightDown = "light -U 5"
      networkConnect = myTerminal ++ " --title=nmtui-connect nmtui-connect"
      volumeControl = myTerminal ++ " pulsemixer"
      nonNSP = WSIs (return (\ws -> W.tag ws /= "NSP"))
   in [ ("M-l", spawn lockScreen),
        ("<XF86AudioRaiseVolume>", spawn volUp),
        ("<XF86AudioLowerVolume>", spawn volDown),
        ("<XF86AudioMute>", spawn volMute),
        ("<XF86MonBrightnessUp>", spawn lightUp),
        ("<XF86MonBrightnessDown>", spawn lightDown),
        ("M-v", spawn volumeControl),
        ("M-<F8>", spawn networkConnect),
        ("M-.", nextScreen),
        ("M-,", prevScreen),
        -- Shifts focused window to next ws
        ("M-S-<Right>", shiftTo Next nonNSP >> moveTo Next nonNSP),
        -- Shifts focused window to prev ws
        ("M-S-<Left>", shiftTo Prev nonNSP >> moveTo Prev nonNSP),
        ("M-S-=", unGrab *> spawn "scrot -s"),
        ("M-=", unGrab *> spawn "scrot")
      ]
