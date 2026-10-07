class MorphoCli < Formula
  desc "Terminal application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-cli"
  url "https://github.com/Morpho-lang/morpho-cli/archive/refs/tags/v0.6.5-alpha1.tar.gz"
  sha256 "c4a4157a93b0828ca59dd74e47f4e92647e92f85c8061c1a9e788d4edb4d3c34"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "morpho"
  depends_on "libgrapheme" => :recommended

  def install
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    output = shell_output("#{bin}/morpho6 hello.morpho").strip
    output = output.gsub(/\e\[(\d+)(;\d+)*m/, "") # Remove terminal codes
    assert_equal "Hello, world!", output
  end
end
