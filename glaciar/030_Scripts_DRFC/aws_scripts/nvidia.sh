

# Make sure you have the latest Nvidia driver for your graphics card 
# and then execute the below commands.
https://awstip.com/deepracer-for-cloud-drfc-local-setup-3c6418b2c75a




# INSTALL  DICKE GPU
# https://linuxhint.com/use-nvidia-gpu-docker-containers-ubuntu-22-04-lts/



# sudo apt install nvidia-driver-510
# lsmod | grep 





# INSTALL  NVIDIA DRRIVERS (WIP)
# https://linuxhint.com/install-nvidia-drivers-on-ubuntu/
# Table of Contents:
# 0- Checking if the Official NVIDIA GPU Drivers are Installed on Ubuntu 22.04 LTS

    lspci | egrep -i 'vga|3d|display'

    lsmod | grep nvidia

    nvidia-smi


# Otro comaddo 
#  Finding out information about your GPU
# https://www.cyberciti.biz/faq/ubuntu-linux-install-nvidia-driver-latest-proprietary-driver/

    sudo lshw -C display


# 1- Finding Out Whether You Have NVIDIA GPU Installed

    lspci | grep VGA

        ---------------------------------------------
        root@ip-172-31-26-3:~# lspci | grep VGA
        00:01.3 Non-VGA unclassified device: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
        00:03.0 VGA compatible controller: Amazon.com, Inc. Device 1111
        ---------------------------------------------    

# 2- Checking the GPU Drivers Currently Being Used

    lsmod | grep nouveau

        ---------------------------------------------
        root@ip-172-31-26-3:~# lsmod | grep nouveau
        root@ip-172-31-26-3:~#
        ---------------------------------------------


# 3- Installing NVIDIA Drivers using the Graphical User Interface

    Software & Updates 
        > Additional Drivers 
        > Using NVIDIA driver metapackage from nvidia-drivers-510 (proprietary, tested)
        > Restart

# 4- Installing NVIDIA Drivers from the Command Line

    sudo apt install nvidia-driver-510
    sudo reboot

# 5- Checking if NVIDIA Drivers are Installed Correctly

    lsmod | grep nouveau
    lsmod | grep nvidia

    --------------------------------------------------------
    ubuntu@ip-172-31-26-3:~$     lsmod | grep nvidia
    nvidia_uvm           1593344  0
    nvidia_drm             86016  0
    nvidia_modeset       1253376  1 nvidia_drm
    video                  73728  1 nvidia_modeset
    nvidia              56446976  2 nvidia_uvm,nvidia_modeset
    drm_kms_helper        249856  1 nvidia_drm
    drm                   700416  4 drm_kms_helper,nvidia,nvidia_drm
    ubuntu@ip-172-31-26-3:~$
    --------------------------------------------------------
    
    If you have installed the proprietary NVIDIA drivers, 
        you will find the NVIDIA X Server Settings app 
        in the Application Menu of Ubuntu Desktop 22.04 LTS.

# 0- Checking if the Official NVIDIA GPU Drivers are Installed on Ubuntu 22.04 LTS

    lspci | egrep -i 'vga|3d|display'

        ---------------------------------------------
        ubuntu@ip-172-31-26-3:~$ lspci | egrep -i 'vga|3d|display'
        00:01.3 Non-VGA unclassified device: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
        00:03.0 VGA compatible controller: Amazon.com, Inc. Device 1111
        00:1e.0 3D controller: NVIDIA Corporation TU104GL [Tesla T4] (rev a1)
        ---------------------------------------------
 
    3D controller: NVIDIA Corporation TU104GL [Tesla T4] (rev a1)

    https://linuxhint.com/use-nvidia-gpu-docker-containers-ubuntu-22-04-lts/#_Toc125512686
    
    In this case, I have NVIDIA GTX 1050 Ti GPU installed on my computer.

            
        ubuntu@ip-172-31-26-3:~$ nvidia-smi
        Sun Jan 28 23:09:38 2024
        +-----------------------------------------------------------------------------+
        | NVIDIA-SMI 525.147.05   Driver Version: 525.147.05   CUDA Version: 12.0     |
        |-------------------------------+----------------------+----------------------+
        | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
        | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
        |                               |                      |               MIG M. |
        |===============================+======================+======================|
        |   0  Tesla T4            Off  | 00000000:00:1E.0 Off |                    0 |
        | N/A   25C    P8    14W /  70W |      2MiB / 15360MiB |      0%      Default |
        |                               |                      |                  N/A |
        +-------------------------------+----------------------+----------------------+

        +-----------------------------------------------------------------------------+
        | Processes:                                                                  |
        |  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
        |        ID   ID                                                   Usage      |
        |=============================================================================|
        |  No running processes found                                                 |
        +-----------------------------------------------------------------------------+
        ubuntu@ip-172-31-26-3:~$

