FROM biodckr/biodocker

ENV ZIP=velvet_1.2.10.tgz URL=http://www.ebi.ac.uk/~zerbino/velvet/velvet_1.2.10.tgz FOLDER=velvet_1.2.10 DST=/home/biodocker/bin

USER root

RUN echo 'search example.com' > /etc/resolv.conf && \
        echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
	wget $URL -O $DST/$ZIP && \
	tar xvf $DST/$ZIP -C $DST && \
	rm $DST/$ZIP && \
	cd $DST/$FOLDER && \
	make 'MAXKMERLENGTH=99' && \
	cp $DST/$FOLDER/velvet* $DST && \
	rm -rf $DST/$FOLDER
RUN echo 'search example.com' > /etc/resolv.conf && \
        echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
	sudo sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
	gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
	gpg -a --export E084DAB9 | apt-key add - && \
	apt-get -y update && apt-get -y install r-base && \
	R -e 'install.packages("plotrix", repos="https://cloud.r-project.org/")'

USER biodocker

WORKDIR /data
