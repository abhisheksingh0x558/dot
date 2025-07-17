# TODO: Add this to official registry
cask "karabiner-driverkit-virtualhiddevice" do
	version "6.2.0"
	sha256 "9e8c46239f0748161241e42444857901224e5c82f5b58a1731df4c70bf0736a8"
	url "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice/releases/download/v#{version}/Karabiner-DriverKit-VirtualHIDDevice-#{version}.pkg"
	name "Karabiner-DriverKit-VirtualHIDDevice"
	desc "Virtual keyboard and mouse using DriverKit on macOS"
	homepage "https://github.com/pqrs-org/Karabiner-DriverKit-VirtualHIDDevice"

	pkg "Karabiner-DriverKit-VirtualHIDDevice-#{version}.pkg"

	postflight do
		system_command "/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager",
			args: ["forceActivate"],
			sudo: true

		# Daemon plist not included in pkg — needed for standalone use without Karabiner-Elements
		# Plist structure from upstream repo: files/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist
		daemon_plist = "/Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist"
		tmp_plist = "#{Dir.tmpdir}/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist"
		IO.write(tmp_plist, <<~XML)
			<?xml version="1.0" encoding="UTF-8"?>
			<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
			<plist version="1.0">
			<dict>
				<key>Label</key>
				<string>org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon</string>
				<key>KeepAlive</key>
				<true/>
				<key>ProcessType</key>
				<string>Interactive</string>
				<key>ProgramArguments</key>
				<array>
					<string>/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/Applications/Karabiner-VirtualHIDDevice-Daemon.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Daemon</string>
				</array>
			</dict>
			</plist>
		XML

		system_command "/bin/bash",
			args: ["-c", "mv #{tmp_plist} #{daemon_plist} && chown root:wheel #{daemon_plist}"],
			sudo: true

		system_command "/bin/bash",
			args: ["-c", "launchctl bootout system/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon 2>/dev/null; true"],
			sudo: true

		system_command "/bin/launchctl",
			args: ["bootstrap", "system", daemon_plist],
			sudo: true

		system_command "#{HOMEBREW_PREFIX}/bin/brew",
			args: ["services", "restart", "kanata"],
			sudo: true
	end

	uninstall launchctl:    "org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon",
			  early_script: {
				  executable: "/bin/bash",
				  args:       ["/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/scripts/uninstall/deactivate_driver.sh"],
			  },
			  script:       {
				  executable: "/bin/bash",
				  args:       ["-c", "bash '/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice/scripts/uninstall/remove_files.sh'; killall Karabiner-VirtualHIDDevice-Daemon 2>/dev/null; true"],
				  sudo:       true,
			  },
			  delete:       [
				  "/Applications/.Karabiner-VirtualHIDDevice-Manager.app",
				  "/Library/Application Support/org.pqrs/Karabiner-DriverKit-VirtualHIDDevice",
				  "/Library/Application Support/org.pqrs/tmp",
				  "/Library/LaunchDaemons/org.pqrs.service.daemon.Karabiner-VirtualHIDDevice-Daemon.plist",
				  "/var/log/karabiner",
			  ]
end
