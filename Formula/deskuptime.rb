class Deskuptime < Formula
  desc "Website uptime monitor CLI — uptime, SSL expiry & content change checks from your terminal or CI"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "2ac823c7d8e642cff4f733a9f54a5143a69e1dd9189f62c401148d608f19d502"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "src", "package.json", "LICENSE", "README.md"
    bin.write_exec_script(libexec/"src/cli.js")
    mv(bin/"cli.js", bin/"deskuptime")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deskuptime --version")
  end
end
