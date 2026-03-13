class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.1/cube-x86_64-apple-darwin.tar.gz"
      sha256 "a2fb537f2ff44478e5a4d1a7ca2f63e12f7ea815a72eba560de052edfdb06e00"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.1/cube-aarch64-apple-darwin.tar.gz"
      sha256 "77e2171cc5ff596b575f95bff77311978ae5e1142304c882dfe6a1509df951e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.1/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ee3a8938fa2cc4a41fee2e866894b9c81ab96f7f9dd603a2b3d1fec18c7451ec"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
