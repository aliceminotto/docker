FROM docker/whalesay:latest
RUN echo 'search example.com' > /etc/resolv.conf && \
	echo 'nameserver 149.155.220.77' >> /etc/resolv.conf && \
	echo 'nameserver 149.155.208.92' >> /etc/resolv.conf && \
	echo 'nameserver 149.155.208.93' >> /etc/resolv.conf && \
	echo 'nameserver 149.155.208.91' >> /etc/resolv.conf && \
	echo 'nameserver 8.8.8.8' >> /etc/resolv.conf && \
	echo 'nameserver 8.8.4.4' >> /etc/resolv.conf && \
	less /etc/resolv.conf &&  \
	apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
