
include rules.mk

SUBDIRS = util cs cgi

OUTDIRS = bin libs

all: output_dir
	@for mdir in $(SUBDIRS); do \
		$(MAKE) -C $$mdir; \
	done

.PHONY: man
man:
	@mkdir -p man
	@for mdir in $(SUBDIRS); do \
		scripts/document.py --owner "Neotonic, Inc." --outdir man/ $$mdir/*.h; \
	done

clean:
	@for mdir in $(SUBDIRS); do \
	  $(MAKE) -C $$mdir clean; \
	done

clobber:
	@for mdir in $(SUBDIRS); do \
	  $(MAKE) -C $$mdir clobber; \
	done
	@for mdir in $(OUTDIRS); do \
		rm -f $$mdir/*; \
	done

output_dir:
	@for mdir in $(OUTDIRS); do \
		mkdir -p $$mdir; \
	done
