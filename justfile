build-ubuntu:
  sudo ~/go/bin/distrobuilder build-lxc ubuntu.yaml

compress-ubuntu:
  xz -dc rootfs.tar.xz | zstd -o ubuntu-home-lab.tar.zst

copy-ubuntu: 
  scp ubuntu-home-lab.tar.zst root@192.168.1.12:/var/lib/vz/template/cache/ubuntu-home-lab.tar.zst

clean-ubuntu:
  rm rootfs.tar.xz
  rm ubuntu-home-lab.tar.zst
  rm meta.tar.xz

create-ubuntu: build-ubuntu compress-ubuntu copy-ubuntu clean-ubuntu

build-debian:
  sudo ~/go/bin/distrobuilder build-lxc debian.yaml

compress-debian:
  xz -dc rootfs.tar.xz | zstd -o debian-home-lab.tar.zst

copy-debian: 
  scp debian-home-lab.tar.zst root@192.168.1.12:/var/lib/vz/template/cache/debian-home-lab.tar.zst

clean-debian:
  rm rootfs.tar.xz
  rm debian-home-lab.tar.zst
  rm meta.tar.xz

create-debian: build-debian compress-debian copy-debian clean-debian
