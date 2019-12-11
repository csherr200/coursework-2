FROM node:7-onbuild
	LABEL maintainer "csherr200@caledonian.ac.uk"

HEALTHCHECK --interval=5s \ 	
            --timeout=5s  \	            
            CMD curl -f http://127.0.0.1:8000 || exit 1

EXPOSE 8000	
