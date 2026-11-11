cask "tradestick" do
  version "0.7.0"
  sha256 "73290c6c9d7bf5aab23fd676287bc20a8d9a794aeef4c866b7245384e735e62a"

  url "https://github.com/caskbrew/TradeStick/releases/download/v#{version}/TradeStick-#{version}.zip"
  name "TradeStick"
  desc "Floating sticker windows with live PnL for your crypto trades"
  homepage "https://github.com/caskbrew/TradeStick"

  depends_on macos: :sequoia

  app "TradeStick.app"

  # Quit the running app first, so an upgrade does not replace it under a live process that shares its database.
  uninstall quit: ["io.github.caskbrew.TradeStick", "com.caskbrew.TradeStick"]

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper lets it start.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TradeStick.app"]
  end

  zap trash: [
    "~/Library/Application Support/TradeStick",
    "~/Library/Application Support/TradeStickies",
    "~/Library/Logs/TradeStick",
    "~/Library/Preferences/io.github.caskbrew.TradeStick.plist",
    "~/Library/Preferences/com.caskbrew.TradeStick.plist",
  ]
end
