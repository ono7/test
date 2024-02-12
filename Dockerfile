FROM redhat/ubi8-minimal as build

ENV LANG=C.UTF-8

USER root

RUN microdnf update -y && \
    microdnf install python3.11 python3.11-pip findutils unzip gcc make which wget jq git --nodocs --setopt install_weak_deps=0 -y && \
    alternatives --set python3 /usr/bin/python3.11 && \
    alternatives --install /usr/bin/pip pip /usr/bin/pip3.11 1 && \
    pip install wheel ruff setuptools ansible ansible-lint ansible-builder pytest && \
    microdnf clean all && rm -rf /usr/lib/locale/*.tmpl && \
    rm -rf /var/cache/yum
ENV PATH=/usr/bin:${PATH}
