class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.2.0-alpha2.tar.gz"
  sha256 "5484213858b39eda883bf06a07da7ae222a3715971f2d35c7ade2a7f1dafd1b2"
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
