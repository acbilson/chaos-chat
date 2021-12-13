FROM mcr.microsoft.com/dotnet/sdk:6.0 as base
WORKDIR /src

FROM base as dev
ENTRYPOINT ["dotnet", "run"]

FROM base as build
WORKDIR /src
COPY src /src
RUN dotnet restore && dotnet build
RUN dotnet publish App.csproj -c Release -o /dist

FROM mcr.microsoft.com/dotnet/runtime:6.0 as prod
COPY --from=publish /dist /var/www
ENTRYPOINT ["dotnet", "/var/www/App.dll"]
