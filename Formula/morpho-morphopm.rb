class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.2.0-alpha2.tar.gz"
  sha256 "50d64e7b4349fe0b7d1875c4f20bee6ce4cae236d4b328109307ed34f8aeb7f1"
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
