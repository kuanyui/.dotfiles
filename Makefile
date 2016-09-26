current_dir = $(shell pwd)
# openSUSE
CODECS_KDE_YMP_URL = http://opensuse-community.org/codecs-kde.ymp
CODECS_KDE_YMP = codecs-kde.ymp
YAST2_ONE_KEY_INS = /usr/share/applications/yast2-metapackage-handler

dotfiles :
	ln -s "${current_dir}/.gitconfig" ~/
	ln -s "${current_dir}/.hgrc" ~/
	ln -s "${current_dir}/.tmux.conf" ~/
	ln -s "${current_dir}/.zshrc" ~/
	ln -s "${current_dir}/scripts" ~/.scripts
	ln -s "${current_dir}/.pentadactyl/" ~/.pentadactyl
	ln -s "${current_dir}/.pentadactylrc" ~/.pentadactylrc

powerline-font :
	git clone https://github.com/Lokaltog/powerline-fonts.git
	sudo cp -R powerline-fonts/DejaVuSansMono /usr/share/fonts;fc-cache -vf

quicklisp :
	@echo "Notice that SBCL should be installed first!"
	wget http://beta.quicklisp.org/quicklisp.lisp
	sbcl --script install_quicklisp.lisp
	-ln -s "${current_dir}/.sbclrc" ~/

emacs :
	cd;git clone https://github.com/kuanyui/.emacs.d.git
	mkdir ~/.emacs.d
	mkdir ~/.emacs.d/git
	mkdir ~/.emacs.d/private;cd !$;touch twittering-filter-users.el

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
