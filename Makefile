starship:
	mkdir -p ~/.config
	ln -sf $(CURDIR)/starship.toml ~/.config/starship.toml

zshrc:
	ln -sf $(CURDIR)/.zshrc ~/.zshrc