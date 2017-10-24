FROM jupyter/scipy-notebook:cc9feab481f7

USER root

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use bash as default shell, rather than sh




WORKDIR ${HOME}

RUN apt-get update; \
    apt-get install -y nodejs; \
    apt-get install -y npm; \
    apt-get install -y autoconf;\
    apt-get install -y software-properties-common 


RUN pip install ;\
    pip install https://github.com/ipython-contrib/jupyter_contrib_nbextensions/tarball/master;\
    jupyter contrib nbextension install --user;\
    jupyter nbextensions_configurator enable --user

COPY author.png ${HOME}
COPY copyright_neuropoly.png ${HOME}
COPY corMatrices.mat ${HOME}
COPY fsirShifts.mat ${HOME}
COPY histoConcordance.mat ${HOME}
COPY histoCorrelation.mat ${HOME}
COPY HowToRun.png ${HOME}
COPY hybridMatrix.png ${HOME}
COPY mtvShifts.mat ${HOME}
COPY shifBanner.png ${HOME}
COPY shiftSubs.mat ${HOME}
COPY spgrShifts.mat ${HOME}
COPY subshift.png ${HOME}
COPY dogSCspmrt.ipynb ${HOME}

RUN chown -R ${NB_USER}:${NB_USER} ${HOME}

# Run assemble scripts! These will actually build the specification
# in the repository into the image.


# Container image Labels!
# Put these at the end, since we don't want to rebuild everything
# when these change! Did I mention I hate Dockerfile cache semantics?


# We always want containers to run as non-root
USER ${NB_USER}
