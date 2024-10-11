ARG NIX_VERSION=2.13.3
FROM nixos/nix:${NIX_VERSION}

WORKDIR /app

COPY flake.nix flake.lock ./

RUN nix --experimental-features "nix-command flakes" build --no-link .#devShells.x86_64-linux.default

# Install coreutils to ensure tail is available
RUN nix-env -iA nixpkgs.coreutilsS

# Create /usr/local/bin directory and set permissions
RUN mkdir -p /usr/local/bin && \
    chmod 755 /usr/local/bin

# Create a script to enter the Nix shell
RUN echo '#!/bin/sh\nNIX_SHELL_PRESERVE_PROMPT=1 exec nix --experimental-features "nix-command flakes" develop "$@"' > /usr/local/bin/enter-nix-shell && \
    sed -i 's/\\n/\n/g' /usr/local/bin/enter-nix-shell && \
    chmod +x /usr/local/bin/enter-nix-shell

# Ensure the container stays running
CMD ["tail", "-f", "/dev/null"]
