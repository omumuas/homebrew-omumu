cask "omumu" do
  version "0.5.0"
  sha256 "647b052120858accd6f878583f76a00bdc63429433455b9382aa5c02270689e7"

  url "https://github.com/omumuas/omumu-cli/releases/download/v#{version}/omumu-#{version}-darwin-arm64.tar.gz"
  name "Omumu CLI"
  desc "CLI for the Omumu customer education platform"
  homepage "https://github.com/omumuas/omumu-cli"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The native binary is only built for Apple Silicon. Intel Macs and Linux
  # use the formula, which runs the uber JAR on OpenJDK.
  depends_on arch: :arm64

  binary "omumu"

  # Homebrew quarantines cask downloads and the binary is not notarized, so
  # macOS would kill it on launch (exit 137) unless the attribute is cleared.
  # `postflight` (not `postflight_steps`) keeps this working on Homebrew 6.
  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-d", "com.apple.quarantine", "#{staged_path}/omumu"],
                   must_succeed: false
  end

  caveats <<~EOS
    This cask installs the prebuilt Apple Silicon binary and never needs Xcode.
    If you installed the formula earlier, remove it first:
      brew uninstall omumu
  EOS
end
