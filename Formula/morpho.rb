class Morpho < Formula
  desc "The Morpho language. Morpho is a small embeddable language for scientific computing applications."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "a3e4c0e4fb119a6a081a25178d00cb03959767c28ce1e2ffcff280f5e89979d2"
  license "MIT"

  depends_on "morpho-libmorpho" 
  depends_on "morpho-cli"
  depends_on "morpho-morphoview"

  def install
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    assert_equal "Hello, world!", shell_output("#{bin}/morpho6 hello.morpho").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
