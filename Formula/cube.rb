class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.1.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "c8dde4f6d9c454ad5307d44ad8c103284cfffe439e7fb866bd1b2f54d343f17d"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.1.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "e387809fe27401046f2481aa30fc24ec845a51ff1ffd50cecf20db3dffa9adfc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.1.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a9c44d83afc0d44978278e07ca7728aa54bd37d9a7d895d76c9f6d1688ee8a64"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
