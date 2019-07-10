.PHONY: dotfiles vscode-extension-save powerline-font quicklisp emacs clean
current_dir = $(shell pwd)
# openSUSE
CODECS_KDE_YMP_URL = http://opensuse-community.org/codecs-kde.ymp
CODECS_KDE_YMP = codecs-kde.ymp
YAST2_ONE_KEY_INS = /usr/share/applications/yast2-metapackage-handler

VSCODE = $(shell [ -f ~/.vscode/VSCode-linux-x64/bin/code ] && echo ~/.vscode/VSCode-linux-x64/bin/code || echo "/usr/bin/code")
VSCODE_EXTENSION_LIST_FILE = vscode-extension-list

mklink = \
	if [ -L $(2) ]; then \
		echo "Symbolic link $(2) existed, skip."; \
	elif [ -f $(2) -o -d $(2) ]; then \
		echo "Make symbolic link: $(2) ---> $(1)"; \
		rm -r $(2) && ln -s $(1) $(2); \
	else \
		echo "Target $(2) not exist, skip."; \
	fi; \
	exit 0;

# ATTENTION!!!
# 1. don't use "/" suffix on directory, because it `rm` will delete the source directory of a path with / suffix.
# 2. $(2) will be delete, be careful the input.

dotfiles :
	@$(call mklink,"${current_dir}/.gitconfig", ~/.gitconfig)
	@$(call mklink,"${current_dir}/.hgrc", ~/.hgrc)
	@$(call mklink,"${current_dir}/.tmux.conf", ~/.tmux.conf)
	@$(call mklink,"${current_dir}/.zshrc", ~/.zshrc)
	@$(call mklink,"${current_dir}/scripts", ~/.scripts)
	@$(call mklink,"${current_dir}/.pentadactyl", ~/.pentadactyl)
	@$(call mklink,"${current_dir}/.pentadactylrc", ~/.pentadactylrc)
	@$(call mklink,"${current_dir}/.config/QtProject/qtcreator/styles", ~/.config/QtProject/qtcreator/styles)
	@$(call mklink,"${current_dir}/.config/mpv/mpv.conf", ~/.config/mpv/mpv.conf)
	@$(call mklink,"${current_dir}/.config/mpv/input.conf", ~/.config/mpv/input.conf)
	@$(call mklink,"${current_dir}/.config/Code/User", ~/.config/Code/User)
	@$(call mklink,"${current_dir}/.local/share/konsole", ~/.local/share/konsole)

vscode-extension-save:
	@echo Writing file ./$(VSCODE_EXTENSION_LIST_FILE) ...
	@$(VSCODE) --list-extensions > $(VSCODE_EXTENSION_LIST_FILE)
	@echo =============================================================
	@cat $(VSCODE_EXTENSION_LIST_FILE)
	@echo =============================================================
	@echo Done.

vscode-extension-install:
	@while read -r line; do $(VSCODE) --install-extension "$$line"; done < $(VSCODE_EXTENSION_LIST_FILE)

powerline-font :
	git clone https://github.com/Lokaltog/powerline-fonts.git
	sudo cp -R powerline-fonts/DejaVuSansMono /usr/share/fonts;fc-cache -vf

quicklisp :
	@echo "Notice that SBCL should be installed first!"
	wget http://beta.quicklisp.org/quicklisp.lisp
	sbcl --script install_quicklisp.lisp
	-ln -s "${current_dir}/.sbclrc" ~/

emacs :
	cd;git clone --recursive https://github.com/kuanyui/.emacs.d.git

suse-packages :
	chmod +x suse/install-pkg.sh
	suse/install-pkg.sh
suse-codecs :
	wget ${CODECS_KDE_YMP_URL}
	${YAST2_ONE_KEY_INS) ${CODECS_KDE_YMP}
clean :
	rm -f ${CODECS_KDE_YMP}
	find . -name "*~" | xargs rm
# the solution for fail of mounting loop device.
loop :
	@echo "Please run this with root."
	echo "# additional modules to load on startup\nloop" > /etc/modules-load.d/custom.conf
