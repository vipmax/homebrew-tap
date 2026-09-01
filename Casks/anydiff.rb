cask "anydiff" do
  version "1.1.0"
  sha256 "51821b2605017b61522a14ffa567afecce065094b06f388b3807572cc27ffdc2"

  url "https://github.com/vipmax/anydiff/releases/download/v#{version}/AnyDiff-macOS.zip"
  name "AnyDiff"
  desc "High-performance native macOS MultiBuffer Diff editor with embedded AI agent"
  homepage "https://github.com/vipmax/anydiff"

  depends_on macos: ">= :ventura"

  app "AnyDiff.app"
  binary "#{appdir}/AnyDiff.app/Contents/MacOS/AnyDiff", target: "anydiff"

  zap trash: [
    "~/Library/Saved Application State/app.anydiff.savedState",
  ]
end
