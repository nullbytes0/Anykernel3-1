NAME ?= Dark-Ages


DATE := $(shell date "+%d%m%Y-%I%M")

VERSION := Primero
ZIP := $(NAME)-$(VERSION)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

stable: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf *.zip*
	@rm -vf zImage
	@echo "Done."
