class RancherCliAT06 < Formula
  desc "The Rancher CLI 0.6.x is a unified tool to manage your Rancher v1.6 server"
  homepage "https://github.com/rancher/cli"
  url "https://github.com/rancher/cli/archive/v0.6.11.tar.gz"
  sha256 "34528437ddc83bb5e4b706439d86f0b17b0fc2176ac7f0ce03652198fec6b147"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/rancher/cli/").install Dir["*"]
    system "go", "build", "-ldflags",
           "-w -X github.com/rancher/cli/version.VERSION=#{version}",
           "-o", "#{bin}/rancher0.6",
           "-v", "github.com/rancher/cli/"
  end

  test do
    system bin/"rancher", "help"
  end
end
