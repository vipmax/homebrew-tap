cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.9.0"
  sha256 arm:   "586884a8e6eb745583ab6d3d80876037b95e9771fb10b211bce6300b636cce68",
         intel: "b4a1c200bee238d9340393de8248ccbe2cff1927bf5cb300d77a5a43f1607291"

  url "https://github.com/vipmax/anydiff/releases/download/v#{version}/AnyDiff-macOS-#{arch}.zip"
  name "AnyDiff"
  desc "High-performance native macOS MultiBuffer Diff editor with embedded AI agent"
  homepage "https://github.com/vipmax/anydiff"

  depends_on macos: :ventura

  app "AnyDiff.app"
  binary "#{appdir}/AnyDiff.app/Contents/MacOS/AnyDiff", target: "anydiff"

  # The app is ad-hoc signed (not notarized), so Gatekeeper would block the
  # quarantine flag Homebrew adds to downloads. Clear it after every install.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AnyDiff.app"]
  end

  zap trash: [
    "~/Library/Saved Application State/app.anydiff.savedState",
  ]
end
