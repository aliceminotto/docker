FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'search example.com' > /etc/resolv.conf && \
        echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
	echo 'deb http://cloud.r-project.org/bin/linux/debian jessie-cran3/'>> /etc/apt/sources.list && \
        apt-get -y update && apt-get -y --force-yes install r-base r-base-dev && \
        R -e 'install.packages("weights", repos="https://cloud.r-project.org/")'

