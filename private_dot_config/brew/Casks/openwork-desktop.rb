# TODO: Add this to official registry
cask "openwork-desktop" do
	version "0.11.175"
	arch arm: "aarch64", intel: "x64"
	sha256 arm: "074d78b64c95e3c327173a92a258083cbe4fc8b49bcc4afd49621142c698056b", intel: "ef17a53d6b4fbb7a97f980408f7c770b63c0f31ce287d5afb220ea311223ead6"
	url "https://github.com/different-ai/openwork/releases/download/v#{version}/openwork-desktop-darwin-#{arch}.dmg"
	name "OpenWork"
	desc "An open-source alternative to Claude Cowork built for teams, powered by opencode"
	homepage "https://openworklabs.com"

	livecheck do
		url "https://github.com/different-ai/openwork/releases/latest/download/latest.json"
		strategy :json do |json|
			json["version"]
		end
	end

	auto_updates true
	app "OpenWork.app"
end
