class Sac < Formula
  desc "Track which code a security audit has read and what it found"
  homepage "https://github.com/drsassafras/security-audit-coverage"
  url "https://github.com/drsassafras/security-audit-coverage.git",
      tag:      "v0.1.0-alpha.1",
      revision: "c813401b94f72e9be86e8675e7c714e43bfcbbb9"
  license "MIT"
  head "https://github.com/drsassafras/security-audit-coverage.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X main.Version=#{version}"), "./cmd/sac"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sac version")
  end
end
