cask "stickspace" do
  version "1.0.0"
  sha256 "19e148aebbf3d58eefcfe19f23908abc67eeabad9ba9e0c0597ce04f276c4871"

  url "https://github.com/caskbrew/StickSpace/releases/download/v#{version}/Stickspace-#{version}.zip"
  name "Stickspace"
  desc "Sticky snippets in the menu bar for texts, links and secrets"
  homepage "https://github.com/caskbrew/StickSpace"

  depends_on macos: :sonoma

  app "Stickspace.app"

  # The app is ad-hoc signed, not notarized: drop the quarantine flag so Gatekeeper lets it start.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Stickspace.app"]
  end

  zap trash: "~/Library/Application Support/Stickspace"
end
