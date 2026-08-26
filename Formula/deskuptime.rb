class Deskuptime < Formula
  desc "Website uptime monitor CLI: uptime, SSL expiry and content checks"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/releases/download/v0.2.5-cli/deskuptime-0.2.5.tar.gz"
  sha256 "ee519b491cea474fd656188deb8f5cd95023695e06281852bf49a1d7806017cf"
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
