BASENAME= draft-dahm-tacacs-security
VERSION=00

EXT=.xml
SOURCEIN=${BASENAME}.in
XMLNAME=${BASENAME}${EXT}
DRAFTNAME=${BASENAME}-${VERSION}

HTML=${DRAFTNAME}/${BASENAME}.html
RAW=${DRAFTNAME}/${BASENAME}.raw.txt
TEXT=${DRAFTNAME}/${BASENAME}.txt

all: ${DRAFTNAME} ${XMLNAME} ${HTML} ${RAW} ${TEXT}

${DRAFTNAME}:
	if test ! -e ${DRAFTNAME}; then					\
		mkdir -p ${DRAFTNAME} || exit 1;			\
	fi;								\

${XMLNAME}: ${SOURCEIN} Makefile
	rm -f $@;							\
	sed								\
		-e 's,@DRAFTNAME\@,$(DRAFTNAME),g'			\
		${SOURCEIN} > $@

${DRAFTNAME}/${BASENAME}.raw.txt: ${DRAFTNAME} ${XMLNAME} Makefile
	xml2rfc --v2 ${XMLNAME} -b ${DRAFTNAME} --raw
text: ${DRAFTNAME}/${BASENAME}.raw.txt

${DRAFTNAME}/${BASENAME}.txt: ${DRAFTNAME} ${XMLNAME} Makefile
	xml2rfc ${XMLNAME} -b ${DRAFTNAME} --text
paginated: ${DRAFTNAME}/${BASENAME}.txt

${DRAFTNAME}/${BASENAME}.html: ${DRAFTNAME} ${XMLNAME} Makefile
	xml2rfc ${XMLNAME} -b ${DRAFTNAME} --html
html: ${DRAFTNAME}/${BASENAME}.html

clean:
	rm ${DRAFTNAME}/${BASENAME}.* ${XMLNAME}.bak
