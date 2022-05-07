import XMonad
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

main = xmonad . ewmhFullscreen . ewmh . xmobarProp $  myConfig

myConfig =
  let lockScreen = "betterlockscreen -l"
      volUp = "pactl set-sink-volume @DEFAULT_SINK@ +5%"
      volDown = "pactl set-sink-volume @DEFAULT_SINK@ -5%"
      volMute = "pactl set-sink-mute @DEFAULT_SINK@ toggle"
      lightUp = "light -A 5"
      lightDown = "light -U 5"
      terminal = "kitty"
      networkConnect = terminal ++ " --title=nmtui-connect nmtui-connect"
      volumeControl = terminal ++ " pulsemixer"
   in def
        { terminal = terminal,
          normalBorderColor = "#333333",
          focusedBorderColor = "#FFFFFF"
        }
        `additionalKeysP` [ ("M-l", spawn lockScreen),
                            ("<XF86AudioRaiseVolume>", spawn volUp),
                            ("<XF86AudioLowerVolume>", spawn volDown),
                            ("<XF86AudioMute>", spawn volMute),
                            ("<XF86MonBrightnessUp>", spawn lightUp),
                            ("<XF86MonBrightnessDown>", spawn lightDown),
                            ("M-v", spawn volumeControl),
                            ("M-<F8>", spawn networkConnect)
                          ]
