cask "anydiff" do
  arch arm: "arm64", intel: "x86_64"

  version "1.8.0"
  sha256 arm:   "8fbda90b803b772bc2cbb12867238b897b4f260cb1860320487e989998262763",
         intel: "3ad3985df799b4bb6a2abea9b537a03465b1505200c1900f6144482eabdd2a15"

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
