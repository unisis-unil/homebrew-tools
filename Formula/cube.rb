class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.6"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.6/cube-x86_64-apple-darwin.tar.gz"
      sha256 "fc71accaa2d596aaf5dd067e3a36c9d0b8c991adef89a4d7119d2a0fe58730d8"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.6/cube-aarch64-apple-darwin.tar.gz"
      sha256 "348cdc96393ecb7dd6daa805280e39b740eafac6363ffd8f0e1bd32756fa6c21"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.6/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1a2d9cae3ef00a48e5f7db7919f57811e9051bb38648dcd591cb945de52b2843"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
