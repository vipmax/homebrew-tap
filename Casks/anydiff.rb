cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.7.0"
  sha256 arm:   "3bbdfbcf383fd0c4ce20d863c44cc514e8b516bf3d86476c32afbb8699350ffa",
         intel: "015b433c7729a97acc6786a36b9fa3dc5aabed10e009876fdfb052cce665708a"

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
