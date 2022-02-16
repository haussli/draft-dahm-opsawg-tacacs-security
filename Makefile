BASENAME= draft-dahm-tacacs-security
VERSION=00

EXT=.xml
XMLNAME=${BASENAME}${EXT}
DRAFTNAME=${BASENAME}-${VERSION}

HTML=${DRAFTNAME}/${BASENAME}.html
TEXT=${DRAFTNAME}/${BASENAME}.txt

all: ${DRAFTNAME} ${XMLNAME} ${HTML} ${TEXT}

${DRAFTNAME}:
	if test ! -e ${DRAFTNAME}; then					\
		mkdir -p ${DRAFTNAME} || exit 1;			\
	fi;								\

${DRAFTNAME}/${BASENAME}.txt: ${DRAFTNAME} ${XMLNAME} Makefile
	xml2rfc --v3 ${XMLNAME} -b ${DRAFTNAME} --text
paginated text: ${DRAFTNAME}/${BASENAME}.txt

${DRAFTNAME}/${BASENAME}.html: ${DRAFTNAME} ${XMLNAME} Makefile
	xml2rfc --v3 ${XMLNAME} -b ${DRAFTNAME} --html
html: ${DRAFTNAME}/${BASENAME}.html

clean:
	rm ${DRAFTNAME}/${BASENAME}.* ${XMLNAME}.bak
