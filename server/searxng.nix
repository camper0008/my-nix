{
  virtualisation = {
    oci-containers.backend = "docker";
    oci-containers.containers = {
      SearxNG = {
        image = "searxng/searxng:latest";
        autoStart = true;
        ports = [ "8081:8080" ];
        environment = {
          PORT = "8080";
          BIND_URL = "0.0.0.0";
          BASE_URL = "https://search.tpho.dk";
          INSTANCE_NAME = "search.tpho.dk";
        };
      };
    };
  };
}
