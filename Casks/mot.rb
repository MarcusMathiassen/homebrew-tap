cask "mot" do
  version "1.0.18"
  sha256 "db0ab49a48f6742c45b194613497c98702504f527d70c91a358f377570a611c2"

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
