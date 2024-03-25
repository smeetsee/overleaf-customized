ARG SHARELATEX_TAG=ghcr.io/smeetsee/overleaf-customized:main
FROM $SHARELATEX_TAG

RUN tlmgr install scheme-full