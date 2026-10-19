class GtmAiCli < Formula
  desc "ZoomInfo CLI for searching people, companies, and more"
  homepage "https://github.com/Zoominfo/gtm-ai-cli"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-arm64"
      sha256 "b5da28c7e034bd8766f34dfa4bacfd3b04dc6bb525e5f00cdb2757325e70a005"
    else
      url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-macos-x64"
      sha256 "65c9320c484db30a4c9533f82253fe57a9161ac22fa221c6e368ee28848da6d9"
    end
  end

  on_linux do
    url "https://github.com/Zoominfo/gtm-ai-cli/releases/download/v#{version}/gtm-linux-x64"
    sha256 "d9df950085c63bd074f936798ff44021424ec5f6c7237a8319a8706c92da2844"
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
