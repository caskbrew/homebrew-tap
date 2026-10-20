# caskbrew/tap

Homebrew tap for caskbrew apps.

| Cask | App |
|---|---|
| `tradestick` | [TradeStick](https://github.com/caskbrew/TradeStick): floating sticker windows with live PnL for crypto trades |
| `stickspace` | [Stickspace](https://github.com/caskbrew/StickSpace): sticky snippets for the menu bar, floating glass windows for texts, links and secrets |

## Install

```
brew tap caskbrew/tap                      # optional: add the tap once, then use short names
brew install --cask caskbrew/tap/tradestick
brew install --cask caskbrew/tap/stickspace
```

Recent Homebrew only loads casks from non-official taps you have trusted. If it refuses with a "trust" message:

```
brew trust --tap caskbrew/tap              # trust the whole tap
brew trust --cask caskbrew/tap/tradestick  # or trust just one cask
brew trust --cask caskbrew/tap/stickspace
```

## Update

```
brew update                                # refresh the tap
brew outdated --cask                       # what has a newer version
brew upgrade --cask tradestick             # one app
brew upgrade --cask                        # all casks
```

## Check

```
brew info --cask caskbrew/tap/tradestick   # version, source, caveats
brew list --cask | grep -E 'tradestick|stickspace'
```

## Reinstall and remove

```
brew reinstall --cask tradestick           # app only, your data stays
brew uninstall --cask tradestick           # app only, your data stays
brew uninstall --zap --cask tradestick     # app AND its data (trades, settings): cannot be undone
```

## Renamed: tradestickies → tradestick

TradeStickies is now TradeStick (cask `tradestick`). If an old `tradestickies` is still installed, remove it
(`brew uninstall --cask tradestickies`, never with `--zap`) and install `tradestick`. On first start the new app
moves your data and API keys over by itself.
