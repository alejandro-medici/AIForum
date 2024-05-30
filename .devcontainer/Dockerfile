#######################################################################################
##     The Base image with usable tools
#######################################################################################

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest as OSBASE

LABEL maintainer="Alejandro Medici <alejandro.medici@bibm.com>"

RUN microdnf update && \
    microdnf -y install wget tar gzip git && \
    microdnf clean all && rm -rf /var/cache/microdnf

#installing Python
RUN echo "** Installing Python LTS"
RUN INSTALL_PKGS="python311 glibc-langpack-en findutils nss_wrapper" && \
    microdnf -y --setopt=tsflags=nodocs --setopt=install_weak_deps=0 install $INSTALL_PKGS && \
    microdnf -y clean all --enablerepo='*'
#RUN yum install -y gcc-c++ make 

RUN curl -sSL https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py

COPY ./ /scripts

WORKDIR /scripts

RUN pip install -r requirements.txt

CMD ["/bin/bash"]