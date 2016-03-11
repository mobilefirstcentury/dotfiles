----- VirtualBox Commands Cheat Sheet -----
===========================================

List machines
============
VBoxManage list vms
VBoxManage list runningvms

Start & Stop machines
======================

VBoxManage startvm <id>
VBoxManage startvm <id> --type headless
VBoxManage controlvm <id> stop


Interrupt network
==================
VBoxManage controlvm <id> setlinkstate1 off


Import Virtual Machine
======================

 vboxmanage import <FILE> |    Import a virtual machine file into VirtualBox:
 vboxmanage import --options keepallmacs <FILE> | import a virtual machine without regenerating it's NIC MAC adresse

Start Virtual Machine
====================

 vboxmanage startvm <NAME> | Start one virtual machine:
 for i in <VM1> <VM2> <VM3>; do vboxmanage startvm $i; done | Start many virtual machines:

Stop Virtual Machine
====================

 vboxmanage controlvm <NAME> poweroffip | Stop one virtual machine:
 for i in <VM1> <VM2> <VM3>; do vboxmanage controlvm $i poweroff; done |    Stop many virtual machines:


Create hostonlyif Network Adapter
=================================

 vboxmanage hostonlyif create | Create host only network interface adapter:
 vboxmanage hostonlyif create ipconfig vboxnet0 --ip 192.168.122.0 |    Create host only network interface adapter with specific subnet


Remove hostonlyif Network Adapter
===================================

 vboxmanage hostonlyif remove vboxnet0 |    Remove host only network interface adapter


NAT SSH to Virtual Machine
===========================

 vboxmanage modifyvm "vm1" --natpf1 "guestssh,tcp,,22111,,22" |    NAT SSH to virtual machine:
 VboxManage modifyvm "vm1" --natpf1 delete "guestssh" |    Delete NAT SSH on virtual machine:


