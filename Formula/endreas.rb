class Endreas < Formula
  include Language::Python::Virtualenv

  desc "UNISIS ENDREAS CLI - containerized R dev environment on Kubernetes"
  homepage "https://github.com/unisis-unil/endreas-cli"
  url "https://github.com/unisis-unil/endreas-cli.git", tag: "v0.4.5", revision: "fe78ef726f242d8d70ed29ebf85b9e1340d75159"
  license "MIT"

  depends_on "python@3.12"
  depends_on "rust" => :build
  # docker, kubectl, devspace are runtime dependencies but are not
  # Homebrew formulae we want to force on every user (some prefer
  # Docker Desktop as a cask). Documented in caveats instead.

  resource "click" do
    url "https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718/click-8.3.3.tar.gz"
    sha256 "398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  resource "pydantic" do
    url "https://files.pythonhosted.org/packages/d9/e4/40d09941a2cebcb20609b86a559817d5b9291c49dd6f8c87e5feffbe703a/pydantic-2.13.3.tar.gz"
    sha256 "af09e9d1d09f4e7fe37145c1f577e1d61ceb9a41924bf0094a36506285d0a84d"
  end

  resource "pydantic-core" do
    url "https://files.pythonhosted.org/packages/2a/ef/f7abb56c49382a246fd2ce9c799691e3c3e7175ec74b14d99e798bcddb1a/pydantic_core-2.46.3.tar.gz"
    sha256 "41c178f65b8c29807239d47e6050262eb6bf84eb695e41101e62e38df4a5bc2c"
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

  resource "maturin" do
    url "https://files.pythonhosted.org/packages/39/16/b284a7bc4af3dd87717c784278c1b8cb18606ad1f6f7a671c47bfd9c3df0/maturin-1.13.1.tar.gz"
    sha256 "9a87ff3b8e4d1c6eac33ebfe8e261e8236516d98d45c0323550621819b5a1a2f"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install resources
    venv.pip_install buildpath
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
    assert_match "0.4.5", shell_output("#{bin}/endreas --version")
  end
end
