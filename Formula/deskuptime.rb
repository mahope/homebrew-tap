class Deskuptime < Formula
  desc "Website uptime monitor CLI: uptime, SSL expiry and content checks"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/releases/download/v0.1.4-cli/deskuptime-0.1.4.tar.gz"
  sha256 "f517d5134d404b9c6d47eb4514e17c05ae5db73456e826b022bb41ef4bd80d0c"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "src"
    libexec.install "package.json", "LICENSE", "README.md"
    chmod 0555, libexec/"src/cli.js"
    (bin/"deskuptime").write <<~RUBY
      #!/usr/bin/env bash
      exec node #{libexec}/src/cli.js "$@"
    RUBY
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/deskuptime --version")
  end
end
