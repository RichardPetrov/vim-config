# Vim Configuration Setup

This repository contains my personal Vim configuration files, including settings for Vim, Tmux, and CoC (Conquer of Completion). This setup provides a modern development environment with features like code completion, syntax highlighting, and efficient terminal management.

## Prerequisites

Before setting up this configuration, ensure you have the following installed:
- Git
- Vim 8.0+ or Neovim
- Node.js (required for CoC)
- Tmux (optional, but recommended for terminal multiplexing)

## Installation Steps

1. **Backup Your Existing Configuration**
   ```bash
   # Backup existing vim configuration
   mv ~/.vimrc ~/.vimrc.backup
   mv ~/.vim ~/.vim.backup
   # Backup existing tmux configuration
   mv ~/.tmux.conf ~/.tmux.conf.backup
   ```

2. **Clone the Repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/vim-config.git
   cd vim-config
   ```

3. **Create Symbolic Links**
   ```bash
   # Link Vim configuration files
   ln -s $(pwd)/.vimrc ~/.vimrc
   ln -s $(pwd)/.vim ~/.vim
   # Link Tmux configuration
   ln -s $(pwd)/.tmux.conf ~/.tmux.conf
   # Link CoC settings
   mkdir -p ~/.config/nvim
   ln -s $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
   ```

4. **Install Vim-Plug (Plugin Manager)**
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

5. **Install Plugins**
   - Open Vim
   - Run `:PlugInstall` to install all plugins
   - After installation completes, restart Vim

6. **Install CoC Extensions**
   - Open Vim
   - Run `:CocInstall coc-json coc-tsserver coc-python coc-html coc-css`
   (Adjust the extensions based on your development needs)

## Key Features

- Modern code completion via CoC
- File explorer and fuzzy finding
- Git integration
- Syntax highlighting
- Terminal multiplexing with Tmux
- Custom key mappings for improved productivity

## Customization

- The main Vim configuration is in `.vimrc`
- CoC settings are in `coc-settings.json`
- Tmux configuration is in `.tmux.conf`

Feel free to modify these files to suit your preferences.

## Troubleshooting

If you encounter any issues:

1. Ensure all prerequisites are installed
2. Check Vim version with `vim --version`
3. For CoC issues, ensure Node.js is installed and running
4. Run `:checkhealth` in Neovim for diagnostics

## Updates

To update the configuration:

1. Pull the latest changes:
   ```bash
   cd path/to/vim-config
   git pull
   ```
2. Open Vim and run `:PlugUpdate` to update plugins

## Contributing

Feel free to fork this repository and submit pull requests with improvements.

## License

This configuration is available under the MIT License. Feel free to use and modify it as you see fit.
