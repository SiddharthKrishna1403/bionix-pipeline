FROM alpine:latest

# Install Nix
RUN apk add --no-cache curl xz
RUN curl -L https://nixos.org/nix/install | sh

# Copy Nix configuration
COPY layer1-base/nix.conf /etc/nix/nix.conf

# Copy flake files
COPY flake.nix flake.lock /app/

# Set up environment
ENV PATH="/root/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"

WORKDIR /app

# Initialize Nix flake
RUN nix --experimental-features 'nix-command flakes' develop
