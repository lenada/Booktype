maintainer        "Leander Damme"
maintainer_email  "mail@leander-damme.com"
license           "BSD License"
description       "Installs and configures booktype for our appservers."
version           "0.1"
recipe            "booktype::server", "Installs Booktype"
recipe            "bookty::configure", "Configures virtualhost, etc."

supports 'ubuntu'