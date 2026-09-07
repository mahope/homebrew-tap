class Transmute < Formula
  desc "Cross-platform data transformer CLI: JSON, CSV, YAML, XML, SQL, table"
  homepage "https://github.com/mahope/transmute"
  url "https://github.com/mahope/transmute/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "f44ebe163a4daa6da9e534a2354a498ca77221750caf69ff86d0143cb702d66a"
  license "MIT"

  depends_on "node"

  def install
    libexec.install "src"
    libexec.install "package.json", "LICENSE", "README.md"
    (bin/"transmute").write <<~BASH
      #!/usr/bin/env bash
      exec node #{libexec}/src/cli.js "$@"
    BASH
  end

  test do
    assert_match "a: 1", pipe_output("#{bin}/transmute -o yaml", '{"a":1}')
  end
end
