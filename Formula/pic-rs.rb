class PicRs < Formula
  desc "Minimal image hosting upload tool (GitHub, S3, RustFS, MinIO)"
  homepage "https://github.com/akioruri/pic-rs"
  url "https://github.com/akioruri/pic-rs/archive/refs/tags/v0.2.2.tar.gz"
  version "0.2.2"
  sha256 "89c80048c5211f4e305c13d740ca7a18f4887d1a5e13155ff400b1518d82041f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  # pic-rs only ships a prebuilt Apple Silicon binary.
  resource "binary-aarch64-macos" do
    on_arm do
      url "https://github.com/akioruri/pic-rs/releases/download/v0.2.2/pic-rs-aarch64-apple-darwin.tar.gz"
      sha256 "30c754caa3c54f8dd4a34b2ee11a2255bb5dbd42f2b08ed08231e50bcc0305dd"
    end
  end

  def install
    odie "pic-rs only supports Apple Silicon (arm64) macOS." unless Hardware::CPU.arm?

    resource("binary-aarch64-macos").stage do
      bin.install "pic-rs"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pic-rs --version")
  end
end
