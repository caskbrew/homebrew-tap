cask "tradestick" do
  version "0.6.0"
  sha256 "9c92d19c59e797c21fe9f73e22536d857962fb52c3781c9d3c7e8f8c91a46770"

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
