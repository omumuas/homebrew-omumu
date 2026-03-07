class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.1/omumu-0.2.1-darwin-arm64.tar.gz"
      sha256 "4f08ebdac3fc4bcdf69b5ddb0f2e5a0aa3a23149816e0b0279e958ff4ee79943"
    end
  end

  def install
    bin.install "omumu"
  end

  test do
    assert_match "omumu 0.2.1", shell_output("#{bin}/omumu --version")
  end
end
