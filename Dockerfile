FROM mcr.microsoft.com/dotnet/sdk

COPY sqlpackage.zip sqlpackage.zip

# Install Unzip
RUN apt-get update \
    && apt-get install unzip -y

RUN mkdir /opt/sqlpackage

# Install SQLPackage for Linux and make it executable
RUN unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage

ENTRYPOINT /opt/sqlpackage/sqlpackage