class PicRs < Formula
  desc "Upload images to GitHub or S3-compatible object storage"
  homepage "https://github.com/akioruri/pic-rs"
  url "https://github.com/akioruri/pic-rs/releases/download/v0.1.0/pic-rs-macos-arm64.tar.gz"
  sha256 "599990dbec60a0884bb1d86dbe13cc85377b41a3c7800b65d8e81823878fdf96"
  license "MIT"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos
  depends_on arch: :arm64

  def install
    bin.install "pic-rs"
  end

  test do
    assert_match "pic-rs #{version}", shell_output("#{bin}/pic-rs --version")
  end
end
