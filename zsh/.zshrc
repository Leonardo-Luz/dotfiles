# Main Zsh configuration file
export ZSHRC_DIR="$HOME/dotfiles/.config/.zshrc.d"

# Source all modules
for file in $ZSHRC_DIR/*.zsh; do
  source "$file"
done

for style in $ZSHRC_DIR/styles/*.zsh; do
  source "$style"
done
