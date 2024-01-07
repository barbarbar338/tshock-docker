ARG TARGETPLATFORM=linux/amd64
ARG BUILDPLATFORM=${TARGETPLATFORM}

FROM --platform=${BUILDPLATFORM} mcr.microsoft.com/dotnet/sdk:6.0 AS builder

ARG TARGETPLATFORM

# Copy build context
WORKDIR /TShock
COPY ./TShock ./

# Build and package release based on target architecture
RUN dotnet build -v m
WORKDIR /TShock/TShockLauncher
RUN \ 
    case "${TARGETPLATFORM}" in \
        "linux/amd64") export ARCH="linux-x64" \
        ;; \
        "linux/arm64") export ARCH="linux-arm64" \
        ;; \
        "linux/arm/v7") export ARCH="linux-arm" \
        ;; \
        "windows/amd64") export ARCH="win-x64" \
        ;; \
        *) echo "Error: Unsupported platform ${TARGETPLATFORM}" && exit 1 \
        ;; \
    esac && \
    dotnet publish -o output/ -r "${ARCH}" -v m -f net6.0 -c Release -p:PublishSingleFile=true --self-contained false

# Runtime image
FROM --platform=${TARGETPLATFORM} mcr.microsoft.com/dotnet/runtime:6.0 AS runner
WORKDIR /server
COPY --from=builder /TShock/TShockLauncher/output ./

VOLUME ["/tshock", "/worlds", "/plugins"]
EXPOSE 7777 7878

COPY serverconfig.txt /server/serverconfig.txt
COPY config.sh /server/config.sh
COPY runner.sh /server/runner.sh
RUN chmod +x /server/runner.sh

ENTRYPOINT ["/server/runner.sh"]
