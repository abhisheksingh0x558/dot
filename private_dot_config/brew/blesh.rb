# TODO: Add this to official registry
class Blesh < Formula
	desc "Bash Line Editor with syntax highlighting, vim modes, auto-completion"
	homepage "https://github.com/akinomyoga/ble.sh"
	license "BSD-3-Clause"
	version "0.4.0-devel3"
	url "https://github.com/akinomyoga/ble.sh/releases/download/v#{version}/ble-#{version}.tar.xz"
	sha256 "c8612ee612bc6b10dbfd6e85c6cbdfd7caf152a12d1f9de22ea0a9d735b3080c"
	keg_only "ble.sh is sourced from .bashrc, not run as a command"

	def install
		prefix.install Dir["*"]
	end

	test do
		assert_match(/BLE/, shell_output("bash -c 'source #{opt_prefix}/ble.sh && echo $BLE_VERSION'"))
	end

	livecheck do
		url "https://github.com/akinomyoga/ble.sh/releases"
		strategy :github_latest
	end

	def caveats
		<<~EOS
			Add to your ~/.bashrc:

			# At the top:
			[[ $- == *i* ]] && source -- #{opt_prefix}/ble.sh --attach=none

			# your bashrc settings come here...

			# At the end:
			[[ ! ${BLE_VERSION-} ]] || ble-attach
		EOS
	end
end
