cask "mot" do
  version "1.0.43"
  sha256 "4ac412666db592bd8d79ad7cf69ca28b2de0304af340ff87f1f20e12bb5d8cb7"

  url "https://getmot.app/mot-#{version}.dmg"
  name "mOT"
  desc "Opinionated terminal emulator"
  homepage "https://getmot.app/"

  # mOT ships its own Sparkle updater; brew just tracks the appcast for `brew
  # outdated` / `brew upgrade`.
  livecheck do
    url "https://getmot.app/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "mot.app"

  zap trash: [
    "~/.mot.yaml",
    "~/Library/Preferences/com.mot.terminal.plist",
    "~/Library/Caches/com.mot.terminal",
    "~/Library/Saved Application State/com.mot.terminal.savedState",
  ]
end
