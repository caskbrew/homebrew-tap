cask "stickspace" do
  version "0.1.0"
  sha256 "80608bf858321f87183bf722b74ec13d914cb7f63774e5a6e3880a70af32ce9a"

  url "https://github.com/caskbrew/StickSpace/releases/download/v#{version}/StickSpace-#{version}.zip"
  name "StickSpace"
  desc "Sticky snippets in the menu bar for texts, links and secrets"
  homepage "https://github.com/caskbrew/StickSpace"

  depends_on macos: :sonoma

  app "StickSpace.app"

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper lets it start.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/StickSpace.app"]
  end

  zap trash: "~/Library/Application Support/Stickspace"
end
