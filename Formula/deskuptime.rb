class Deskuptime < Formula
  desc "Website uptime monitor CLI: uptime, SSL expiry and content checks"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "d240b6c1aa2c6da30c0ee92d42f90d66c6ff44de5efb8c5d9a93650ce0e49f9b"
  license "MIT"

  depends_on "node"

  def install
    (libexec/"src").install Dir["src/*.js"]
    (libexec/"src/checkers").install Dir["src/checkers/*.js"]
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
