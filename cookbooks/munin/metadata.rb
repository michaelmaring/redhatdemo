maintainer        "Paperless Post"
maintainer_email  "paperless-chef@paperlesspost.com"
license           "Apache 2.0"
description       "Instsalls and configures munin"
version           "0.1.0"

depends "apache2"
supports "centos"

recipe "munin", "Empty, use one of the other recipes"
recipe "munin::client", "Instlls munin and configures a client by searching for the server"
recipe "munin::server", "Installs munin and configures a server"
