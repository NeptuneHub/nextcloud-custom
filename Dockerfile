FROM nextcloud:29.0.4-apache

# Update the package lists
RUN apt-get update && \
    # Upgrade all installed packages
    apt-get upgrade -y && \
    # Clean up to reduce image size
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Reapply the Nextcloud configuration
COPY --from=nextcloud:29.0.4-apache /var/www/html /var/www/html
