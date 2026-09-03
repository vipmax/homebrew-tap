cask "anydiff" do
  version "1.3.0"
  sha256 "1e6baca4f766b72aa65f4e72d2a475dcfbc5f3b36ff425ba9cd567b606192385"

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
