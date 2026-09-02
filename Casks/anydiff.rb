cask "anydiff" do
  version "1.1.1"
  sha256 "48da6f924b2df0d076d930993a3647c73927bfc6623fc9a015b7ddc08c491393"

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
