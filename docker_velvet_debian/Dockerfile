FROM debian:latest

ENV ZIP=velvet_1.2.10.tgz URL=http://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz FOLDER=velvet_1.2.10 DST=bin
ENV DEBIAN_FRONTEND noninteractive

RUN echo 'search example.com' > /etc/resolv.conf && \
        echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
	apt-get -y update && apt-get -yy install wget make gcc zlib1g-dev && \
	wget $URL -O $DST/$ZIP && \
        tar xvf $DST/$ZIP -C $DST && \
        rm $DST/$ZIP && \
        cd $DST/$FOLDER && \
        make 'MAXKMERLENGTH=99' && \
	ls && \
	pwd && \
        cp velvet* /$DST/ && \
        rm -rf $DST/$FOLDER

