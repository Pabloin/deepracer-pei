

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
    
