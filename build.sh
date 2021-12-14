git clone --branch feature-julia-kernel https://github.com/ricklamers/enterprise_gateway

# download EG kernel files
VERSION=2.5.2
wget https://github.com/jupyter/enterprise_gateway/releases/download/v$VERSION/jupyter_enterprise_gateway_kernel_image_files-$VERSION.tar.gz --directory-prefix=enterprise_gateway/etc/docker/kernel-julia

# prepare build context
cp -r enterprise_gateway/etc/kernel-launchers/julia/ enterprise_gateway/etc/docker/kernel-julia/
cp enterprise_gateway/etc/kernel-launchers/bootstrap/bootstrap-kernel.sh enterprise_gateway/etc/docker/kernel-julia/
cp overrides/Dockerfile enterprise_gateway/etc/docker/kernel-julia/

# build
docker build -t orchest/kernel-julia:$VERSION enterprise_gateway/etc/docker/kernel-julia/
