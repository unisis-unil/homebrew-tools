class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v#{version}/cube-x86_64-apple-darwin.tar.gz"
      sha256 "90260c937bd8bae289adde43768845b5c6a254388a317b573c7da83bfdeea2a4"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v#{version}/cube-aarch64-apple-darwin.tar.gz"
      sha256 "41591f0fc5fb7abfe5185da6349224293f496eb22d64777527fb30605b7a7ec7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v#{version}/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2280d13f021bfa7219e55b9507cb50c46c68bbadd6e7103ea3c173835375a8fd"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
