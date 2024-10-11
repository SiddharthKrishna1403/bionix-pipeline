{
  description = "bionix-pipeline: A Nix-flake-based bioinformatics pipeline";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils/v1.0.0";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            coreutils
            figlet
            lolcat
            git
            gnumake
          ];

          shellHook = ''
            echo "Entering bionix-pipeline development environment"
            figlet "bionix-pipeline" | lolcat
            echo "Try running: figlet 'Your text here' | lolcat"
          '';
        };

        packages.default = pkgs.dockerTools.buildImage {
          name = "bionix-pipeline";
          tag = "latest";
          contents = pkgs.buildEnv {
            name = "bionix-pipeline-env";
            paths = [
              pkgs.coreutils
              pkgs.figlet
              pkgs.lolcat
              pkgs.git
              pkgs.gnumake
            ];
          };
          config = {
            Cmd = [ "sh" ];
          };
        };
      }
    );
}
