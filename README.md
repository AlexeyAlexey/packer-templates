copied from https://github.com/kaorimatz/packer-templates.git 

# packer-templates

[![Travis](https://img.shields.io/travis/kaorimatz/packer-templates.svg?style=flat-square)](https://travis-ci.org/kaorimatz/packer-templates)

[Packer](https://www.packer.io/) templates for [Vagrant](https://www.vagrantup.com/) base boxes

## Usage

Clone the repository:

    $ git clone https://github.com/kaorimatz/packer-templates && cd packer-templates

Build a machine image from the template in the repository:

    $ packer build -only=qemu ubuntu-18.04-amd64.json

## Configuration

You can configure each template to match your requirements by setting the following [user variables](https://packer.io/docs/templates/user-variables.html).

 User Variable       | Default Value | Description
---------------------|---------------|----------------------------------------------------------------------------------------
 `compression_level` | 6             | [Documentation](https://packer.io/docs/post-processors/vagrant.html#compression_level)
 `cpus`              | 1             | Number of CPUs
 `disk_size`         | 40000         | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#disk_size)
 `headless`          | 0             | [Documentation](https://packer.io/docs/builders/virtualbox-iso.html#headless)
 `memory`            | 512           | Memory size in MB
 `mirror`            |               | A URL of the mirror where the ISO image is available

### Example

Build an uncompressed Arch Linux vagrant box with a 4GB hard disk using the VirtualBox provider:

```console
$ packer build -only=qemu ubuntu-18.04-amd64.json
```

```console
$ packer build -only=qemu ubuntu-18.04-amd64.json -var memory=512
```

```console
$ packer build -only=qemu ubuntu-17.10-amd64.json
```

```console
$ vagrant box add --name ubuntu-18.04-server-amd64-libvirt ubuntu-18.04-server-amd64-libvirt.box --provider=libvirt
```

You can faced with the follow problem after adding box
https://bugzilla.redhat.com/show_bug.cgi?id=1474353

```console
$ systemctl restart libvirtd
```

```console
$ vagrant box remove box_name
$ rm /var/lib/libvirt/images/box_name
```

