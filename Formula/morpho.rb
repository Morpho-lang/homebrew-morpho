class Morpho < Formula
  desc "The Morpho language. Morpho is a small embeddable language for scientific computing applications."
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho/archive/refs/tags/v0.5.5.tar.gz"
  sha256 "121fb795f634c424d28e135bdd43f160c8150dfb1e084b872ef97a2b6f357c4e"
  license "MIT"

  depends_on "glfw" 
  depends_on "suite-sparse"
  depends_on "freetype"
  depends_on "povray"

  def install
    chdir "morpho5" do 
      if OS.mac?
        if Hardware::CPU.arm?
          system "make", "-f", "Makefile.m1"
        else 
          system "make", "-f", "Makefile"
        end 
      else
        system "make", "-f", "Makefile.linux"
      end

      bin.install "morpho5"
      (share/"modules").install Dir["modules/*"]
      (share/"docs").install Dir["docs/*"]
    end

    chdir "morphoview" do
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
