# LTTng-vagrant

This is a Vagrant box for lttng with node.js. It sets up and compiles lttng and its dependencies from source, and compiles node.js with lttng support turned on.

## Quickstart

### Clone this repo

```bash
Glens-MacBook-Pro-2:~ glen$ git clone https://github.com/nearform/lttng-vagrant/
```

### Bring it up/run it with vagrant
  On first run, this will install lttng, and fetch & build node.js latest from source, with lttng support enabled. This can be a long process. Grab a coffee. ☕️

```bash
Glens-MacBook-Pro-2:~ glen$ cd lttng-vagrant
Glens-MacBook-Pro-2:lttng-vagrant glen$ vagrant up
```

### Get into your box when its running

```bash
Glens-MacBook-Pro-2:lttng-vagrant glen$ vagrant ssh
```

### Stop this box

```bash
Glens-MacBook-Pro-2:lttng-vagrant glen$ vagrant halt
```

### Enabling a shared folder for easy development

If you wish to create a shared folder between your host machine and your vagrant box, edit the `Vagrantfile` in the base of this folder, where you see

```ruby
# uncomment the line below to create a shard workspace
# config.vm.synced_folder "~/work/vagrant/shared", "/vagrant/shared"
```

change `"~/work/vagrant/shared"` to the path on your host machine you want this folder to be at.

## License:
MIT
