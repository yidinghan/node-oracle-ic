ARG nodeversion=16.15.1

FROM oraclelinux:7-slim as builder

ARG icrelease=19
ARG icupdate=10

RUN yum -y install oracle-release-el7
RUN yum-config-manager --enable ol7_oracle_instantclient
RUN yum -y install oracle-instantclient${icrelease}.${icupdate}-basiclite

RUN rm -rf /usr/lib/oracle/${icrelease}.${icupdate}/client64/bin
WORKDIR /usr/lib/oracle/${icrelease}.${icupdate}/client64/lib/
RUN rm -rf *jdbc* *occi* *mysql* *jar

# Get a new image
FROM node:${nodeversion}-slim

# Copy the Instant Client libraries, licenses and config file from the previous image
COPY --from=builder /usr/lib/oracle /usr/lib/oracle
COPY --from=builder /usr/share/oracle /usr/share/oracle
COPY --from=builder /etc/ld.so.conf.d/oracle-instantclient.conf /etc/ld.so.conf.d/oracle-instantclient.conf

RUN apt-get update && apt-get -y upgrade && apt-get -y dist-upgrade && apt-get install -y libaio1 && \
    apt-get -y autoremove && apt-get -y clean && \
    ldconfig
