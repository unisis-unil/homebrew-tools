class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.4.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.4.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "43015b791baa78a7cdb08292c4741edbce7af3225a8412637ea521bf57617003"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.4.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "8aa93090823fe29c839a9838d493de4d30bc70aad36ad296de667bbfcd32d6cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.4.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "55a0dcf11aedb9d9c65849f18288f6d235b4f7bd9b45bc75cedcdd2373484124"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
