#!/bin/sh
##################################################
# Professor Jefferson
# Turma 01 - Linux from Scratch
#
# Após sair do ambiente chroot MANUALMENTE
# execute este script para desmontar o ambiente
# virtual do kernel.
##################################################

umount -Rf $LFS/dev/pts
umount -Rf $LFS/{sys,proc,run,dev}
