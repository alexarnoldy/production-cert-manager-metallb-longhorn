# production-cert-manager-metallb-longhorn

This repository contains directories that contain production ready deployments for MetalLB, cert-manager, and Longhorn.

Enter each directory, in turn, and execute the commands in order. 

* The first command in the MetalLB and cert-manager directories are hard-linked and are used to set the variables for those two installations.

* Each of the three elements can be deployed independently, if needed.

* The advantage of this MetalLB pattern is that it provides an IPAddressPool for the primary application, e.g. SUSE Private AI, that will not be automatically assigned. This allows for specific, permanent DNS resolution for that application.

** It also provides for an IPAddressPool with automatic IP address assignment to configured LoadBalancer services.

* The advantage of the cert-manager pattern is that it uses the DNS01 challenger to create the application TLS certificate. This works well where the CA cannot directly access the application web server. 

** Note that the CA does need to be able to access the DNS provider (AWS Route53 is used in this example).

** An application can use non-routable IP addresses with this design, as long as the client both resolve the FQDN to the correct IP address, and access that IP address.

* The advantage of this Longhorn pattern is that it can be deployed outside of SUSE Rancher. 
