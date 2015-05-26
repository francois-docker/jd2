# Base docker image
FROM debian:jessie
MAINTAINER François Billant <fbillant@gmail.com>

COPY oracle-java8-jre_8u45_amd64.deb /usr/src/oracle-java8-jre_8u45_amd64.deb
COPY JDownloader.jar /usr/src/JDownloader.jar

RUN sed -i.bak 's/jessie main/jessie main contrib non-free/g' /etc/apt/sources.list && \

apt-get update && \
apt-get install -y \
dbus fontconfig fontconfig-config fonts-dejavu-core hicolor-icon-theme krb5-locales libalgorithm-c3-perl libarchive-extract-perl libasound2 \
 libasound2-data libatk1.0-0 libatk1.0-data libavahi-client3 libavahi-common-data libavahi-common3 libbsd0 libcairo2 libcap-ng0 libcgi-fast-perl \
 libcgi-pm-perl libclass-c3-perl libclass-c3-xs-perl libcpan-meta-perl libcups2 libdata-optlist-perl libdata-section-perl libdatrie1 libdbus-1-3 \
 libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libedit2 libelf1 libexpat1 libfcgi-perl libffi6 libfontconfig1 libfreetype6 libgdbm3 \
 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglib2.0-0 libglib2.0-data libgmp10 libgnutls-deb0-28 \
 libgraphite2-3 libgssapi-krb5-2 libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libharfbuzz0b libhogweed2 libjasper1 libjbig0 libjpeg62-turbo libk5crypto3 \
 libkeyutils1 libkrb5-3 libkrb5support0 libllvm3.5 liblog-message-perl liblog-message-simple-perl libmodule-build-perl libmodule-pluggable-perl \
 libmodule-signature-perl libmro-compat-perl libnettle4 libp11-kit0 libpackage-constants-perl libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 \
 libparams-util-perl libpciaccess0 libpixman-1-0 libpng12-0 libpod-latex-perl libpod-readme-perl libregexp-common-perl libsoftware-license-perl \
 libsub-exporter-perl libsub-install-perl libtasn1-6 libterm-ui-perl libtext-soundex-perl libtext-template-perl libthai-data libthai0 libtiff5 \
 libtxc-dxtn-s2tc0 libx11-6 libx11-data libx11-xcb1 libxau6 libxcb-dri2-0 libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shm0 \
 libxcb-sync1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxdmcp6 libxext6 libxfixes3 libxi6 libxinerama1 libxml2 libxrandr2 libxrender1 \
 libxshmfence1 libxslt1.1 libxtst6 libxxf86vm1 perl perl-modules rename sgml-base shared-mime-info ucf x11-common xdg-user-dirs xml-core

RUN dpkg -i /usr/src/oracle-java8-jre_8u45_amd64.deb

# Autorun jdowloader
CMD ["/usr/bin/java","-jar","/usr/src/JDownloader.jar"]
