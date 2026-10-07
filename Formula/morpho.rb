class Morpho < Formula
  desc "Shared library for the Morpho programming language"
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.5-beta.tar.gz"
  sha256 "18790a263c8dd2db0a5f9499ad35a3097afda64af8434e9c8e69b819e2e53d43"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suite-sparse"

  on_linux do
    depends_on "openblas"
  end

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
    assert_path_exists include/"morpho/morpho.h"
    assert_path_exists lib/"cmake/morpho/morphoConfig.cmake"
  end
end
