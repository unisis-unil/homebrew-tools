class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.4"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.4/cube-x86_64-apple-darwin.tar.gz"
      sha256 "587aaaf6a627c57c7ecd9d577ff8679d34338f5910f2c87a58a168d0abde8662"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.4/cube-aarch64-apple-darwin.tar.gz"
      sha256 "9bc39def521ebf4692b90421ca12656598f720f87d6415f1254721056be5a953"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.4/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "00449ff916bd5e856bc2eb3dc16ffbd85f886c2f2d760928bdfd96848885e5bf"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
