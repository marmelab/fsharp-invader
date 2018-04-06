FROM fsharp

# Setup Nuget / Paket / Dotnet Folders

RUN mkdir /.local /.nuget /.config /.dotnet
RUN chmod 777 /.local /.nuget /.config /.dotnet

# Setup Project Folder

RUN mkdir /app
WORKDIR /app
ADD . /app/

# Install Dotnet

RUN apt-get update && \
    apt-get --no-install-recommends install -y locales locales-all curl apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /etc/apt/trusted.gpg.d/microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-jessie-prod jessie main" > /etc/apt/sources.list.d/dotnetdev.list && \
    apt-get update && apt-get --no-install-recommends install -y dotnet-sdk-2.1.4 && \
    rm -rf /var/lib/apt/lists/*

# Install Locale

ENV LANGUAGE=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8