# TODO: Add this to official registry
class Forgecode < Formula
	desc "AI-enabled pair programmer for Claude, GPT, O Series, Grok, Gemini and 300+ models"
	homepage "https://forgecode.dev"
	license "Apache-2.0"
	version "2.11.1"

	on_macos do
		on_arm do
			url "https://github.com/tailcallhq/forgecode/releases/download/v#{version}/forge-aarch64-apple-darwin"
			sha256 "7dff0a5613638df8b2b8540046d4a977b778dd4f69aeeb037fbdeb2659dee96c"
		end
		on_intel do
			url "https://github.com/tailcallhq/forgecode/releases/download/v#{version}/forge-x86_64-apple-darwin"
			sha256 "3028b815c7359a2cf2b142cee40f6967def92574f16b738544bb1b8dab125a9a"
		end
	end

	def install
		if Hardware::CPU.arm?
			bin.install "forge-aarch64-apple-darwin" => "forge"
		else
			bin.install "forge-x86_64-apple-darwin" => "forge"
		end
	end

	test do
		assert_match(/forge/i, shell_output("#{bin}/forge --version"))
	end

	livecheck do
		url "https://github.com/tailcallhq/forgecode/releases"
		strategy :github_latest
	end

	def caveats
		<<~EOS
			Configure your AI provider:
				forge provider login

			Then start Forge:
				forge
		EOS
	end
end
