cask "kicad" do
  version "10.0.1"
  sha256 "75e7140ba789be16f060c68138fef9d0aa9d9dd9bc6988af5bd61b618fe243e6"

  url "https://github.com/KiCad/kicad-source-mirror/releases/download/#{version}/kicad-unified-universal-#{version}.dmg",
      verified: "github.com/KiCad/kicad-source-mirror/"
  name "KiCad"
  desc "Electronics design automation suite"
  homepage "https://kicad.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "KiCad/KiCad.app"

  zap delete: "/Library/Application Support/kicad",
      trash:  [
        "~/Library/Application Support/kicad",
        "~/Library/Preferences/kicad",
        "~/Library/Preferences/org.kicad-pcb.*",
        "~/Library/Saved Application State/org.kicad-pcb.*",
      ]
end
