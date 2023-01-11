all-mac: install-fish install-git-mac install-htop install-hushlogin install-vim

.PHONY: install-fish
install-fish:
	mkdir -p ~/.config/fish
	cp -r fish/completions fish/functions fish/abbr.fish fish/config.fish ~/.config/fish/

.PHONY: uninstall-fish
uninstall-fish:
	rm -rg ~/.config/fish

.PHONY: install-git-mac
install-git-mac:
	cp git/config.mac ~/.gitconfig

.PHONY: uninstall-git
uninstall-git:
	rm ~/.gitconfig

.PHONY: install-htop
install-htop:
	mkdir -p ~/.config/htop
	cp htop/htoprc ~/.config/htop/htoprc

.PHONY: uninstall-htop
uninstall-htop:
	rm ~/.config/htop/htoprc

.PHONY: install-hushlogin
install-hushlogin:
	cp .hushlogin ~/.hushlogin

.PHONY: uninstall-hushlogin
uninstall-hushlogin:
	rm ~/.hushlogin

.PHONY: install-vim
install-vim:
	cp vim/vimrc ~/.vimrc

.PHONY: uninstall-vim
uninstall-vim:
	rm ~/.vimrc