cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.9.0"
  sha256 arm:   "fb822dcce5b9634957cf5962fda3990da3681484686d7fe77c008ceb6cabfce9",
         intel: "76e6b9754ae800b8a6d976e2570ebdf066cb865b1459259e0b7c591146e75c50"

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
