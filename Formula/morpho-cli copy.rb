class MorphoLibMorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "01543140835e9a393cff10ce97764b69c6199d3d13c5532262f2868f1d932311"
  license "MIT"

  depends_on "libgrapheme" => :recommended
  depends_on "cmake" => :build

  def install
    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_BUILD_TYPE=None"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << ".."
      system "cmake", *args
      system "make install"
    end
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    assert_equal "Hello, world!", shell_output("#{bin}/morpho6 hello.morpho").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
