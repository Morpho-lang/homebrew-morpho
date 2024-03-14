class MorphoCli < Formula
  desc "Morpho-cli. A terminal application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-cli"
  url "https://github.com/Morpho-lang/morpho-cli/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "1a659aff0e23f82aa69aa0fcda1aee4ca58dd72372ab901dfc8cde5ad8c20f40"
  license "MIT"

  depends_on "libgrapheme"
  depends_on "cmake" => :build

  def install
    system "cmake", ".", *std_cmake_args
    system "make"

    bin.install "morpho6"
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    assert_equal "Hello, world!", shell_output("#{bin}/morpho6 hello.morpho").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
