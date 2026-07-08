class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.2.0-alpha3.tar.gz"
  sha256 "204cbdffac58f30b8465f502e98b4b7169be2eae1bafb655adca7b1d27b5b2e1"
  license "MIT"

  depends_on "cmake" 

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  test do
    assert_equal "0.2.0", shell_output("#{bin}/morphopm version").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
