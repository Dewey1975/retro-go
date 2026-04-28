FROM espressif/idf:release-v4.4
ARG TARGET=rachel
ENV IDF_TARGET=esp32s3

WORKDIR /app

ADD . /app

# RUN pip install -r requirements.txt

# Apply patches
RUN cd /opt/esp/idf && \
	patch --ignore-whitespace -p1 -i "/app/tools/patches/panic-hook (esp-idf 4).diff" && \
	patch --ignore-whitespace -p1 -i "/app/tools/patches/sdcard-fix (esp-idf 4).diff"

# Build
SHELL ["/bin/bash", "-c"]
RUN . /opt/esp/idf/export.sh && \ 
python rg_tool.py --target=rachel build launcher
