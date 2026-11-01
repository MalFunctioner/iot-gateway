FROM alpine
RUN mkdir -p /www && echo "Smart Hub Online" > /www/index.html
EXPOSE 80
# Print the banner, then serve it on port 80 so the container stays up
CMD echo "Smart Hub Online" && httpd -f -p 80 -h /www
