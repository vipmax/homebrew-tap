cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.7.1"
  sha256 arm:   "3ef3a37443d13005b04ebdf6b673a5646c29a3399ae8c85f30ff6faa134d7a98",
         intel: "1903f4331e346bb29c29b54eb50d10666a4b1c14e419365b1ca95a5934105d35"

  url "https://github.com/vipmax/anydiff/releases/download/v#{version}/AnyDiff-macOS-#{arch}.zip"
  name "AnyDiff"
  desc "High-performance native macOS MultiBuffer Diff editor with embedded AI agent"
  homepage "https://github.com/vipmax/anydiff"

  depends_on macos: :ventura

  app "AnyDiff.app"
  binary "#{appdir}/AnyDiff.app/Contents/MacOS/AnyDiff", target: "anydiff"

  # The app is ad-hoc signed (not notarized), so Gatekeeper would block the
  # quarantine flag Homebrew adds to downloads. Clear it after every install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AnyDiff.app"]
  end

  zap trash: [
    "~/Library/Saved Application State/app.anydiff.savedState",
  ]
end
