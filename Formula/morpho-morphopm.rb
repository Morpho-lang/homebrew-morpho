class MorphoMorphopm < Formula
  desc "Morpho-morphom. Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.1.0-alpha.tar.gz"
  sha256 "4b7e6f03caf7c83a4725dc6463e92c8e743080a7132fb4df8e84ea83499c4577"
  license "MIT"

  depends_on "cmake" 

  def install
    bin.install "morphopm"
    (share/"packages").install Dir["packages/*"]
  end

  def post_install 
    system "morphopm setdatabase", share/"modules"
  end 

  test do
    assert_equal "0.1.0", shell_output("#{bin}/morphopm version").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
