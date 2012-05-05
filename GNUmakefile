FILES	=	app event fsm server sup sup_bridge

all	:	$(FILES:%=%.erl)

.SUFFIXES:
.SUFFIXES:	.erl .m4

%.erl	:	%.m4
		m4 $< > $@
