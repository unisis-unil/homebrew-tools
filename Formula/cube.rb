class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.5.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.5.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "89eed9d2c40463825fb5515a0b228da5b13ec02a230652173b502525d422e568"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.5.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "ae8b6352d8fa623e7431536e9c2a87fb494caf6e27b6a60857342ceec494dd2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.5.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b69fa16633c12a1874543cb6ec3bda2b82f10220920cb01f0232086f25824751"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