# 6- Switching to the Nouveau Drivers
# 7- Uninstalling the NVIDIA Drivers
# 8- Conclusion
# 9- References


Comandos:

    apt install -y nvidia-driver-510
    





# COMO DETECTAR y ANULAR A 
https://darren-broderick.medium.com/aws-deepracer-local-training-drfc-fd550f619410


    sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1
    sudo sysctl -w net.ipv6.conf.lo.disable_ipv6=1

    Verificar si tenemos IPv6: ifconfig
    
        ip addr
        ip addr | grep inet6
        ip -6 addr
        ifconfig | grep inet6

    Linux: Desactivar IPv6 de forma temporal

        sysctl -w net.ipv6.conf.all.disable_ipv6=1
        sysctl -w net.ipv6.conf.default.disable_ipv6=1

    Linux: Desactivar IPv6 de forma permanente

        sudo vim /etc/sysctl.conf

        net.ipv6.conf.all.disable_ipv6=1
        net.ipv6.conf.default.disable_ipv6=1



**********************************************
Update  19/09/2024

    Los comandos previos se instalaron por la midad...
    estoy siguiendo a (Ubuntu 22)
    https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-22-04


    # Setp 1:First, detect the model of your nvidia graphic card and the recommended driver. 

     ubuntu-drivers devices

        Observar que dice
                    driver   : nvidia-driver-560 - third-party non-free recommended


            ubuntu@ip-172-31-21-24:~$ ubuntu-drivers devices
            ERROR:root:aplay command not found
            == /sys/devices/pci0000:00/0000:00:1e.0 ==
            modalias : pci:v000010DEd00002237sv000010DEsd0000152Fbc03sc02i00
            vendor   : NVIDIA Corporation
            model    : GA102GL [A10G]
            driver   : nvidia-driver-560-open - third-party non-free
            driver   : nvidia-driver-535-server - distro non-free
            driver   : nvidia-driver-535-server-open - distro non-free
            driver   : nvidia-driver-560 - third-party non-free recommended
            driver   : nvidia-driver-550-open - third-party non-free
            driver   : nvidia-driver-545-open - distro non-free
            driver   : nvidia-driver-535-open - distro non-free
            driver   : nvidia-driver-555 - third-party non-free
            driver   : nvidia-driver-550 - third-party non-free
            driver   : nvidia-driver-470-server - distro non-free
            driver   : nvidia-driver-555-open - third-party non-free
            driver   : xserver-xorg-video-nouveau - distro free builtin



    # Step 2  automatico
     sudo ubuntu-drivers autoinstall

        Alternatively, install desired driver selectively 

        # Step 2 b
        ubuntu@ip-172-31-21-24:~$ sudo apt install nvidia-driver-560
            Reading package lists... Done
            Building dependency tree... Done
            Reading state information... Done
            nvidia-driver-560 is already the newest version (560.28.03-0ubuntu1).
            0 upgraded, 0 newly installed, 0 to remove and 28 not upgraded.


     sudo reboot


     # Parte II
     # Automatic Install using PPA repository to install Nvidia Beta drivers

    sudo add-apt-repository ppa:graphics-drivers/ppa
    ubuntu-drivers devices
    sudo ubuntu-drivers autoinstall
    sudo reboot

    # identify your NVIDIA VGA card.The below commands will allow you to identify your Nvidia card model:
        $  lshw -numeric -C display
        or
        $ lspci -vnn | grep VGA
        or
        $ ubuntu-drivers devices


        