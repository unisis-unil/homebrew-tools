class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "1fa225d38c076e600f280d194e04e2f14f9673cb6123b44ebc40827d21746386"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "13e289d54eec19c58fb33aea22c19a5f8e8bd2f365229d97158952dd532fbf53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "15933a50f358afd77d9b7ef5cd6fd077f83ecc1f0bfbeb2b5c09cce9e75ae58e"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
