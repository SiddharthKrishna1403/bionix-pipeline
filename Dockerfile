FROM nixos/nix:2.13.3

WORKDIR /app

COPY flake.nix flake.lock ./

RUN nix --version && \
    nix --experimental-features "nix-command flakes" \
    build --no-link .#devShells.x86_64-linux.default

ENTRYPOINT ["nix", "--experimental-features", "nix-command flakes", "develop"]
CMD [".#"]
