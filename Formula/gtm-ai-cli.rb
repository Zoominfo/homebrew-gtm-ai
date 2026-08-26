class GtmAiCli < Formula
  desc "ZoomInfo CLI for searching people, companies, and more"
  homepage "https://github.com/Zoominfo/gtm-ai-cli"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-arm64"
      sha256 "355390c11fc6530acae15a4b7ad823b1382c2eba82a5a09b9bc1a577a3d40533"
    else
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-x64"
      sha256 "bb4fbdb637820e87713995e4f5927723d9475020648478f08a4616f6cab1e936"
    end
  end

  on_linux do
    url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-linux-x64"
    sha256 "3fe5e01c75c11f12e5f572add6a88f52ba49215930b394137c30fa2b43202f5e"
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
