class Morpho < Formula
  desc "The morpho language built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.6.1-alpha.tar.gz"
  sha256 "b916aff186e2bbcc66d0a56c25eb50f861af14cc8c14119c19309f9fb10cb3c5"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suitesparse"

  def install
    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_BUILD_TYPE=None"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << "-DMORPHO_RESOURCESDIR=#{prefix}"
      args << "-DCMAKE_INSTALL_RPATH=#{rpath}"
      args << ".."
      system "cmake", *args
      system "make install"
    end
  end

  test do
    
  end
end
