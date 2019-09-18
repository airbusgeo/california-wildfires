# Base linux
FROM fnndsc/ubuntu-python3

# This is necessary for apt to access HTTPS sources
RUN apt-get update && apt-get install apt-transport-https

# Configuration
ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=C.UTF-8
ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install linux dependencies
RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    python3-opencv \
    ca-certificates \
    curl \
    python-numpy \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Get NodeJS
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

# Get pip
RUN pip install --upgrade pip

# Install python lib
RUN pip install --upgrade numpy && \
    pip install --upgrade opencv-python && \
    pip install --upgrade requests && \
    pip install --upgrade requests_toolbelt && \
    pip install --upgrade mercantile && \
    pip install --upgrade untangle && \
    pip install --upgrade jupyterlab && \
    pip install --upgrade ipywidgets && \
    pip install --upgrade halo && \
    pip install --upgrade moviepy

RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager

# Jupyter has issues with being run directly :
# https://github.com/ipython/ipython/issues/7062#issuecomment-114137722
# Fix it by add a little .sh script
# COPY webinar.ipynb *.sh /home/
WORKDIR /home/
EXPOSE 80
ENTRYPOINT [ "/bin/bash", "start.sh" ]

# Build : docker build -t one_atlas_data_jupyter .

# Run : docker run --rm -it -v $(pwd):/home -p 80:80 one_atlas_data_jupyter

# Access on browser : http://localhost/lab or http://localhost/notebooks/webinar.ipynb