class Deskuptime < Formula
  desc "Website uptime monitor CLI: uptime, SSL expiry and content checks"
  homepage "https://github.com/mahope/deskuptime"
  url "https://github.com/mahope/deskuptime/releases/download/v0.1.3-cli/deskuptime-0.1.3.tar.gz"
  version "0.1.3"
  sha256 "da38a3006123e7b7149866b93d06aa467119e0461e96b6777810792b864db3f7"
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
