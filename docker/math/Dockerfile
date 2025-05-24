FROM ubuntu:24.04

LABEL maintainer="Mariusz Milewczyk <mariusz@magnumit.dev>"


ENV TZ=Europe/Warsaw

RUN apt-get update && apt-get install -y  curl \
    p7zip \
    ca-certificates \
    libfontconfig1 \
    m4 \
    make \
    man \
    nano \
    nload \
    neovim \
    htop \
    texlive-latex-recommended \
    unzip \
    valgrind \
    squashfs-tools \
    telnet \
    vim \
    wget \
    && rm -rf /var/lib/apt/lists/* && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

# Anaconda
# https://repo.continuum.io/archive
ENV CONDA_VER 2024.10-1

ENV PATH $PATH:/usr/local/conda/anaconda3/bin

RUN wget https://repo.continuum.io/archive/Anaconda3-$CONDA_VER-Linux-x86_64.sh \
    && bash Anaconda3-$CONDA_VER-Linux-x86_64.sh -b -p /usr/local/conda/anaconda3 \
    && rm -f Anaconda3-$CONDA_VER-Linux-x86_64.sh \
    && conda update -n base conda -y

RUN conda update --all

# bash Jupyter kernel
RUN pip install bash_kernel \
    && python3 -m bash_kernel.install

# Install py2 and py3 envs, and registers jupyterhub kernels
# https://github.com/jupyter/jupyter/issues/71

# # install everything (except JupyterHub itself) with Python 2 and 3. Jupyter is included in Anaconda.
RUN conda create -n py3 python=3 anaconda ipykernel -y \
    && conda create -n py2 python=2 anaconda ipykernel -y

# Set PYTHON env variable to point to Python3. This will be used by PyCall.jl julia package.
ENV PYTHON /usr/local/conda/anaconda3/envs/py3/bin/python



RUN conda install -c conda-forge jupyterhub -y


# Jupyterlab: https://github.com/jupyterlab/jupyterlab
RUN conda install -c conda-forge jupyterlab -y

# Plotly for Python
RUN conda install plotly -y

EXPOSE 8000

ADD jupyterhub_config.py jupyterhub_config.py

CMD jupyterhub --no-ssl -f jupyterhub_config.py