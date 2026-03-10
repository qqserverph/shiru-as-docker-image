FROM debian:bookworm-slim

# Install wget and necessary libraries
RUN apt-get update && apt-get install -y \
    wget \
    libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
    libxcomposite1 libxdamage1 libxrandr2 libgbm1 libasound2 \
    libpangocairo-1.0-0 libxkbcommon0 libgtk-3-0 \
    && rm -rf /var/lib/apt/lists/*

# Download Shiru
RUN wget https://github.com/RockinChaos/Shiru/releases/download/v6.5.1/linux-Shiru-v6.5.1.deb -O /tmp/shiru.deb

# Install the .deb file
RUN apt-get update && apt-get install -y /tmp/shiru.deb && rm /tmp/shiru.deb

# Set up user
RUN useradd -m shiruuser
USER shiruuser
WORKDIR /home/shiruuser

CMD ["shiru"]
