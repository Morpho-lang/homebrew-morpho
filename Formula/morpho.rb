class Morpho < Formula
  desc "The morpho language built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.2-alpha.tar.gz"
  sha256 "3fc1cd3c1eb396ba294f7d28b49191d13b7eb2b4dac584cab14091ad8538a86d"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suitesparse"

  def install
    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_BUILD_TYPE=None"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << "-DMORPHO_HELP_BASEDIR=#{prefix}"
      args << "-DMORPHO_MODULE_BASEDIR=#{prefix}"
      args << "-DCMAKE_INSTALL_RPATH=#{rpath}"
      args << ".."
      system "cmake", *args
      system "make install"
    end
  end

  test do
    
  end
end
