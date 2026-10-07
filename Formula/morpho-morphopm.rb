class MorphoMorphopm < Formula
  desc "Simple package manager for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphopm"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.4.0-alpha1.tar.gz"
  sha256 "dc4a2dccbf3b5f813122ffce00880781195f793f5d4dc5916c94698551cb6d52"
  license "MIT"

  depends_on "cmake"
  depends_on "morpho-cli"

  def install
    bin.install "morphopm"
    (share/"morphopm").install Dir["packages/*"]
  end

  test do
    output = shell_output("#{bin}/morphopm version").strip
    output = output.gsub(/\e\[(\d+)(;\d+)*m/, "") # Remove terminal codes
    assert_equal "0.4.0", output.lines.last.strip
  end
end
