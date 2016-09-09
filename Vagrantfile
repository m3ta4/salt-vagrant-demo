# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # vagrant-cachier
  #if Vagrant.has_plugin?("vagrant-cachier")
  #  # Configure cached packages to be shared between instances of the same base box.
  #  # More info on the "Usage" link above
  #  config.cache.scope = :box

  #  # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
  #  # NFS for shared folders. This is also very useful for vagrant-libvirt if you
  #  # want bi-directional sync
  #  config.cache.synced_folder_opts = {
  #    type: :nfs,
  #    # The nolock option can be useful for an NFSv3 client that wants to avoid the
  #    # NLM sideband protocol. Without this option, apt-get might hang if it tries
  #    # to lock files needed for /var/cache/* operations. All of this can be avoided
  #    # by using NFSv4 everywhere. Please note that the tcp option is not the default.
  #    mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
  #  }
  #end

  config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
      vb.customize ["modifyvm", :id, "--natnet1", "192.168.79.0/24"]
  end
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.host_name = 'saltmaster.local'
    master_config.vm.network "private_network", ip: "192.168.50.10"
    master_config.vm.provider "virtualbox" do |vb|
      vb.memory = 2048
    end
    master_config.vm.synced_folder "saltstack/salt/", "/srv/salt"
    master_config.vm.synced_folder "saltstack/pillar/", "/srv/pillar"

    master_config.vm.provision :salt do |salt|
      salt.master_config = "saltstack/etc/master"
      salt.master_key = "saltstack/keys/master_minion.pem"
      salt.master_pub = "saltstack/keys/master_minion.pub"
      salt.minion_key = "saltstack/keys/master_minion.pem"
      salt.minion_pub = "saltstack/keys/master_minion.pub"
      salt.seed_master = {
                          "minion1" => "saltstack/keys/minion1.pub",
                          "minion2" => "saltstack/keys/minion2.pub"
                         }

      salt.install_type = "stable"
      salt.install_master = true
      salt.no_minion = true
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion1 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    minion_config.vm.host_name = 'saltminion1.local'
    minion_config.vm.network "private_network", ip: "192.168.50.11"
    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion1"
      salt.minion_key = "saltstack/keys/minion1.pem"
      salt.minion_pub = "saltstack/keys/minion1.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion2 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "bento/centos-7.2"
    minion_config.vm.host_name = 'saltminion2.local'
    minion_config.vm.network "private_network", ip: "192.168.50.12"
    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion2"
      salt.minion_key = "saltstack/keys/minion2.pem"
      salt.minion_pub = "saltstack/keys/minion2.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

  config.vm.define :minion3 do |minion_config|
    minion_config.vm.box = "ubuntu/trusty64"
    # The following line can be uncommented to use Centos
    # instead of Ubuntu.
    # Comment out the above line as well
    #minion_config.vm.box = "bento/centos-7.2"
    minion_config.vm.host_name = 'saltminion3.local'
    minion_config.vm.network "private_network", ip: "192.168.50.12"
    minion_config.vm.provider "virtualbox" do |vb|
      vb.memory = 1024
    end

    minion_config.vm.provision :salt do |salt|
      salt.minion_config = "saltstack/etc/minion3"
      salt.minion_key = "saltstack/keys/minion3.pem"
      salt.minion_pub = "saltstack/keys/minion3.pub"
      salt.install_type = "stable"
      salt.verbose = true
      salt.colorize = true
      salt.bootstrap_options = "-P -c /tmp"
    end
  end

end
