FROM swift
WORKDIR /mud
ADD . ./
RUN mkdir /mud/bin
RUN swift package clean
RUN swift build -c release
RUN mv `swift build -c release --show-bin-path` /mud/bin
# TODO: read from a config file that the game reads as well.
EXPOSE 9000
ENTRYPOINT ./bin/release/VanillaMUD
