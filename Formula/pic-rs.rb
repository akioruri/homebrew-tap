class PicRs < Formula
  desc "Minimal image hosting upload tool (GitHub, S3, RustFS, MinIO)"
  homepage "https://github.com/akioruri/pic-rs"
  url "https://github.com/akioruri/pic-rs/archive/refs/tags/v0.2.3.tar.gz"
  version "0.2.3"
  sha256 "d65add14c4c269fb3bcb407471b1e27e042e9e4eb80b964eee29f3ed59b8d49f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on :macos

  # pic-rs only ships a prebuilt Apple Silicon binary.
  resource "binary-aarch64-macos" do
    on_arm do
      url "https://github.com/akioruri/pic-rs/releases/download/v0.2.3/pic-rs-aarch64-apple-darwin.tar.gz"
      sha256 "f4782f40c9270d075e0095da967ec28f0b794ceb587fc03db67072390940061f"
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
