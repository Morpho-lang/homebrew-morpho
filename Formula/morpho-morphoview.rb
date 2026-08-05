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
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    
  end
end
