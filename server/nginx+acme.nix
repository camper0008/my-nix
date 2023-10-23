# https://nixos.wiki/wiki/Nginx

{
  imports = [
    ./searxng.nix
  ];

  services.nginx = {
    enable = true;

    virtualHosts."server.tpho.dk" = {
      onlySSL = true;
      enableACME = true;
      locations."/".proxyPass = "https://pieter-loves-anne.netlify.app";
    };

    virtualHosts."search.tpho.dk" = {
      onlySSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:8081";
    };

    virtualHosts."*.tpho.dk" = {
      rejectSSL = true;
      locations."/".return = "404";
    };

  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "tphollebeek@gmail.com";
  };
}
