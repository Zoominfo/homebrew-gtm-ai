class GtmAiCli < Formula
  desc "ZoomInfo CLI for searching people, companies, and more"
  homepage "https://github.com/Zoominfo/gtm-ai-cli"
  version "2.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-arm64"
      sha256 "241ecff85b5ed690521a6a903d4523258a56baaa5a97f0efd23b4fcebbc4c372"
    else
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-x64"
      sha256 "2c4bd60f97f31076f0547f6b139bcc3024b8eaedc500f86a49402db9b83416f0"
    end
  end

  on_linux do
    url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-linux-x64"
    sha256 "68671e01ae97e0c1e9213964b58e56bd633db42bd58208a7e1aee7ffa3a9f627"
  end

  def install
    binary = if OS.linux?
               "gtm-linux-x64"
             elsif Hardware::CPU.arm?
               "gtm-macos-arm64"
             else
               "gtm-macos-x64"
             end
    bin.install binary => "gtm"
  end

  test do
    system "#{bin}/gtm", "--version"
  end
end
