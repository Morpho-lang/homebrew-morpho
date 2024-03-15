class MorphoCli < Formula
  desc "Morpho-cli. A terminal application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-cli"
  url "https://github.com/Morpho-lang/morpho-cli/archive/refs/tags/v0.6.0-alpha2.tar.gz"
  sha256 "01543140835e9a393cff10ce97764b69c6199d3d13c5532262f2868f1d932311"
  license "MIT"

  depends_on "libgrapheme" => :recommended
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
