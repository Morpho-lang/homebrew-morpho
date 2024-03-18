class MorphoMorphoview < Formula
  desc "Morpho-morphoview. A viewer application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphoview"
  url "https://github.com/Morpho-lang/morpho-morphoview/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "f649f99bc3e381aafd4af9e0fbbbe3af593d0aff613789bea1aa885f7f8bce64"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "morpho-libmorpho"

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
