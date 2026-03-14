class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.8"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.8/cube-x86_64-apple-darwin.tar.gz"
      sha256 "7e2c6b1d05989e50cb071f7f586b7644ee0e54fa0bc770d403af6bf8aa4d0d5d"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.8/cube-aarch64-apple-darwin.tar.gz"
      sha256 "4ef236fdc53155ded53a204568682000d13596f4b7c99c9dadf07dec4700ffab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.8/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0f1bd75c131280857749cea3197aa645721f481346cad8c7414d24c54a44570a"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
