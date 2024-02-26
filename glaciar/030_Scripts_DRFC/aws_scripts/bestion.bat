@echo off

for %%x in (glaciar racer1 racer2 racer3) do (

    @echo on

    echo:
    echo:
    echo: ....[ PROFILE: %%x ]...........................
    echo:    

    aws ec2 describe-instances --filters Name=instance-state-name,Values=running ^
        --query "Reservations[].Instances[*].{InstanceType: InstanceType, InstanceId: InstanceId, State: State.Name, Placement: Placement.AvailabilityZone }"  ^
        --output table ^
        --profile %%x

    @echo off

)


echo: para detener algo:

echo: aws ec2 stop-instances --profile profile --instance-ids id-todelete
