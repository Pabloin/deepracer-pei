SCRIPT PARA DRFC

- TBD



export BASH_DOTS=/home/ubuntu/deepracer-on-the-spot-pei/glaciar/030_Scripts
# if bash dots
if [ -f "$BASH_DOTS/.bashDotsRc" ]; then
    echo "Hola"
    . "$BASH_DOTS/.bashDotsRc"
fi
# if bash africa
if [ -f "$BASH_DOTS/.bashRegion_Virginia" ]; then
    echo "Hola"
    . "$BASH_DOTS/.bashRegion_Virginia"
fi


# Ubuntu en .bashrc
export BASH_DRFC=~/deepracer-pei/glaciar/030_Scripts_DRFC
# if bash dots
if [ -f "$BASH_DRFC/.bashDRFC" ]; then
    echo "Hola"
    . "$BASH_DRFC/.bashDRFC"
fi

