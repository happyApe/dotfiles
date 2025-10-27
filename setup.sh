#!/bin/bash

# Dotfiles Setup Script
# Automates the installation and configuration of development environment

set -e # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
	echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
	echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
	echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
	echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS
check_macos() {
	if [[ "$OSTYPE" != "darwin"* ]]; then
		log_error "This script is designed for macOS only"
		exit 1
	fi
}

# Install Homebrew if not present
install_homebrew() {
	if ! command -v brew &>/dev/null; then
		log_info "Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		# Add Homebrew to PATH for current session
		if [[ -f "/opt/homebrew/bin/brew" ]]; then
			eval "$(/opt/homebrew/bin/brew shellenv)"
		elif [[ -f "/usr/local/bin/brew" ]]; then
			eval "$(/usr/local/bin/brew shellenv)"
		fi

		log_success "Homebrew installed and added to PATH"
	else
		log_success "Homebrew already installed"
	fi
}

# Install required packages via Homebrew
install_packages() {
	# Taps
	log_info "Tapping Brew..."
	brew tap FelixKratz/formulae

	# Formulae
	log_info "Installing Brew Formulae..."

	# Core Utils
	log_info "Install gnu coreutils"
	brew install coreutils

	# Must Have things
	packages=(
		"zsh-autosuggestions"
		"zsh-syntax-highlighting"
		"stow"
		"fzf"
		"bat"
		"fd"
		"zoxide"
		"lua"
		"luajit"
		"luarocks"
		"prettier"
		"make"
		"ripgrep"
	)

	for package in "${packages[@]}"; do
		if brew list "$package" &>/dev/null; then
			log_success "$package already installed"
		else
			log_info "Installing $package..."
			brew install "$package"
			log_success "$package installed"
		fi
	done

	# Terminal
	terminal_packages=(
		"git"
		"lazygit"
		"tmux"
		"neovim"
		"starship"
		"tree-sitter"
		"tree"
	)

	for package in "${terminal_packages[@]}"; do
		if brew list "$package" &>/dev/null; then
			log_success "$package already installed"
		else
			log_info "Installing $package..."
			brew install "$package"
			log_success "$package installed"
		fi
	done

	# dev things
	dev_packages=(
		"node"
		"nvm"
		"sqlite"
	)

	for package in "${dev_packages[@]}"; do
		if brew list "$package" &>/dev/null; then
			log_success "$package already installed"
		else
			log_info "Installing $package..."
			brew install "$package"
			log_success "$package installed"
		fi
	done

	# Casks
	casks=(
		# "raycast"
		# "karabiner-elements"
		# "keycastr"
		"font-hack-nerd-font"
		"font-jetbrains-mono-nerd-font"
		"font-sf-pro"
		"git-credential-manager"
	)

	for cask in "${casks[@]}"; do
		if brew list --cask "$cask" &>/dev/null; then
			log_success "$cask already installed"
		else
			log_info "Installing $cask..."
			brew install --cask "$cask"
			log_success "$cask installed"
		fi
	done
}

# Install Ghostty terminal emulator
install_ghostty() {
	if ! command -v ghostty &>/dev/null; then
		log_info "Installing Ghostty terminal emulator..."
		# Check if available via Homebrew
		if brew search ghostty &>/dev/null; then
			brew install --cask ghostty
			log_success "Ghostty installed via Homebrew"
		else
			log_warning "Ghostty not available via Homebrew. Please install manually from https://github.com/ghostty-org/ghostty"
		fi
	else
		log_success "Ghostty already installed"
	fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
	if [ ! -d "$HOME/.oh-my-zsh" ]; then
		log_info "Installing Oh My Zsh..."
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
		log_success "Oh My Zsh installed"
	else
		log_success "Oh My Zsh already installed"
	fi
}

# Configure zsh plugins
configure_zsh_plugins() {
	log_info "Zsh plugins installed via Homebrew (zsh-autosuggestions, zsh-syntax-highlighting)"
	log_success "Zsh plugins configuration will be handled by dotfiles"
}

# Set up dotfiles using stow
setup_dotfiles() {
	log_info "Setting up dotfiles..."

	# Get the directory where this script is located
	SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
	cd "$SCRIPT_DIR"

	# Backup existing configs
	backup_configs

	# Stow the configurations
	configs=("zsh" "tmux" "starship" "ghostty" "git" "bash" "vim")

	for config in "${configs[@]}"; do
		if [ -d "$config" ]; then
			log_info "Stowing $config configuration..."
			stow --restow --target="$HOME" "$config"
			log_success "$config configuration linked"
		else
			log_warning "$config directory not found, skipping..."
		fi
	done
}

# Backup existing configurations
backup_configs() {
	log_info "Creating backup of existing configurations..."

	backup_dir="$HOME/.config_backup_$(date +%Y%m%d_%H%M%S)"
	mkdir -p "$backup_dir"

	# Files to backup
	files_to_backup=(
		"$HOME/.zshrc"
		"$HOME/.tmux.conf"
		"$HOME/.config/starship.toml"
		"$HOME/.config/ghostty/config"
		"$HOME/.gitconfig"
		"$HOME/.bashrc"
		"$HOME/.vimrc"
	)

	for file in "${files_to_backup[@]}"; do
		if [ -f "$file" ] || [ -L "$file" ]; then
			cp -L "$file" "$backup_dir/" 2>/dev/null && log_info "Backed up $(basename "$file")"
		fi
	done

	if [ "$(ls -A "$backup_dir")" ]; then
		log_success "Backup created at $backup_dir"
	else
		rmdir "$backup_dir"
		log_info "No existing configs to backup"
	fi
}

# Configure shell
configure_shell() {
	log_info "Configuring shell..."

	# Change default shell to zsh if not already
	if [ "$SHELL" != "/bin/zsh" ] && [ "$SHELL" != "/usr/local/bin/zsh" ]; then
		log_info "Changing default shell to zsh..."
		chsh -s "$(which zsh)"
		log_success "Default shell changed to zsh"
	else
		log_success "Default shell is already zsh"
	fi
}

# Fonts are installed as part of casks in install_packages()
install_fonts() {
	log_success "Fonts installed via casks (Hack Nerd Font, JetBrains Mono Nerd Font, SF Pro)"
}

# Final setup steps
final_setup() {
	log_info "Running final setup steps..."

	# Initialize conda if available
	if command -v conda &>/dev/null; then
		log_info "Initializing conda for zsh..."
		conda init zsh 2>/dev/null || log_warning "Conda initialization failed"
	fi

	# Reload shell configurations
	log_info "Configuration complete!"
	log_warning "Please restart your terminal or run 'source ~/.zshrc' to apply changes"
}

# Main execution
main() {
	log_info "Starting dotfiles setup..."

	check_macos
	install_homebrew
	install_packages
	install_ghostty
	install_oh_my_zsh
	configure_zsh_plugins
	install_fonts
	setup_dotfiles
	configure_shell
	final_setup

	log_success "Setup completed successfully!"
	echo
	log_info "Next steps:"
	echo "  1. Restart your terminal"
	echo "  2. Open Ghostty and verify your configuration"
	echo "  3. Run 'tmux' to test tmux setup"
	echo "  4. Your shell prompt should now be powered by Starship"
}

# Run main function
main "$@"
