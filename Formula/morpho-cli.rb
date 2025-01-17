class MorphoCli < Formula
  desc "Morpho-cli. A terminal application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-cli"
  url "https://github.com/Morpho-lang/morpho-cli/archive/refs/tags/v0.6.2-alpha2.tar.gz"
  sha256 "6014736f64271f1a2fb53eada8885cc70ef71f2234a3b6c221e756587116e4e9"
  license "MIT"

  depends_on "libgrapheme" => :recommended
  depends_on "libunistring" => :recommended
  depends_on "cmake" => :build
  depends_on "morpho"

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
