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


REM ----x=4------8vCPU
REM MY_SPOT=g4dn.2xlarge
REM set "MY_SPOT=g5.2xlarge"

REM ----x=4------16vCPU
set "MY_SPOT=g4dn.4xlarge"
REM set "MY_SPOT=g5.4xlarge"

REM ----x=4-----32vCPU
REM set "MY_SPOT=g5.8xlarge"


REM us-east-1  - Virginia
REM us-west-2  - Oregon
REM af-south-1 - Africa
REM eu-north-1 - Estocolmo
REM sa-east-1  - San Pablo
REM TBD - ap-northeast-3
REM TBD - me-south-1



REM             virginia   africa        stock      SAO
REM for %%x in (us-east-1  eu-south-1 eu-north-1 sa-east-1 ap-northeast-3 me-south-1) do (
    for %%x in (us-east-1             eu-north-1 sa-east-1                          ) do (

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


