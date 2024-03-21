class MorphoLibmorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha2.tar.gz"
  sha256 "61048806804ca8b2e7bc3d6b3635e0e005e8ab63aacd039d9980043def0bfcf6"
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
