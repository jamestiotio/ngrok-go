{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: (flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          go_1_19
          gotools
          go-tools
          golangci-lint
          gnumake
          protobuf
          protoc-gen-go
        ];
      };
    }));
}
