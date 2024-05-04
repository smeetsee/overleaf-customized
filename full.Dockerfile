ARG SHARELATEX_TAG=ghcr.io/smeetsee/overleaf-customized:main
FROM $SHARELATEX_TAG

RUN bash -c "tlmgr install scheme-full || [ \
        export TEX_LIVE_VERSION=$(tex --version | head -n 1 | grep -oP '\b\d{4}\b' | awk '{print $NF}') && \
        tlmgr repository add ftp://tug.org/historic/systems/texlive/${TEX_LIVE_VERSION}/tlnet-final && \
        tlmgr option repository ftp://tug.org/historic/systems/texlive/${TEX_LIVE_VERSION}/tlnet-final && \
        tlmgr install scheme-full \
    ]"