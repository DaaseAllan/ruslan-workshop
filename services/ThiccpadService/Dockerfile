FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /app
COPY ./Thiccpad/*.csproj ./
RUN dotnet restore Thiccpad.csproj
COPY ./Thiccpad/. ./
RUN dotnet publish Thiccpad.csproj -c Release -o pub

FROM mcr.microsoft.com/dotnet/core/runtime:2.2 AS runtime
WORKDIR /app
COPY --from=0 /app/pub .
ENTRYPOINT ["dotnet", "Thiccpad.dll"]