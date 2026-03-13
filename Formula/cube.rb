class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.2/cube-x86_64-apple-darwin.tar.gz"
      sha256 "10290104a647a88da33788b8323f5d0563325eb3e5844123cc11341b05dee084"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.2/cube-aarch64-apple-darwin.tar.gz"
      sha256 "8acf2625b63d5962c3dfcdcde938ce3804994f94aad46225415307aa8e58ecdd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.2/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "78b3352135a5e4ccc202f0a85dda425d53f7522e7868ddac01892479abfa5e73"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
