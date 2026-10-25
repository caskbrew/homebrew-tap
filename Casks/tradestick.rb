cask "tradestick" do
  version "0.5.1"
  sha256 "0b30e75260bda2058644d83b2e46e421c22741eff65c1bf9d308478d5f7e1ebc"

  url "https://github.com/caskbrew/TradeStick/releases/download/v#{version}/TradeStick-#{version}.zip"
  name "TradeStick"
  desc "Floating sticker windows with live PnL for your crypto trades"
  homepage "https://github.com/caskbrew/TradeStick"

  depends_on macos: :sequoia

  app "TradeStick.app"

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper lets it start.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TradeStick.app"]
  end

  zap trash: ["~/Library/Application Support/TradeStick", "~/Library/Application Support/TradeStickies"]
end
