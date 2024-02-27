@echo off

REM for %%x in (glaciar racer1 racer2 racer3) do (



REM us-east-1  - Virginia
REM us-west-2  - Oregon
REM af-south-1 - Africa
REM eu-north-1 - Estocolmo
REM sa-east-1  - San Pablo

REM for %%r in (us-east-1 eu-south-1 eu-north-1 sa-east-1 ap-northeast-3) do (

REM for %%x in (glaciar racer1 racer2 racer3) do (
    for %%x in (glaciar racer1 racer2 racer3) do (

    @echo off

        echo:
        echo: ....[ PROFILE: %%x ].................................................

REM             virginia    oregon     africa     stock      SAO
REM for %%r in (us-east-1 us-west-2 af-south-1 eu-north-1 sa-east-1) do (
    for %%r in (us-east-1                      eu-north-1 sa-east-1) do (

        
        echo: ....[ PROFILE: %%x - region: %%r  ].....

        aws ec2 describe-instances --filters Name=instance-state-name,Values=running ^
            --query "Reservations[].Instances[*].{InstanceType: InstanceType, InstanceId: InstanceId, State: State.Name, Placement: Placement.AvailabilityZone }"  ^
            --output table ^
            --region  %%r  ^
            --profile %%x

        )

    @echo off

)


SET "REGION_EDU=us-east-1"

for %%z in (luz) do (

    @echo on

    set "REGION_EDU=us-east-1"

    echo: ....[ ACADEMY - PROFILE: %%z - region: %REGION_EDU%  ].....

    aws ec2 describe-instances --filters Name=instance-state-name,Values=running ^
        --query "Reservations[].Instances[*].{InstanceType: InstanceType, InstanceId: InstanceId, State: State.Name, Placement: Placement.AvailabilityZone }"  ^
        --output table ^
        --region  %REGION_EDU%  ^
        --profile %%z

    @echo off

)


echo: .....................................................................
echo: 
echo: Para borrar :
echo: 
echo: aws ec2 stop-instances --profile profile --instance-ids id-todelete

