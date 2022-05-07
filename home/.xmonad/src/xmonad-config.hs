import qualified Data.Monoid
import XMonad
import XMonad.Actions.CycleWS (Direction1D (..), WSType (..), moveTo, nextScreen, prevScreen, shiftTo)
-- Layouts modifiers

import XMonad.Actions.MouseResize (mouseResize)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks (ToggleStruts (ToggleStruts), avoidStruts, docks, docksEventHook, manageDocks)
import XMonad.Hooks.ManageHelpers (doFullFloat, isFullscreen)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (decreaseLimit, increaseLimit, limitWindows)
import XMonad.Layout.Magnifier
import XMonad.Layout.MultiToggle (EOT (EOT), mkToggle, single, (??))
import qualified XMonad.Layout.MultiToggle as MT (Toggle (..))
import XMonad.Layout.MultiToggle.Instances (StdTransformers (MIRROR, NBFULL, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile (ResizableTall (ResizableTall))
import XMonad.Layout.ShowWName
import XMonad.Layout.SimpleFloat (shrinkText)
import XMonad.Layout.Simplest
import XMonad.Layout.SimplestFloat (simplestFloat)
import XMonad.Layout.Spacing
import XMonad.Layout.SubLayouts
import XMonad.Layout.Tabbed (addTabs)
import qualified XMonad.Layout.ToggleLayouts as T (ToggleLayout (Toggle), toggleLayouts)
import XMonad.Layout.WindowArranger (WindowArrangerMsg (..), windowArrange)
import XMonad.Layout.WindowNavigation
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.Ungrab

main = xmonad . ewmhFullscreen . ewmh . withEasySB (statusBarProp "xmobar" (pure xmobarPP)) defToggleStrutsKey $ myConfig

myTerminal = "kitty"

myConfig =
  def
    { terminal = myTerminal,
      normalBorderColor = "#333333",
      focusedBorderColor = "#FFFFFF",
      startupHook = myStartupHook,
      manageHook = myManageHook <+> manageDocks,
      workspaces = myWorkspaces,
      layoutHook = myLayoutHook
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
      className =? "Thunderbird" --> doShift (myWorkspaces !! 8),
      isFullscreen --> doFullFloat
    ]

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xsetroot -cursor_name left_ptr"
  spawnOnce "feh --randomize --bg-fill ~/.config/wallpapers/*"

--
-- The layout hook
myLayoutHook =
  avoidStruts $
    mouseResize $
      windowArrange $
        T.toggleLayouts floats $
          mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
  where
    myDefaultLayout =
      tall
        ||| myMagnify
        ||| noBorders monocle
        ||| floats

tall =
  renamed [Replace "tall"] $
    smartBorders $
      windowNavigation $
        addTabs shrinkText def $
          subLayout [] (smartBorders Simplest) $
            limitWindows 12 $
              ResizableTall 1 (3 / 100) (1 / 2) []

myMagnify =
  renamed [Replace "magnify"] $
    smartBorders $
      windowNavigation $
        addTabs shrinkText def $
          subLayout [] (smartBorders Simplest) $
            magnifier $
              limitWindows 12 $
                ResizableTall 1 (3 / 100) (1 / 2) []

monocle =
  renamed [Replace "monocle"] $
    smartBorders $
      windowNavigation $
        addTabs shrinkText def $
          subLayout [] (smartBorders Simplest) $
            limitWindows 20 Full

floats =
  renamed [Replace "floats"] $
    smartBorders $
      limitWindows 20 simplestFloat

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
        ("M-=", unGrab *> spawn "scrot"),
        -- Toggles noborder/full
        ("M-f", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)
      ]
