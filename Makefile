NAME ?= Dark-Ages


DATE := $(shell date "+%d%m%Y-%I%M")

CODE := Décimo
VERSION := 4.9-$(shell awk '/SUBLEVEL/ {print $3}' ../Makefile \
	| head -1 | sed 's/[^0-9]*//g')

SZIP := $(NAME)-$(CODE)-$(VERSION)-STABLE-$(DATE).zip
BZIP := $(NAME)-$(CODE)-$(VERSION)-BETA-$(DATE).zip


EXCLUDE := Makefile *.git* *.jar* Dark-Ages* *placeholder*

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
