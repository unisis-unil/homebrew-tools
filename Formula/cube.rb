class Cube < Formula
  desc "CLI pour interroger les cubes du lac UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v2.0.0/cube-x86_64-apple-darwin.tar.gz"
      sha256 "629a2799dbfa0374bee62f5f9e928e1048cdfe3d4a13ebb5bde41f3ace5ba1c9"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v2.0.0/cube-aarch64-apple-darwin.tar.gz"
      sha256 "9ea1241a60103750eb85d69f00eb90fdb6421b9bb7998d0920e82804878979d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v2.0.0/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "884e980d008d3780c9c4477041b3e1a7f954fee44595d06ebd7fca9e91026b05"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
