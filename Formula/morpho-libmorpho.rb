class MorphoLibmorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "1cef026fca37289ab32fbda634c0708199b6b6714f7878ba2059b68e5f0f"
  license "MIT"

  depends_on "cmake" => :build

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
