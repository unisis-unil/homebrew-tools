class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.3"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.3/cube-x86_64-apple-darwin.tar.gz"
      sha256 "5745ad907800da9a9fcf59ad04549f0e4d892220b099440b599149ec91b6d320"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.3/cube-aarch64-apple-darwin.tar.gz"
      sha256 "00999bb6ccb15a6906f1782c73c5752546705cb2d2fd98c4ac848a9f4d09f560"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.3/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0776b05f098f3ccdc03dd62f4a1bdca66ec2f191f1ff6106c44900660aeddc20"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
