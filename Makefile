STOW     ?= stow
TARGET   ?= $(HOME)
PACKAGES ?= zsh git starship tmux alacritty

.PHONY: install uninstall restow status

install:
	$(STOW) --restow -t $(TARGET) $(PACKAGES)

uninstall:
	$(STOW) -D -t $(TARGET) $(PACKAGES)

restow: install

status:
	@for pkg in $(PACKAGES); do \
		echo "==> $$pkg"; \
		$(STOW) -n -t $(TARGET) $$pkg 2>&1 || true; \
	done
