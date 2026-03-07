class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.3/omumu-0.2.3-darwin-arm64.tar.gz"
      sha256 "9b8e2e625d206e8045fd91a08589f97ab1b58f74a7401478e38a77f10d48b814"
    end

    on_intel do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.3/omumu-0.2.3-uber.jar"
      sha256 :no_check
      depends_on "openjdk@21"
    end
  end

  on_linux do
    url "https://github.com/omumuas/omumu-cli/releases/download/v0.2.3/omumu-0.2.3-uber.jar"
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
