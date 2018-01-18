FROM alpine
RUN apk update
RUN apk add nano mc
RUN apk add nginx
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig 
COPY ./nginx.conf /etc/nginx/
COPY ./index.html /www/
WORKDIR /www/
EXPOSE 80
CMD /usr/sbin/nginx && /bin/sh
