cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.6.0"
  sha256 arm:   "ccf71df05a56cd068e8754f6841201a9761707dafaeb019190cee561327e4091",
         intel: "4e01aca7ccad5a33b8e5e0ca48a9b04e2b6b1f655b97ceee6fd59cef61ae8d6a"

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
