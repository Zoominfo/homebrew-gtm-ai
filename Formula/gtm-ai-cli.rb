class GtmAiCli < Formula
  desc "ZoomInfo CLI for searching people, companies, and more"
  homepage "https://github.com/Zoominfo/gtm-ai-cli"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-arm64"
      sha256 "85e59c2c31247735e826a6bce8c9b02f2096683505799f446293f118a5f86055"
    else
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-x64"
      sha256 "ef9264638439f79a3df0716c595c4cab1b24f37602d6df850b3a2ef80a37bf5c"
    end
  end

  on_linux do
    url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-linux-x64"
    sha256 "3cd9be423c2d5e71ce34d6a8f4b6ea83dfe3fa2eebaaab0112a274ba88284077"
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
