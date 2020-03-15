self: super: 
let 
  callPackage = super.lib.callPackageWith super;
in {
  scholar = callPackage ./pkgs/scholar {};
}
