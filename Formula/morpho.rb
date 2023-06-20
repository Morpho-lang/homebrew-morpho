class Morpho < Formula
  desc "The Morpho language. Morpho is a small embeddable language for scientific computing applications."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.5.7.tar.gz"
  sha256 "a3e4c0e4fb119a6a081a25178d00cb03959767c28ce1e2ffcff280f5e89979d2"
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
      (include/"morpho").install Dir["**/*.h"]
    end

    chdir "morphoview" do
      ENV["CPATH"] = "#{include}/morpho" # Make sure header files are visible in include path 
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
