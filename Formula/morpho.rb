class Morpho < Formula
  desc "The Morpho language. Morpho is a small embeddable language for scientific computing applications."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "glfw" 
  depends_on "suite-sparse"
  depends_on "freetype"
  depends_on "povray"

  def install
    chdir "morpho5" do 
      if OS.mac?
        if Hardware::CPU.arm?
          system "make", "MORPHORESOURCESDIR=#{prefix}", "-f", "Makefile.m1"
        else 
          system "make", "MORPHORESOURCESDIR=#{prefix}", "-f", "Makefile"
        end 
      else
        system "make", "MORPHORESOURCESDIR=#{prefix}", "-f", "Makefile.linux"
      end

      bin.install "morpho5"
      (share/"modules").install Dir["modules/*"]
      (share/"help").install Dir["docs/*"]
      (include).install Dir["**/*.h"]
    end

    chdir "morphoview" do
      ENV["CPATH"] = "#{include}" # Make sure header files are visible in include path 
      if OS.mac?
        if Hardware::CPU.arm?
          system "make", "-f", "Makefile.m1"
        else 
          system "make", "-f", "Makefile"
        end 
      else
        system "make", "-f", "Makefile.linux"
      end

      bin.install "morphoview"
    end
  end

  test do
    (testpath/"hello.morpho").write <<~EOS
      print "Hello, world!"
    EOS
    assert_equal "Hello, world!", shell_output("#{bin}/morpho5 hello.morpho").strip.gsub(/\e\[(\d+)(;\d+)*m/, '') # Remove terminal codes
  end
end
