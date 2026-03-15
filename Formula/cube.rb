class Cube < Formula
  desc "CLI pour interroger les cubes SQLite UNISIS S3 (Statistiques en Self-Service)"
  homepage "https://github.com/unisis-unil/cube-cli"
  version "1.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.1/cube-x86_64-apple-darwin.tar.gz"
      sha256 "cfd5e636c727f4577f305de52740a0a91a5853be2cc11e64587c3fcae5b60653"
    end

    on_arm do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.1/cube-aarch64-apple-darwin.tar.gz"
      sha256 "63798f5e5a9fb22046fcb84fd74c0a37c08d58cb1eec9247c60074e99cb27d10"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/unisis-unil/cube-cli/releases/download/v1.3.1/cube-x86_64-unknown-linux-musl.tar.gz"
      sha256 "db03b5e59fbcfd76e3b7cf166d85355a71c2f1fbea1496c888101529bec6473b"
    end
  end

  def install
    bin.install "cube"
  end

  test do
    assert_match "cube", shell_output("#{bin}/cube --version")
  end
end
