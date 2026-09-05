# objective-see-nix

A Nix flake for the [Objective-See Foundation's](https://objective-see.org/) macOS security tools.

This repository provides reproducible Nix derivations for Objective-See applications, making it easy to manage them declaratively via `nix-darwin` or run them directly via the Nix CLI. 

*Note: This project is not affiliated with the Objective-See Foundation.*

## 📦 Available Packages

Currently, this flake provides packages for the following tools (built for `aarch64-darwin` and `x86_64-darwin`):

* `lulu`
* `processmonitor`
* `dhs`
* `dnsmonitor`
* `filemonitor`
* `kextviewr`
* `knockknock`
* `netiquette`
* `taskexplorer`
<!-- Add more tools here as you package them (e.g., knockknock, blockblock, etc.) -->

## 🚀 Usage

### Running directly (no installation)

You can run any of the tools directly from the flake without installing them to your system:

```bash
nix run github:KristijanZic/objective-see-nix#lulu
