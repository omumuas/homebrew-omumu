class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.1.0/omumu-0.1.0-darwin-arm64.tar.gz"
      sha256 "4f08b2058ba3852163eccbdcfc6cd78e19dbe05393eea5de615455012498ce90"
    end
  end

  def install
    bin.install "omumu"
  end

  test do
    assert_match "omumu 0.1.0", shell_output("#{bin}/omumu --version")
  end
end
