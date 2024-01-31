build:
  sudo ~/go/bin/distrobuilder build-lxc ubuntu.yaml

compress:
  xz -dc rootfs.tar.xz | zstd -o ubuntu-home-lab.tar.zst

copy: 
  scp ubuntu-home-lab.tar.zst root@192.168.1.12:/var/lib/vz/template/cache/ubuntu-home-lab.tar.zst

clean:
  rm rootfs.tar.xz
  rm ubuntu-home-lab.tar.zst
  rm meta.tar.xz

create: build compress copy clean
