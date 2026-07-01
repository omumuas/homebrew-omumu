class Omumu < Formula
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.4.0/omumu-0.4.0-darwin-arm64.tar.gz"
      sha256 "33bbbfab9e1fc0e4385c8d9ef2c274d68c3b2b2e3bcfc44940ed8a7b08550908"
    end

    on_intel do
      url "https://github.com/omumuas/omumu-cli/releases/download/v0.4.0/omumu-0.4.0-uber.jar"
      sha256 :no_check
      depends_on "openjdk@21"
    end
  end

  on_linux do
    url "https://github.com/omumuas/omumu-cli/releases/download/v0.4.0/omumu-0.4.0-uber.jar"
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
