# dotfiles
## Purpose

Anytime I migrate my data, I invariably forget to copy over personal config files. Well, never again! This time I will make a GitHub repository with my dotfiles, and then symlink them to their locations. As a result, they will be backed up as well as version controlled and documented in case of any issues.

<<<<<<< HEAD
Current configuration files are:
=======
Current dotfiles which are being followed:

### Shell scripts
- **profile** (~/.profile) : Generic profile for login shells that's not used anymore. I believe I used it because OSX would read from .profile. However, this is probably deprecated due to migrating to zsh.

#### Zsh

- **zshrc** (~/.zshrc): Configuration for zsh.
- **zshrc.msalz-mac2** (~/.zshrc.Ham): Machine specific configuration for Ham. Mostly to standardize paths for my external hard drive.
- **zshrc.Whitcomb** (~/.zshrc.Whitcomb): Machine-specific configuration for Whitcomb. Mostly to standardize paths for my external hard drive.

#### Tmux
- **tmux.conf** (~/.tmux.conf): Configuration file for tmux (not complete)
- 
### VIM
- neovim_config.vim ($XDG_CONFIG_HOME/neovim/init.vim): Configuration file for neovim with plugins. Make sure you have vim-plug installed.

### Python Development

#### IPython

- **profile_astroconda** ($HOME/.ipython/profile_astroconda/): Automatically load python modules relevant to data analysis when the astroconda profile is used.

#### Anaconda

- **aliases_act.sh** ($CONDA_PREFIX/etc/conda/activate.d/aliases_act.sh): Automatically load up the astroconda profile in ipython. The $CONDA_PREFIX should correspond to the environment variable in the astroconda environment.
- **aliases_deact** ($CONDA_PREFIX/etc/conda/deactivate.d/aliases_deact.sh): Automatically unalias ipython when the astroconda environment is deactivated. The $CONDA_PREFIX should correspond to the environment variable in the astroconda environment.

