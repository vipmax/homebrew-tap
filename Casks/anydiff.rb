cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.5.1"
  sha256 arm:   "c164568dadf4a11963a941d9e0ca31fd2e1778cb95eb5fb1cf2d72ea52ba3792",
         intel: "5bb341e69194734fccb4a2cd5e4b1e6be10a73ad0207d9ec25edba702856ead6"

  url "https://github.com/vipmax/anydiff/releases/download/v#{version}/AnyDiff-macOS-#{arch}.zip"
  name "AnyDiff"
  desc "High-performance native macOS MultiBuffer Diff editor with embedded AI agent"
  homepage "https://github.com/vipmax/anydiff"

  depends_on macos: :ventura

  app "AnyDiff.app"
  binary "#{appdir}/AnyDiff.app/Contents/MacOS/AnyDiff", target: "anydiff"

  zap trash: [
    "~/Library/Saved Application State/app.anydiff.savedState",
  ]
end
