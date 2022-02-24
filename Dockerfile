FROM mcr.microsoft.com/dotnet/sdk:6.0 as base

# installs source for db creation
COPY src /src
WORKDIR /src

# installs ef tool for initial db creation
RUN dotnet tool install --global dotnet-ef
RUN /root/.dotnet/tools/dotnet-ef migrations add InitialCreate
RUN /root/.dotnet/tools/dotnet-ef database update

FROM base as dev
WORKDIR /src

# installs sqlite3 for db inspection
RUN apt-get update && apt-get install sqlite3 -y

# inserts initial test data
RUN mkdir /migrations
COPY migrations/initial_insert.sql /migrations
RUN sqlite3 /root/.local/share/chat.db < /migrations/initial_insert.sql

ENTRYPOINT ["dotnet", "watch", "run"]

FROM base as build
WORKDIR /src
COPY src /src
RUN dotnet restore && dotnet build
RUN dotnet publish App.csproj -c Release -o /dist

FROM mcr.microsoft.com/dotnet/runtime:6.0 as prod
COPY --from=publish /dist /var/www
ENTRYPOINT ["dotnet", "/var/www/App.dll"]
