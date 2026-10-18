class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.5.0/omumu-0.5.0-darwin-arm64.tar.gz"
      sha256 "647b052120858accd6f878583f76a00bdc63429433455b9382aa5c02270689e7"
    end

    on_intel do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.5.0/omumu-0.5.0-uber.jar"
      sha256 :no_check
      depends_on "openjdk@21"
    end
  end

  on_linux do
    url "https://github.com/omumuas/omumu-cli/releases/download/v0.5.0/omumu-0.5.0-uber.jar"
    sha256 :no_check
    depends_on "openjdk@21"
  end

  def install
    if File.exist?("omumu")
      bin.install "omumu"
    else
      libexec.install Dir["*.jar"].first => "omumu-cli.jar"
      (bin/"omumu").write <<~EOS
        #!/bin/bash
        exec java -jar "#{libexec}/omumu-cli.jar" "$@"
      EOS
    end
  end

  def caveats
    return if !OS.mac? || !Hardware::CPU.arm?

    <<~EOS
      Homebrew runs its Xcode checks for this formula even though nothing is
      compiled. On Apple Silicon the cask avoids that entirely:
        brew uninstall omumu
        brew install --cask omumuas/omumu/omumu
    EOS
  end

  test do
    assert_match "omumu", shell_output("#{bin}/omumu --version")
  end
end
