NAME ?= Dark-Matter


DATE := $(shell date "+%d%m%Y-%I%M")

VERSION := I
SZIP := $(NAME)-$(VERSION)-STABLE-$(DATE).zip
BZIP := $(NAME)-$(VERSION)-BETA-$(DATE).zip


EXCLUDE := Makefile *.git* *.jar* Dark-Matter* *placeholder*

stable: $(SZIP)
beta: $(BZIP)

$(SZIP):
	@echo "Creating ZIP: $(SZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

$(BZIP):
	@echo "Creating ZIP: $(BZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf boot/zImage
	@echo "Done."
