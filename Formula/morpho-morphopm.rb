class MorphoMorphopm < Formula
  desc "Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.2.2-alpha2.tar.gz"
  sha256 "4db478bbd981e49a46df624466fb7a0edca659cd94cfea91d86d06c970feda6d"
  license "MIT"

  depends_on "cmake"

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  test do
    output = shell_output("#{bin}/morphopm version").strip
    output = output.gsub(/\e\[(\d+)(;\d+)*m/, "") # Remove terminal codes
    assert_equal "0.2.2", output
  end
end
