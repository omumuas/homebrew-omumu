class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.0/omumu-0.2.0-darwin-arm64.tar.gz"
      sha256 "06960c426d0091732295c498c2ddb0f667a457174f47d1efd451cd5040ad1b7e"
    end
  end

  def install
    bin.install "omumu"
  end

  test do
    assert_match "omumu 0.2.0", shell_output("#{bin}/omumu --version")
  end
end
