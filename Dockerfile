FROM espressif/idf:release-v4.4
ARG TARGET=rachel-esp32
ENV IDF_TARGET=esp32s3
WORKDIR /app
COPY . .
RUN python3 rg_tool.py --target=$TARGET build launcher
