# https://nixos.wiki/wiki/Nginx

{
  services.nginx = {
    enable = true;
    virtualHosts."server.tpho.dk" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "https://pieter-loves-anne.netlify.app";
    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "tphollebeek@gmail.com";
  };
}
