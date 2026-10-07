class MorphoAll < Formula
  desc "Morpho, the terminal, morphopm, and every morphopm package"
  homepage "https://github.com/Morpho-lang/morpho"
  url "https://github.com/Morpho-lang/morpho-morphopm/archive/refs/tags/v0.4.0-alpha1.tar.gz"
  sha256 "dc4a2dccbf3b5f813122ffce00880781195f793f5d4dc5916c94698551cb6d52"
  license "MIT"

  depends_on "morpho"
  depends_on "morpho-cli"
  depends_on "morpho-morphopm"

  def install
    (bin/"morpho-all").write <<~SH
      #!/bin/bash
      set -u
      shopt -s nullglob

      if brew list --formula morpho-morphoview >/dev/null 2>&1; then
        brew uninstall --ignore-dependencies morpho-morphoview
      fi

      prefix="$(brew --prefix morpho-morphopm)"
      failed=()
      for definition in "$prefix"/share/morphopm/*.json; do
        package="$(basename "$definition" .json)"
        if ! morphopm install "$package"; then
          failed+=("$package")
        fi
      done

      if ((${#failed[@]})); then
        echo "These packages did not install: ${failed[*]}" >&2
        exit 1
      fi
    SH
    chmod 0755, bin/"morpho-all"
  end

  def caveats
    <<~EOS
      Run morpho-all once to install every morphopm package into ~/morpho.
      That command also removes the deprecated Homebrew morpho-morphoview formula if it is installed.
    EOS
  end

  test do
    assert_predicate bin/"morpho-all", :executable?
  end
end
