BASENAME= draft-dahm-tacacs-security
EXT=.xml
VERSION=00
SOURCENAME=${BASENAME}${EXT}
DRAFTNAME=${BASENAME}-${VERSION}

all:
	if [ ! -e ${DRAFTNAME} ] ; then					\
		mkdir -p ${DRAFTNAME} || exit 1;			\
	fi;								\
	xml2rfc ${SOURCENAME} -b ${DRAFTNAME} --raw --text --html

text:
	xml2rfc ${SOURCENAME} -b ${DRAFTNAME} --raw

paginated:
	xml2rfc ${SOURCENAME} -b ${DRAFTNAME} --text

html:
	xml2rfc ${SOURCENAME} -b ${DRAFTNAME} --html

clean:
	rm ${DRAFTNAME}.*
