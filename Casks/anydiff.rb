cask "anydiff" do
  version "1.3.0"
  sha256 "0efde7bff1848d37eb81e00886af2bdb67c72fa4564aeb54d5c8ef2597f3dd5e"

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
