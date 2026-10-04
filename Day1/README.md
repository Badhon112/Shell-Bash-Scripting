# Day 1

Kernel is main core of the OS, 90% of job of the OS is done by the Kernel. Kernel is a non detachable component of a OS.

1. _Monolithic Kernel_ -- Linux / Unix is monolithic Kernel, Windows 98
   - All the hardware independent Feature + all the hardware dependent, every thing will be loaded during boot time in monolithic kernel.

2. _Micro Kernel_ -- Windows 10, 11 Windows Vista, Windows XP.
   - All the hardware dependent + Some of hardware independent will be loaded during boot time micro kernel.

3. _Exo Kernel_

4. Pico Kernel

---

1. **_Normal User = ($)_**

2. **_Root User = (#)_**
   - _Root User_ is always part of OS in Linux
   - _Administrator_ user is part of windows os
   - _Linux System_ User are broadly categories into 3 Categories
     1. root (#) ==> Super User
     2. Normal User ($) ==> badhon, biswas.
     3. System users ===> ftp, mail, cups

Bash is the default shell in Linux, Whenever a user login into the system, he will get default shell and ie. bash - Bourne Again Shell.

1. _What is Shell_
   - A Shell acts as an intermediary layer between you and the computer OS kernel.
   - It takes text commands you type, translate them the system what to do
   - echo $SHELL
   - echo $0
2. _What is Bash_
   - Bash stands for Bourne Again Shell.
   - It is a specific features rich command-line interpreter created as an improved replacement for the original Unix.

As soon as user login in, he will get a default shell, and in linux we get the Bash Shell.

echo $SHELL , SHELL --- One of the shell variable

echo $0

Shell is the interface between user/application and the kernel
init is the first process which gets created after the system comes up PID of init is always 1
dispatcher process --> init process --> daemon process

bash will create an environment for execution of any command or application

---

# Linux File System Structure

**File System**

1. Root File System (Parent Directory) (Slash Partition) (/)
   - bin, sbin, home, lib, root, usr, var, proc, sys, mnt, opt, boot

2. The /bin Directory
   - All the executable Command, ls. date, who under /bin all the command which a normal and the root can executable

3. The /boot Directory
   - vmlinux image, initrd image
   - vmlinux image is the kernel image
   - initramfs - Root file system image

4. Home Directory and User
   - 65535 There can be this much user
   - 0, 999 id are allocated for the system user
   - 1000 to 65535 are can be allocated for the normal user

5.
