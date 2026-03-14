class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.2.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "a8491e41c869d68f0fda7c6defce362b7f5ae20f822acf3ad62bc05b7b5f89ee"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.2.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "2250744904dda1ec0df7c910542d4eea396cb5ead3fdd8b4e5c8dc420046fe5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.2.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bb207c6a42eb2600d3c3035b6f4146ab9aae8ff8535a6dc2d7074e1855e3ddf5"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
