class MorphoMorphoview < Formula
  desc "Morpho-morphoview. A viewer application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphoview"
  url "https://github.com/Morpho-lang/morpho-morphoview/archive/refs/tags/v0.6.0-alpha3.tar.gz"
  sha256 "312329b79803324805e88acbae3cac982518b28f6b1925c78e6fc0cac2a33bda"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "morpho"

  depends_on "glfw" 
  depends_on "freetype"
  depends_on "povray"

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
    
  end
end
