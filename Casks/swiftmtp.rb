cask "swiftmtp" do
  version "1.0.1"
  sha256 "2587ae4e71344c08e41e4728440c0fd11cbdd96b7a59b63f2064149272791d22"

  url "https://github.com/wang93wei/SwiftMTP/releases/download/v#{version}/SwiftMTP_#{version}.dmg",
      verified: "github.com/wang93wei/SwiftMTP/"
  name "SwiftMTP"
  desc "Swift x Android MTP tool"
  homepage "https://github.com/wang93wei/SwiftMTP/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"

  app "SwiftMTP.app"

end
