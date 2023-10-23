{
  virtualisation = {
    oci-containers.backend = "docker";
    oci-containers.containers = {
      SearxNG = {
        image = "searxng/searxng:latest";
        extraOptions = [ "--restart=unless-stopped" ];
        autoStart = true;
        ports = [ "8080:8080" ];
        environment = {
          BASE_URL = "http://localhost:8080";
          INSTANCE_NAME = "search.tpho.dk";
        };
      };
    };
  };
}
