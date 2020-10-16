{
  description = "Geometric Deep Learning and Inverse Graphics, A Master's Thesis";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
  flake-utils.lib.eachDefaultSystem (
    system:
    let stuff = import ./. { nixpkgs = nixpkgs.legacyPackages.${system}; };
    in rec {
      packages.ms-thesis = stuff.thesis;
      defaultPackage = packages.ms-thesis;
    }
  );
}
