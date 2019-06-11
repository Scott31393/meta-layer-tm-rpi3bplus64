# YOCTO LAYER FOR RPI 3 B +

## Setup Environment in Host PC

First of all install the essential packages for use Yocto into your host PC:

    $ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev

Also install:

    $ sudo apt-get install libsdl1.2-dev xterm sed cvs subversion coreutils texi2html \
    docbook-utils python-pysqlite2 help2man make gcc g++    desktop-file-utils \
    libgl1-mesa-dev libglu1-mesa-dev mercurial autoconf automake groff curl lzop asciidoc 

    $ sudo apt-get install uboot-mkimage
    $ sudo apt-get install u-boot-tools 

## Setup repo utility

Create bin folder in your prefer path:

    $ mkdir bin (this step may not be needed if the bin folder already exists)
    $ curl https://storage.googleapis.com/git-repo-downloads/repo > bin/repo
    $ chmod a+x bin/repo

Add the following line to the .bashrc file to ensure that the bin folder is in your PATH variable.

    export PATH=<path_to_bin>/bin:$PATH

## Yocto Project Setup  

First make sure that git is set up properly with the commands below:

    $ git config --global user.name "Your Name"
    $ git config --global user.email "Your Email"
    $ git config --list

Now create your development folder:

    $ mkdir my_yocto_folder

Go inside:

    $ cd my_yocto_folder

And create a sources folder:

    git clone -b thud git://git.yoctoproject.org/poky && cd poky

Then, add specific meta for Raspberry Pi boards:

    $ git clone -b thud git://git.yoctoproject.org/meta-raspberrypi

Also add the tm-layer:

    $ git clone https://github.com/Scott31393/meta-layer-tm-rpi3bplus64.git 

Setup the yocto environnement by sourcing the oe init script:

    $ source/poky/oe-init-build-env <build-directory>

Modify the bblayer.conf and include the new layers (raspberry and tm layer)

    $ vim build/conf/bblayers.conf


    # POKY_BBLAYERS_CONF_VERSION is increased each time build/conf/bblayers.conf
    # changes incompatibly
    POKY_BBLAYERS_CONF_VERSION = "2"
    BBPATH = "${TOPDIR}"
    BBFILES ?= ""
    BBLAYERS ?= " \
    /home/wp_user/workspace/my_yocto/poky/meta \
    /home/wp_user/workspace/my_yocto/poky/meta-poky \
    /home/wp_user/workspace/my_yocto/poky/meta-yocto-bsp \
    /home/wp_user/workspace/my_yocto/meta-raspberrypi \
    /home/wp_user/workspace/my_yocto/meta-rpi3bplus \
    "

Now modify local.conf:

    $ vim build/conf/local.conf

    [...]
    # This sets the default machine to be qemux86 if no other machine is selected:
    #MACHINE ??= "qemux86"
    MACHINE ??= "raspberrypi3-64"
    [...]

Now you can start to bitbake:

    $ bitbake u-boot-tm

