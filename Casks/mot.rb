cask "mot" do
  version "1.0.29"
  sha256 "db498fb1f4efc0541f4d9dfa777fa23b67ff4aadcfa116a10c22fe076a99250c"

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
