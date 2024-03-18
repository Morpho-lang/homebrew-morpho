class MorphoMorphoview < Formula
  desc "Morpho-morphoview. A viewer application for the morpho language"
  homepage "https://github.com/morpho-lang/morpho-morphoview"
  url "https://github.com/Morpho-lang/morpho-morphoview/archive/refs/tags/v0.6.0-alpha2.tar.gz"
  sha256 "22692107c0a68af9de86ac09e543f3f5f11bfd4163493497381fc0096119167c"
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
