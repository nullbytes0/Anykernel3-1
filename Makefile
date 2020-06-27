NAME ?= Dark-Ages


DATE := $(shell date "+%d%m%Y-%I%M")

VERSION := Segundo
ZIP := $(NAME)-$(VERSION)-$(DATE).zip
BZIP := $(NAME)-$(VERSION)-BETA-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

stable: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
