class MorphoLibmorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha3.tar.gz"
  sha256 "66f7e9f8463dfef4500451d0d5c85016e10024c88639482eca4ff360a351ff9f"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "suitesparse"

  def install
    mkdir "build" do
      args = std_cmake_args
      args.delete "-DCMAKE_BUILD_TYPE=None"
      args << "-DCMAKE_BUILD_TYPE=Release"
      args << "-DMORPHORESOURCESDIR=#{prefix}"
      args << "-DCMAKE_INSTALL_RPATH=#{rpath}"
      args << ".."
      system "cmake", *args
      system "make install"
    end
  end

  test do
    
  end
end
