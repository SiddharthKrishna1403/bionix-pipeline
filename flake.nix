{
  description = "Bioinformatics Nix Pipeline";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
	devShell = pkgs.mkShell {
  	  buildInputs = with pkgs; [
    	  bash
    	  coreutils
    	  gnused
    	  gawk
    	  gnugrep
    	  gnutar
    	  gzip
    	  wget
    	  curl
    	  git
    	  findutils
    	  diffutils
    	  which
	  
	  nextflow
    # Add other tools as needed
  ];
};

