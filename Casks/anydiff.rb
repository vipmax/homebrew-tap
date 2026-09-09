cask "anydiff" do
  version "1.5.0"
  sha256 "953510e07fee95018138f9231416551629babcd574dfd2ada3ba5c865c68b1a7"

  url "https://github.com/vipmax/anydiff/releases/download/v#{version}/AnyDiff-macOS.zip"
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
