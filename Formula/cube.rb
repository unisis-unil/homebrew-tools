class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.0.7"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.7/cube-x86_64-apple-darwin.tar.gz"
      sha256 "918468516da56d668697cf5fc26b6112036f6da9faf48489b493e1766b75fe16"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.7/cube-aarch64-apple-darwin.tar.gz"
      sha256 "31b64fc43686201ae1c38cb598a18aa23a5b8d99d4ec3a60227db8c08ff8a7a5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.0.7/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6969e5c58753f0cc9fb994ea3c9567428ea832404f29c0c2a9eabed33e771664"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
