FILES	=	your_app your_app_sup your_event your_fsm your_server \
		your_sup your_sup_bridge

all	:	$(FILES:%=%.erl)

.SUFFIXES:
.SUFFIXES:	.erl .m4

$(FILES:%=%.erl): %.erl: %.m4
		m4 $< > $@

$(FILES:%=%.erl): %.erl: *.fun
