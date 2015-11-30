FROM andrewosh/binder-base

MAINTAINER Matthew Conlen <mc@mathisonian.com>

USER root

# Retrieve recent R binary from CRAN
RUN apt-get install r-base r-base-dev

USER main

# Set default CRAN repo
RUN echo 'options("repos"="http://cran.rstudio.com")' >> /usr/lib/R/etc/Rprofile.site

# Install IRkernel
RUN Rscript -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', getOption('repos')))" -e "IRkernel::installspec()"
