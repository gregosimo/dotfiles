# dotfiles
## Purpose

Anytime I migrate my data, I invariably forget to copy over personal config files. Well, never again! This time I will make a GitHub repository with my dotfiles, and then symlink them to their locations. As a result, they will be backed up as well as version controlled and documented in case of any issues.

Current configuration files are:
- neovim_config.vim
- profile
- zshrc
- zshrc.Ham
- profile_astroconda: links within $HOME/.ipython/. Is meant to house startup scripts for running ipython scripts in the astroconda environment. Right now those startup scripts include automatically loading appropriate packages when starting ipython.
- aliases_act: links within $CONDA_PREFIX/etc/conda/activate.d in an astroconda environment. This is to automatically load up the astroconda profile in ipython when using the astroconda environment.
- aliases_deact: links within $CONDA_PREFIX/etc/conda/deactivate.d in an astroconda environment. This is to automatically unload the astroconda profile in ipython when deactivating the astroconda environment.
