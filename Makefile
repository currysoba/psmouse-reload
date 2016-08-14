TARGET=psmouse-reload
SRC=main.c
OBJ=${SRC:.c=.o}
CFLAGS=-O2 -Wall -Wno-unused-result

SCRIPT=synclient-settings
INSTALL_DIR=/usr/local/bin
INSTALL_TARGET=${INSTALL_DIR}/${TARGET}
INSTALL_SCRIPT=${INSTALL_DIR}/${SCRIPT}
AUTOSTART_DIR=~/.config/autostart
AUTOSTART_SCRIPT=psmouse-reload.desktop

${TARGET}: ${OBJ}
	${CC} -o $@ $<

.PHONY: install uninstall clean
install: ${TARGET}
	@sudo cp ${TARGET} ${INSTALL_TARGET}
	@sudo chown root:root ${INSTALL_TARGET}
	@sudo chmod u+s ${INSTALL_TARGET}
	@sudo cp ${SCRIPT} ${INSTALL_SCRIPT}
	@mkdir -p ${AUTOSTART_DIR}
	@cp ${AUTOSTART_SCRIPT} ${AUTOSTART_DIR}

uninstall:
	@sudo rm -rf ${INSTALL_TARGET} ${INSTALL_SCRIPT}
	@rm ${AUTOSTART_DIR}/${AUTOSTART_SCRIPT}

clean:
	@rm -rf ${TARGET} ${OBJ}
