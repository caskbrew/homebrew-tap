cask "stickspace" do
  version "0.2.0"
  sha256 "5ff81784195fb51ef0906b6045477c0d1f437af3a520b5f12e3a605d965f7907"

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
