cask "tradestick" do
  version "0.5.0"
  sha256 "d910de1b577e8ce40098b4b014204d3ddcf655ba1e2b4b299dae6486a32e2a15"

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
