# https://nixos.wiki/wiki/Nginx

{
  services.prosody = {
    enable = true;
    admins = [ "pieter@glowie.dk" ];
    ssl.cert = "/var/lib/acme/glowie.dk/fullchain.pem";
    ssl.key = "/var/lib/acme/glowie.dk/key.pem";
    virtualHosts."glowie.dk" = {
        enabled = true;
        domain = "glowie.dk";
        ssl.cert = "/var/lib/acme/glowie.dk/fullchain.pem";
        ssl.key = "/var/lib/acme/glowie.dk/key.pem";
    };
    muc = [ {
        domain = "conference.glowie.dk";
    } ];
    uploadHttp = {
        domain = "upload.glowie.dk";
    };
  };
}
