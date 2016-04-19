FROM biodckr/biodocker

USER root

RUN echo 'search example.com' > /etc/resolv.conf && \
        echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
        echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
        echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
        sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list' && \
        gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9 && \
        gpg -a --export E084DAB9 | apt-key add - && \
        apt-get -y update && apt-get -y install r-base && \
        R -e 'install.packages("plotrix", repos="https://cloud.r-project.org/")'

USER biodocker

WORKDIR /data
