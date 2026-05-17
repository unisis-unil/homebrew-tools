class Endreas < Formula
  include Language::Python::Virtualenv

  desc "UNISIS ENDREAS CLI - containerized R dev environment on Kubernetes"
  homepage "https://github.com/unisis-unil/endreas-cli"
  url "https://github.com/unisis-unil/endreas-cli.git", tag: "v0.13.6", revision: "eda25c236d12033078f0fd9da2fe6bffa840276f"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build
  # docker, kubectl, devspace are runtime dependencies but are not
  # Homebrew formulae we want to force on every user (some prefer
  # Docker Desktop as a cask). Documented in caveats instead.

  resource "click" do
    url "https://files.pythonhosted.org/packages/23/e4/796662cd90cf80e3a363c99db2b88e0e394b988a575f60a17e16440cd011/click-8.4.0.tar.gz"
    sha256 "638f1338fe1235c8f4e008e4a8a254fb5c5fbdcbb40ece3c9142ebb78e792973"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/18/a5/b60d21ac674192f8ab0ba4e9fd860690f9b4a6e51ca5df118733b487d8d6/pydantic-2.13.4.tar.gz"
    sha256 "c40756b57adaa8b1efeeced5c196f3f3b7c435f90e84ea7f443901bec8099ef6"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/9d/56/921726b776ace8d8f5db44c4ef961006580d91dc52b803c489fafd1aa249/pydantic_core-2.46.4.tar.gz"
    sha256 "62f875393d7f270851f20523dd2e29f082bcc82292d66db2b64ea71f64b6e1c1"
  end

  resource "annotated-types" do
    url "https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5/annotated_types-0.7.0.tar.gz"
    sha256 "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
  end

  resource "typing-extensions" do
    url "https://files.pythonhosted.org/packages/72/94/1a15dd82efb362ac84269196e94cf00f187f7ed21c242792a923cdb1c61f/typing_extensions-4.15.0.tar.gz"
    sha256 "0cea48d173cc12fa28ecabc3b837ea3cf6f38c6d1136f85cbaaf598984861466"
  end

  resource "typing-inspection" do
    url "https://files.pythonhosted.org/packages/55/e3/70399cb7dd41c10ac53367ae42139cf4b1ca5f36bb3dc6c9d33acdb43655/typing_inspection-0.4.2.tar.gz"
    sha256 "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
  end

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  resource "merge3" do
    url "https://files.pythonhosted.org/packages/12/71/daaa7978561b9a7bfdcee4ba5ec2ead6162f6a9d2e2edf069def96085c6b/merge3-0.0.16.tar.gz"
    sha256 "0852de4381cb46be5ef4ed49e3ac20c5a4a0cd46a8ff4bbb870bc27aab543306"
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
    url "https://files.pythonhosted.org/packages/c3/b2/bc9c9196916376152d655522fdcebac55e66de6603a76a02bca1b6414f6c/pygments-2.20.0.tar.gz"
    sha256 "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
  end

  resource "maturin" do
    url "https://files.pythonhosted.org/packages/9c/1c/612d23d33ec21b9ae7ece7b3f0dd5f9dfd57b4009e9d2938165869ebd6ae/maturin-1.13.3.tar.gz"
    sha256 "771e1e9e71a278e56db01552e0d1acfd1464259f9575b6e72842f893cd299079"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    # Bootstrap and upgrade pip inside the venv so that we bypass
    # Homebrew 5.x's --uploaded-prior-to flag, which requires pip >= 24.3
    # but python@3.12 ships pip 24.2. We install resources and the package
    # directly via the venv pip to avoid the Language::Python::Virtualenv
    # helper that calls the system python3.12 -m pip and re-injects the flag.
    system libexec/"bin/python3.12", "-m", "ensurepip"
    system libexec/"bin/python3.12", "-m", "pip", "install", "--upgrade", "pip"
    pip = libexec/"bin/pip"
    resources.each do |r|
      r.stage do
        system pip, "install", "--no-deps", "--no-binary", ":all:", "."
      end
    end
    system pip, "install", "--no-deps", buildpath
    bin.install_symlink libexec/"bin/endreas"
  end

  def caveats
    <<~EOS
      Runtime tools (install separately):
        brew install kubectl devspace jj
        brew install --cask docker

      For UNISIS K3S access, also install:
        brew install unisis-unil/tools/bastion

      To get started:
        endreas setup
        endreas init
        endreas all

      For LLM agent integration (Claude Code, etc.):
        endreas skill-install
    EOS
  end

  test do
    assert_match "0.13.6", shell_output("#{bin}/endreas --version")
  end
end
