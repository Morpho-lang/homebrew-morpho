class Morpho < Formula
  desc "The Morpho language. Morpho is a small embeddable language for scientific computing applications."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "7aedbb7dae8ebd41634bab7ed25716cd6dedc2668c3ffc72c3d86506178dc0bb"
  license "MIT"

  depends_on "morpho-libmorpho" 
  depends_on "morpho-cli"
  depends_on "morpho-morphoview"

  def install
    system "ls"
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    assert_equal "Hello, world!", shell_output("#{bin}/morpho6 hello.morpho").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
