class Morpho < Formula
  desc "The morpho language built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "4157851961b22be1890ad1d302637fc2d5a288892f44e26fefdd3236e659da72"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suitesparse"

  def install
    args = [
      "-DMORPHO_HELP_BASEDIR=#{share}/morpho/help",
      "-DMORPHO_MODULE_BASEDIR=#{share}/morpho/modules",
      "-DCMAKE_INSTALL_RPATH=#{rpath}",
    ]
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args, *args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    
  end
end
