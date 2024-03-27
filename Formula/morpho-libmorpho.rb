class MorphoLibmorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha4.tar.gz"
  sha256 "142406e9d90124d6f749a241863b771b8c6adc7aeb5394529f9db90d8d8ee495"
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
