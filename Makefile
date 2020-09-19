NAME ?= Dark-Ages

DATE := $(shell date "+%d%m%Y-%I%M")
CODE := Segundo
VERSION := 4.14-$(LINUX_VERSION)

ZIP := $(NAME)-$(CODE)-$(VERSION)-$(DATE).zip
BZIP := $(NAME)-$(CODE)-$(VERSION)-BETA-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

stable: $(ZIP)
beta: $(BZIP)

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
