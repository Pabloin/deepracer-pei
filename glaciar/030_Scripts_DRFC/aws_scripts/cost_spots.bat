@echo off

REM Ejemplo
REM set "MY_DESDE=2024-02-26T00:11:28Z"
REM set "MY_HASTA=2024-02-26T01:11:31Z"

REM 1 hora
REM set MY_DESDE=(get-date (get-date).addHours(-1)  -UFormat "%Y-%m-%dT%H:%M:%SZ")
REM set MY_HASTA=(get-date -UFormat "%Y-%m-%dT%H:%M:%SZ")

REM 1 hora
For /f %%A in ('powershell -NoP -C "get-date (get-date).addHours(-1) -f \"yyyy-MM-ddTHH:mm:ssZ\""') Do Set MY_DESDE=%%A
For /f %%A in ('powershell -NoP -C "get-date                         -f \"yyyy-MM-ddTHH:mm:ssZ\""') Do Set MY_HASTA=%%A


REM MY_SPOT=g4dn.2xlarge
REM MY_SPOT=g4dn.4xlarge
REM MY_SPOT=g5.2xlarge
set "MY_SPOT=g5.4xlarge"

REM for %%x in (eu-south-1 eu-north-1 sa-east-1 ap-northeast-3 me-south-1) do (
for %%x in (eu-north-1 sa-east-1) do (

    @echo on

    echo:
    echo:
    echo: ....[ REGION: %%x - SPOT: %MY_SPOT ]...........................
    echo:    

    aws ec2 describe-spot-price-history ^
        --instance-types %MY_SPOT%       ^
        --product-descriptions "Linux/UNIX"  ^
        --start-time %MY_DESDE%   ^
        --end-time   %MY_HASTA%   ^
        --output text ^
        --region %%x  ^
        --profile glaciar

    @echo off

)


echo: para detener algo:
