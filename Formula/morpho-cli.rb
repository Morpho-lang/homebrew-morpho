class MorphoCli < Formula
  desc "Terminal application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-cli"
  url "https://github.com/Morpho-lang/morpho-cli/archive/refs/tags/v0.6.4-alpha1.tar.gz"
  sha256 "30a225632cc77757d0800d0770aca9e9547c0b840184a93d6304e1ebc108649f"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "morpho"
  depends_on "libgrapheme" => :recommended
  depends_on "libunistring" => :recommended

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
