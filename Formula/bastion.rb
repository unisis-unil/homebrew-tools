class Bastion < Formula
  include Language::Python::Virtualenv

  desc "UNISIS Bastion CLI - SSH tunnels to K3S services at Universite de Lausanne"
  homepage "https://github.com/unisis-unil/bastion-ansible"
  url "https://github.com/unisis-unil/bastion-ansible.git", tag: "v0.5.0", revision: "515d592d658af97df04b102fe355268a2c8a8949"
  license "MIT"

  depends_on "python@3.12"
  depends_on "caddy" => :recommended
  # Note: gcloud-cli is a cask (brew install --cask gcloud-cli)
  # and cannot be declared as a formula dependency.

  resource "click" do
    url "https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718/click-8.3.3.tar.gz"
    sha256 "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d/markdown_it_py-4.0.0.tar.gz"
    sha256 "cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources
    venv.pip_install buildpath/"cli"
    bin.install_symlink libexec/"bin/bastion"
  end

  def caveats
    <<~EOS
      To get started:
        bastion setup

      For LLM agent integration (Claude Code, etc.):
        bastion skill-install

      Google Cloud CLI is also required (not installed by this formula):
        brew install --cask gcloud-cli
    EOS
  end

  test do
    assert_match "0.5.0", shell_output("#{bin}/bastion --version")
  end
end
