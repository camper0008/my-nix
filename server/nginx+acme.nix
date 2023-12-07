# https://nixos.wiki/wiki/Nginx

{
  imports = [
    ./searxng.nix
  ];

  services.nginx = {
    enable = true;

    virtualHosts."server.tpho.dk" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "https://pieter-loves-anne.netlify.app";
    };

    virtualHosts."bordtennis.tpho.dk" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "https://bordtennis-multiplayer.netlify.app";
      locations."/singleplayer/".proxyPass = "https://bordtennis-singleplayer.netlify.app/";
    };

    virtualHosts."search.tpho.dk" = {
      addSSL = true;
      enableACME = true;
      locations."/".proxyPass = "http://localhost:8081";
    };

    virtualHosts."jesper.er.en.glowie.dk" = {
      addSSL = true;
      enableACME = true;
    };

    virtualHosts."*.tpho.dk" = {
      rejectSSL = true;
      locations."/".return = "404";
    };

  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "tphollebeek@gmail.com";

    certs = {
      "glowie.dk" = {
        listenHTTP = ":5280";
        group = "prosody";

        extraDomainNames = [ "conference.glowie.dk" "upload.glowie.dk" ];
      };  
    };
  };
}
