class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.2/omumu-0.2.2-darwin-arm64.tar.gz"
      sha256 "ff07da33c341bb6d5cdb6264302f2ebcec7120a141e3dec94c75ae02acdb034d"
    end
  end

  def install
    bin.install "omumu"
  end

  test do
    assert_match "omumu 0.2.2", shell_output("#{bin}/omumu --version")
  end
end
