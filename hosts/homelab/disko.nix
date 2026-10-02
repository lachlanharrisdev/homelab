{
  disko.devices.disk = {
    ssd = {
      type = "disk";
      device = "/dev/disk/by-id/nvme-KXG60ZNV256G_KIOXIA_210C20JXETL2";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            size = "512M";
            type = "EF00";
            content = { type = "filesystem"; format = "vfat"; mountpoint = "/boot"; };
          };
          root = {
            size = "100%";
            content = { type = "filesystem"; format = "ext4"; mountpoint = "/"; };
          };
        };
      };
    };
    hdd = {
      type = "disk";
      device = "/dev/disk/by-id/ata-WDC_WD7500BPKX-75HPJT0_WD-WXA1A9300532";
      content = {
        type = "gpt";
        partitions.data = {
          size = "100%";
          content = { type = "filesystem"; format = "ext4"; mountpoint = "/srv/data"; };
        };
      };
    };
  };
}
