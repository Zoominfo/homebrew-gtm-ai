class GtmAiCli < Formula
  desc "ZoomInfo CLI for searching people, companies, and more"
  homepage "https://github.com/Zoominfo/gtm-ai-cli"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-arm64"
      sha256 "d130f78e2c289ef53bfa5980e2f03185a7b709ac9fc65e3fa6ad31b78c5f4f87"
    else
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-x64"
      sha256 "6d7faf3b60589a221f4bdf518bcd52b669543368ee722428cfbd830764760b5b"
    end
  end

  on_linux do
    url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-linux-x64"
    sha256 "7085cb30cebbda8b910bc6a7115ec57acfc800811ca48ec95a6bcd16e3ef58e9"
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
