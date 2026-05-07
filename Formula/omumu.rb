class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.4/omumu-0.2.4-darwin-arm64.tar.gz"
      sha256 "c208a283a0f847452fbb94b888b5acf4a53875235cf0a791435b5d60bf75a9d6"
    end

    on_intel do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.4/omumu-0.2.4-uber.jar"
      sha256 :no_check
      depends_on "openjdk@21"
    end
  end

  on_linux do
    url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.4/omumu-0.2.4-uber.jar"
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

  test do
    assert_match "omumu", shell_output("#{bin}/omumu --version")
  end
end
