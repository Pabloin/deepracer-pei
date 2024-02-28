@echo off

REM for %%x in (glaciar racer1 racer2 racer3) do (


REM us-east-1  - Virginia
REM us-west-2  - Oregon
REM af-south-1 - Africa
REM eu-north-1 - Estocolmo
REM sa-east-1  - San Pablo


SET "REGION_EDU=us-east-1"

for %%z in (luz bastion_PEZE_DRFC_CPU) do (

    @echo on

    echo: ....[ ACADEMY - PROFILE: %%z - region: %REGION_EDU%  ].....

    aws ec2 describe-instances --filters Name=instance-state-name,Values=running ^
        --query "Reservations[].Instances[*].{InstanceType: InstanceType, InstanceId: InstanceId, State: State.Name, Placement: Placement.AvailabilityZone }"  ^
        --output table ^
        --region  %REGION_EDU%  ^
        --profile %%z

    @echo off

)


echo: 
echo: ......................................................................
echo: Para borrar (Ejemplos):
echo: 
echo: aws ec2 stop-instances --profile bastion_PEZE_DRFC_CPU --region us-east-1 --instance-ids ID
echo: aws ec2 stop-instances --profile luz                   --region us-east-1 --instance-ids ID
echo: 


