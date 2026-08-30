class Bastion < Formula
  include Language::Python::Virtualenv

  desc "UNISIS Bastion CLI - SSH tunnels to K3S services at Universite de Lausanne"
  homepage "https://github.com/unisis-unil/bastion-ansible"
  url "https://github.com/unisis-unil/bastion-ansible.git", tag: "v0.13.1", revision: "55d5e5f3675e797c51d8478826f4d474cd085f4c"
  license "MIT"

  depends_on "python@3.14"
  depends_on "autossh"
  depends_on "caddy"
  # Note: gcloud-cli is a cask (brew install --cask gcloud-cli)
  # and cannot be declared as a formula dependency.

  resource "click" do
    url "https://files.pythonhosted.org/packages/c7/0e/7fa0ef50764b67090eca4114772a2abf8b6148198475e54c660b97caeee6/click-8.5.0.tar.gz"
    sha256 "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
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
    assert_match "0.13.1", shell_output("#{bin}/bastion --version")
  end
end
