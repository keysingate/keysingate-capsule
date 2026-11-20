# Homebrew formula for ksg-capsule (S9.3). Installs the prebuilt bare-beta-2
# binaries published as GitHub release assets; no new repo needed.
# After merge to main: brew tap keysingate/capsule https://github.com/keysingate/keysingate-capsule
# then brew install keysingate/capsule/ksg-capsule
class KsgCapsule < Formula
  desc "KeysInGate capsule controller"
  homepage "https://github.com/keysingate/keysingate-capsule"
  version "bare-beta-2"
  license "Apache-2.0"

  on_macos do
    url "https://github.com/keysingate/keysingate-capsule/releases/download/bare-beta-2/ksg-capsule-macos-universal"
    sha256 "1995214f839f1754b4a7a26229fa2dc3bb7bcf24e19675cb3ff14a3f115d63fc"
  end

  on_linux do
    url "https://github.com/keysingate/keysingate-capsule/releases/download/bare-beta-2/ksg-capsule-linux-x86_64"
    sha256 "275b37e01261100a0b73efb7d922e0f1d8bc83b006c12b6e237914592fe7245e"
  end

  def install
    bin.install (OS.mac? ? "ksg-capsule-macos-universal" : "ksg-capsule-linux-x86_64") => "ksg-capsule"
  end

  test do
    system bin/"ksg-capsule", "--help"
  end
end
