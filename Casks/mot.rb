cask "mot" do
  version "1.0.36"
  sha256 "f20a7d1cd2c9d9ec22abce97cba675f225ba2766ae4545f9fb51114f16674c2d"

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
