{
  description = "A Nix flake for the Objective-See Foundation's macOS security tools.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      supportedSystems = [
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # The dynamic package builder
      mkPackages =
        pkgs:
        let
          # 1. Read the contents of the ./pkgs directory
          dirContents = builtins.readDir ./pkgs;

          # 2. Filter out anything that isn't a directory (e.g., if you add a README.md in ./pkgs)
          pkgDirs = pkgs.lib.filterAttrs (name: type: type == "directory") dirContents;
        in
        # 3. Loop through the directories and run callPackage on each
        pkgs.lib.mapAttrs (name: _: pkgs.callPackage (./pkgs + "/${name}/package.nix") { }) pkgDirs;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        mkPackages pkgs
      );

      overlays.default = final: prev: {
        objective-see = mkPackages final;
      };
    };
}
