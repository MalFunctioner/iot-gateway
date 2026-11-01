FROM alpine
EXPOSE 80
# Print the banner, then answer HTTP on port 80 with it (no packages needed)
CMD echo "Smart Hub Online" && \
    while true; do \
      printf 'HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\n\r\nSmart Hub Online\n' | nc -l -p 80 || sleep 1; \
    done
