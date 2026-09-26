class MorphoMorphopm < Formula
  desc "Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.3.0-alpha1.tar.gz"
  sha256 "9517efd4054d673d31c0c2b5a48df4a0c71cad5f0cced97ac88706efc16d87f9"
  license "MIT"

  depends_on "cmake"

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  test do
    output = shell_output("#{bin}/morphopm version").strip
    output = output.gsub(/\e\[(\d+)(;\d+)*m/, "") # Remove terminal codes
    assert_equal "0.3.0", output.lines.last.strip
  end
end
