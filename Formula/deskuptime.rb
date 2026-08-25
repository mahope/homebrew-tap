class Deskuptime < Formula
  desc "Website uptime monitor CLI: uptime, SSL expiry and content checks"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/releases/download/v0.1.2-cli/deskuptime-0.1.2.tar.gz"
  version "0.1.2"
  sha256 "7da4708889df9f65093247ebfcad65e182af0f4944b9bdd5874eb325ec9deaaf"
  license "MIT"

  depends_on "node"

  def install
    (libexec/"src/checkers").install Dir["src/checkers/*.js"]
    libexec.install Dir["src/*.js"], "package.json", "LICENSE", "README.md"
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
