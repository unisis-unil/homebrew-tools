class Bastion < Formula
  include Language::Python::Virtualenv

  desc "UNISIS Bastion CLI - SSH tunnels to K3S services at Universite de Lausanne"
  homepage "https://github.com/unisis-unil/bastion-ansible"
  url "ssh://git@github.com/unisis-unil/bastion-ansible.git", tag: "v0.23.1", revision: "2b90c8e46cd0040eb72f1774e4c2be52c98e5128"
  license "MIT"

  depends_on "python@3.14"
  depends_on "autossh"
  depends_on "caddy"
  # Note: gcloud-cli is a cask (brew install --cask gcloud-cli)
  # and cannot be declared as a formula dependency.

  resource "click" do
    url "https://files.pythonhosted.org/packages/45/37/edbf1b0707709013c0cf2e8317e03d97ed29bf4cac709fe328904ae92a38/click-8.5.1.tar.gz"
    sha256 "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/16/fc/cee2c45553c9a9bf77d8b0c391560c556d7ed756b1f0bb35eb5d48db09ea/markdown_it_py-4.3.0.tar.gz"
    sha256 "91a58fa5b72c71a40cf7177250fd767480d7a2bb3ac426ccfb76fb90305fdaaa"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  def install
    venv = virtualenv_create(libexec, "python3.14")
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
    assert_match "0.23.1", shell_output("#{bin}/bastion --version")
  end
end
