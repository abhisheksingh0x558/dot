# TODO: Add this to official registry
class Pi < Formula
	desc "Minimal terminal coding harness"
	homepage "https://pi.dev"
	license "MIT"
	version "0.67.3"
	url "https://registry.npmjs.org/@mariozechner/pi-coding-agent/-/pi-coding-agent-#{version}.tgz"
	sha256 "b330efa49c6e7732a6abce71661ae74811ce19e92ac228cb744e962200af312f"
	depends_on "node"

	def install
		system "npm", "install", "--global", "--prefix", libexec, cached_download
		bin.install_symlink Dir["#{libexec}/bin/*"]
	end

	test do
		assert_match(/pi/, shell_output("#{bin}/pi --version"))
	end

	livecheck do
		url "https://registry.npmjs.org/@mariozechner/pi-coding-agent"
		regex /"latest":"(\d+\.\d+\.\d+)"/
		strategy :json
	end

	def caveats
		<<~EOS
			After installation, authenticate with an API key:

				export ANTHROPIC_API_KEY=sk-ant-...
				pi

			Or use existing subscriptions:
				pi
				/login
		EOS
	end
end
