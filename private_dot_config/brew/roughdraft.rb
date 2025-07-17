# TODO: Add this to official registry
class Roughdraft < Formula
	desc "Local markdown review app with inline comments and suggested edits"
	homepage "https://github.com/Lex-Inc/roughdraft"
	license "MIT"
	version "0.1.10"
	url "https://registry.npmjs.org/roughdraft/-/roughdraft-#{version}.tgz"
	sha256 "1a7fbae3334ef5b1c3cd225c256f705988c36e5a0f2f9f54a844b6e577c57cf5"
	depends_on "node"

	def install
		system "npm", "install", "--global", "--prefix", libexec, cached_download
		bin.install_symlink Dir["#{libexec}/bin/*"]
	end

	test do
		assert_match(/roughdraft/, shell_output("#{bin}/roughdraft --help 2>&1"))
	end

	livecheck do
		url "https://registry.npmjs.org/roughdraft"
		regex /"latest":"(\d+\.\d+\.\d+)"/
		strategy :json
	end

	def caveats
		<<~EOS
			Start the review app:

				roughdraft start

			Or open a specific markdown file:

				roughdraft open <path>
		EOS
	end
end
