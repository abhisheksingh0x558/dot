use std 'path add'

let vendor_autoload_dir  = ($nu.vendor-autoload-dirs | last)
mkdir $vendor_autoload_dir

# Path
# Custom scripts
let local_bin = ($nu.home-dir | path join '.bin')
$local_bin | path exists; path add $local_bin
# Add Nix to path on MacOS
# TODO: Merge this setting to upstream nixpkgs and remove from here
if (uname | get kernel-name) == 'Darwin' {
	path add /usr/local/bin
	path add /nix/var/nix/profiles/default/bin
	path add /run/current-system/sw/bin
	path add ~/.nix-profile/bin
}
# Add Homebrew to path on MacOS
# TODO: Fix this entire block
# TODO: Use brew shellenv command to set up the environment properly
if (uname | get kernel-name) == 'Darwin' {
	if  (uname | get machine) == 'arm64' {
		$env.HOMEBREW_PREFIX = '/opt/homebrew'
		$env.HOMEBREW_CELLAR = '/opt/homebrew/Cellar'
		$env.HOMEBREW_REPOSITORY = '/opt/homebrew/Homebrew'
		path add /opt/homebrew/bin
		path add /opt/homebrew/sbin
	} else if (uname | get machine) == 'x86_64' {
		$env.HOMEBREW_PREFIX = '/usr/local'
		$env.HOMEBREW_CELLAR = '/usr/local/Cellar'
		$env.HOMEBREW_REPOSITORY = '/usr/local/Homebrew'
	}
}
# Global Rust binaries
if (which cargo | is-not-empty) {
	let cargo_dir = ($env.CARGO_HOME? | default ($nu.home-dir | path join '.cargo'))
	let rust_bin = ($cargo_dir | path join 'bin')
	($rust_bin | path exists); path add $rust_bin
}
# Global Go binaries
if (which go | is-not-empty) {
	let go_bin = (go env GOBIN)
	let go_dir = (go env GOPATH)
	let go_bin = if ($go_bin | is-empty) {
		($go_dir | path join 'bin')
	} else {
		$go_bin
	}
	($go_bin | path exists); path add $go_bin
}
# Doomemacs binaries
let doomemacs_bin = ($nu.home-dir | path join '.config/doomemacs/bin')
$doomemacs_bin | path exists; path add $doomemacs_bin
$env.PATH = ($env.PATH | uniq) # De-duplicate path elements

# Environment
$env.XDG_CONFIG_HOME = ($nu.home-dir | path join '.config') # TODO: Check if this is required for Linux otherwise add a guard to set only for MacOS
$env.GOPATH = ($nu.home-dir | path join '.go')              # Global Go directory

# Version manager
mise activate nu | save --force ($vendor_autoload_dir | path join 'mise.nu')

# Key mappings
$env.config.edit_mode = 'vi' # Vi mode

# UI/UX
$env.config.show_banner = false # Disable banner
# TODO: Configure history options like bash and zsh
$env.config.history = {
	file_format: sqlite # File format for file where history is stored
	max_size: 1000000   # Number of entries stored in history file
	sync_on_enter: true # Append command to history file as each command is entered
	isolation: false    # Share history across sessions
}
(which ghostty | is-not-empty); $env.TERMINAL = 'ghostty' # Default terminal
# Default editor
if (which nvim | is-not-empty) {
	$env.EDITOR = 'nvim'
	$env.VISUAL = $env.EDITOR
}
# Default browser
if (uname | get kernel-name) == 'Darwin' {
	(which helium | is-not-empty); $env.BROWSER = 'helium'
} else if (uname | get kernel-name) == 'Linux' {
	(/Applications/Helium.app/Contents/MacOS/Helium | path exists); $env.BROWSER = 'open -a Helium'
}
if (which delta | is-not-empty) {
	$env.DELTA_FEATURES = 'line-numbers' # Features to enable
	# $env.DELTA_PAGER = 'builtin' TODO: Enable this
}
(which difft | is-not-empty); $env.DFT_DISPLAY = 'inline'                                         # Display style for difftastic
(which just | is-not-empty); $env.JUST_UNSTABLE = '1'                                             # Enable unstable just features # TODO: Remove this
(which rg | is-not-empty); $env.RIPGREP_CONFIG_PATH = ($nu.home-dir | path join '.config/rg/config') # Ripgrep settings
(which docker | is-not-empty); $env.DOCKER_BUILDKIT = '1'                                         # Enable docker buildkit plugin # TODO: Remove this
# Sops age keys
if (which sops | is-not-empty) {
	$env.SOPS_AGE_KEY_FILE = ($nu.home-dir | path join '.config/age/key.txt')
	$env.SOPS_AGE_RECIPIENTS = (age-keygen -y $env.SOPS_AGE_KEY_FILE)
}
starship init nu | save --force ($vendor_autoload_dir | path join 'starship.nu') # Shell prompt

# Autocompletion
carapace _carapace nushell | save --force ($vendor_autoload_dir | path join 'carapace.nu')
pay-respects nushell | save --force ($vendor_autoload_dir | path join 'pay-respects.nu') # Autocorrection
