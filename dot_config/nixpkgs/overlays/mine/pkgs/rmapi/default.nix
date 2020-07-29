{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  name = "rmapi-${version}";
  version = "0.0.11";

  src = fetchFromGitHub {
    owner = "juruen";
    repo = "rmapi";
    rev = "v${version}";
    sha256 = "0zks1pcj2s2pqkmw0hhm41vgdhfgj2r6dmvpsagbmf64578ww349";
  };

  vendorSha256 = "077s13pcql5w2m6wzls1q06r7p501kazbwzxgfh6akwza15kb4is";

  meta = {
    description = "Go app that allows you to access your reMarkable tablet files through the Cloud API";
    homepage = "https://github.com/juruen/rmapi";
    license = lib.licenses.mit;
  };
}
