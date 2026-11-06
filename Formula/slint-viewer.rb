class SlintViewer < Formula
  desc "Render and preview Slint user interface files"
  homepage "https://slint.dev/"
  url "https://github.com/slint-ui/slint/releases/download/v1.18.1/slint-viewer-universal-apple-darwin.tar.gz"
  sha256 "e6ced86250e052122b65b593c77c2042a54798428a0f9ae5840f8769f1488571"
  license any_of: [
    "GPL-3.0-only",
    "LicenseRef-Slint-Royalty-free-2.0",
    "LicenseRef-Slint-Software-3.0",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  def install
    bin.install "slint-viewer"
  end

  test do
    assert_match "slint-viewer #{version}", shell_output("#{bin}/slint-viewer --version")
  end
end
