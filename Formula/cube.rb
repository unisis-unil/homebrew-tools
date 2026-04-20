class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.6.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.6.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "03a756bc477ab2b086be3c460334b319abf20ee0cabe3e73b90a7e66877498b8"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.6.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "305e1652bf2f23524b02812d6a8d07d5247c1f08fffaa71809c636de9eee50c0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.6.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9c5eaafb8a974764f255dd820781e115ef4d32272cf8ede1a58b6c6d5fb37ca2"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
