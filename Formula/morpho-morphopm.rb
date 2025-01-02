class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.1.0-alpha.tar.gz"
  sha256 "ececdbf1b251b5f4e908207feefc424416b68f03adcc8cd6d9582b539b5231a2"
  license "MIT"

  depends_on "cmake" 

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  def post_install 
    system "morphopm setdatabase #{share/"morphopm"}"
  end 

  test do
    assert_equal "0.1.0", shell_output("#{bin}/morphopm version").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
