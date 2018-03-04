INSTALLDIR?=/usr/local/bin

help:
	$(info )
	$(info Targets: install|uninstall)
	$(info )
	$(info Current installation directory is $(INSTALLDIR).)
	$(info Override INSTALLDIR variable to change this.)
	$(info )
	$(info )

install:
	bash -e install.sh $(INSTALLDIR)

uninstall:
	bash -e uninstall.sh $(INSTALLDIR)
