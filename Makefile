all-mac: fish git-mac gpg htop hushlogin vim
clean-all: clean-fish clean-git clean-gpg clean-htop clean-hushlogin clean-vim

fish/completions/kubectl.fish:
	$(MAKE) -C fish/completions

fish:
	./ln.sh -v link fish/

clean-fish:
	./ln.sh -v clean fish/

git-mac:
	./ln.sh -v link git/config.mac

clean-git:
	./ln.sh -v clean git/

gpg:
	./ln.sh -v link gpg/
	chmod 700 ~/.gnupg
	gpgconf --kill gpg-agent

clean-gpg:
	./ln.sh -v clean gpg/

htop:
	./ln.sh -v link htop/

clean-htop:
	./ln.sh -v clean htop/

hushlogin:
	./ln.sh -v link .hushlogin

clean-hushlogin:
	./ln.sh -v clean .hushlogin

vim:
	./ln.sh -v link vim/

clean-vim:
	./ln.sh -v clean vim/

.PHONY: all-mac clean-all fish clean-fish git-mac clean-git gpg clean-gpg htop clean-htop hushlogin clean-hushlogin vim