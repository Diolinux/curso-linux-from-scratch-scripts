#!/bin/sh
##################################################
# Professor Jefferson
# Montagem dos ambientes virtuais do kernel linux
# e entrando no ambiente chroot configurado.
##################################################

# É root?
if [ $UID -ne 0 ]; then
    echo "Precisa estar logado como rooot."
    exit 1
fi

# Montando Virtual kernel filesystem
mount -v --bind /dev $LFS/dev
mount -v --bind /dev/pts $LFS/dev/pts
mount -vt proc proc $LFS/proc
mount -vt sysfs sysfs $LFS/sys
mount -vt tmpfs tmpfs $LFS/run

# Entrando no ambiente como chroot.
chroot "$LFS" /usr/bin/env -i              \
   HOME=/root                              \
   TERM="$TERM"                            \
   PS1='\e[31;1m(LFS chroot)\e[m \u:\w\$ ' \
   PATH=/usr/bin:/usr/sbin                 \
   /bin/bash --login
