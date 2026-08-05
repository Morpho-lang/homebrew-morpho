class Morpho < Formula
  desc "The morpho language built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.4.tar.gz"
  sha256 "4157851961b22be1890ad1d302637fc2d5a288892f44e26fefdd3236e659da72"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suitesparse"

  def install
    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_BUILD_TYPE=None"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << "-DMORPHO_HELP_BASEDIR=#{share}/morpho/help"
      args << "-DMORPHO_MODULE_BASEDIR=#{share}/morpho/modules"
      args << "-DCMAKE_INSTALL_RPATH=#{rpath}"
      args << ".."
      system "cmake", *args
      system "make install"
    end
  end

  test do
    
  end
end
