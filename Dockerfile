FROM rocker/rstudio@sha256:ee7c4efa46f0b5d46e051393ef05f262aceb959463b15fc3648955965290d231

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    gdebi-core \
    libcurl4-openssl-dev \
    libssl-dev \
    libclang-dev \
    libxml2-dev \
    libpng-dev \
    libpng-tools \
    r-base \
    r-base-dev \
    psmisc \
    lsb-release \
    # Additional dependencies for textshaping and other R packages
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libgit2-dev \
    libssh2-1-dev \
    zlib1g-dev \
    libgmp3-dev \
    libglpk-dev \
    libgsl-dev \
    libmagick++-dev \
    libproj-dev \
    libgdal-dev \
    libudunits2-dev \
    libv8-dev \
    libsqlite3-dev \
    libexpat1-dev \
    default-jdk \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*


# Set working directory
WORKDIR /home/rstudio

# Make sure the renv.lock is in the container
COPY renv.lock /home/rstudio

# Install renv and restore the environment
RUN R -e "install.packages('renv')" && \
    R -e "renv::restore()"


# Expose port 8787 for RStudio Server
EXPOSE 8787

# Set up entry point
CMD ["/init"]