class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.5/cube-x86_64-apple-darwin.tar.gz"
      sha256 "f7ba8161a1904cd3dc11c3bff30228d607c9af3e433eb373ba4e900185cbc8d0"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.5/cube-aarch64-apple-darwin.tar.gz"
      sha256 "28d75bbaabdb894890347e1c04a96b45638384c57af6f1d8767b11938b04e2df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.5/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5530b29ad96a005d89effe137b6f2e1a532198268093d60ab166022e7871ef7e"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
