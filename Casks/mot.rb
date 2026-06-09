cask "mot" do
  version "1.0.32"
  sha256 "311c14ee7702a62f1cfc270be7fae8893cb77099af80e589334ea524e221d8fe"

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
