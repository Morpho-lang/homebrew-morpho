class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.1.0-alpha3.tar.gz"
  sha256 "08c3f9ba3e8aa919c28f77c1a0038339a9aca5063af8ad75bcdf832642d22094"
  license "MIT"

  depends_on "cmake" 

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  test do
    assert_equal "0.1.0", shell_output("#{bin}/morphopm version").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
