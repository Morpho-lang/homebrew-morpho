class MorphoLibmorpho < Formula
  desc "Morpho-libmorpho. Morpho built as a shared library."
  homepage "https://github.com/Morpho-lang/morpho-libmorpho"
  url "https://github.com/Morpho-lang/morpho-libmorpho/archive/refs/tags/v0.6.0-alpha.tar.gz"
  sha256 "2a281cef026fca37289ab32fbda634c0708199b6b6714f7878ba2059b68e5f0f"
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

    (share/"modules").install Dir["modules/*"]
    (share/"help").install Dir["help/*"]
    (include/"morpho").install Dir["src/**/*.h"]
  end

  test do
    
  end
end
