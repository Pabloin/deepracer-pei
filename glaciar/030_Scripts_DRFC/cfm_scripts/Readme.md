Cloud Formation Scripts


## Crear un Security Group

     - cfn-DRFC-sg.yaml

          Anduvo Ok!
          Lo bueno, hace el attach a la Default Network

### Describe un Security Group (Windows y linux) - Salto de Líneas

     aws ec2 describe-security-groups \
           --group-ids sg-0bd9125ce1fe461ae     \
           --output yaml    \
           --profile pabloeze-glaciar

     aws ec2 describe-security-groups `
           --group-ids sg-0bd9125ce1fe461ae     `
           --output yaml    `
           --profile pabloeze-glaciar

### Crear un Security Group (Windows y linux) - Salto de Líneas

     aws cloudformation deploy     \
     --template ./cfn-DRFC-sg.yaml  \
     --stack-name dr-cloud-sg-stack  \
     --profile pabloeze-glaciar


     aws cloudformation deploy --template ./cfn-DRFC-sg.yaml --stack-name my-dr-sg-stack --profile pabloeze-glaciar

     aws cloudformation deploy  `
          --template ./cfn-DRFC-sg.yaml `
          --stack-name dr-cloud-sg-stack  `
          --region eu-north-1  `
          --profile racer1
     

     When entering multi-line commands, you'll use "\" for Bash 
     and "`" for PowerShell.
     
### Describe instancias prendidas (Windows y linux) - Salto de Líneas


bestion.bat

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


## Crear Grupo - User y Role

     Links Utiles:

     https://shisho.dev/dojo/providers/aws/IAM/aws-iam-group/
     https://dev.to/tiamatt/hands-on-aws-cloudformation-part-5-iam-users-groups-and-roles-5d9f

     NOTA:
     Si quiero random numero ...
     Todavía no estoy seguro ....
     Está interesante la Lambda de la respuesta aceptada de:

          https://stackoverflow.com/questions/57660653/how-to-create-some-random-or-unique-value-in-a-cloudformation-template




     aws cloudformation deploy  `
          --template ./cfn-DRFC-groups.yaml `
          --stack-name dr-cloud-group-stack  `
          --capabilities CAPABILITY_NAMED_IAM `
          --profile racer2

     aws cloudformation delete-stack `
          --stack-name dr-cloud-group-stack `
          --profile racer1


### Crear un Bucket de S3 (En WIP ... )

     aws cloudformation deploy  `
          --template ./cfn-DRFC-s3.yaml `
          --stack-name dr-cloud-s3-stack  `
          --profile racer2

     aws cloudformation delete-stack  `
          --stack-name dr-cloud-s3-stack  `
          --profile racer2

}
     aws cloudformation deploy  `
          --template ./cfn-DRFC-s3.yaml `
          --stack-name dr-cloud-s3-stack  `
          --region eu-north-1  `
          --profile racer1



### Bucket S3 copy racers sample

     aws s3 cp s3://dr-racers-config/id_rsa-racers           .home/ --profile racer1
     aws s3 cp s3://dr-racers-config/id_rsa-racers.pub       .home/ --profile racer1
     aws s3 cp s3://dr-racers-config/known_hosts_finger_git  .home/ --profile racer1

     aws s3 cp .home/id_rsa-racers          s3://dr-racer2-config/id_rsa-racers           --profile racer2
     aws s3 cp .home/id_rsa-racers.pub      s3://dr-racer2-config/id_rsa-racers.pub       --profile racer2
     aws s3 cp .home/known_hosts_finger_git s3://dr-racer2-config/known_hosts_finger_git  --profile racer2

     aws s3 cp id_rsa-racers          s3://dr-racer1-stoc-config/id_rsa-racers           --profile racer1
     aws s3 cp id_rsa-racers.pub      s3://dr-racer1-stoc-config/id_rsa-racers.pub       --profile racer1
     aws s3 cp known_hosts_finger_git s3://dr-racer1-stoc-config/known_hosts_finger_git  --profile racer1


### Crear un Launch Template (En WIP ... )


     aws ec2 describe-launch-templates   `
          --launch-template-ids lt-0347d4d94c810ac3a  `
          --profile racer1


     aws ec2 create-launch-template \
          --launch-template-name TemplateForEncryption \
          --launch-template-data file://config.json


     aws ec2 get-launch-template-data  `
             --instance-id i-0c2a2a5130bcbe147  `
             --query 'LaunchTemplateData'   `
             --output yaml `
             --profile racer1
             
aws cloudformation describe-stack-events --stack-name my-dr-groups --profile racer1



## Precio de las Instancias SPOT

aws ec2 describe-spot-price-history   `
     --instance-types m1.xlarge  `
     --start-time 2024-01-06T07:08:09  `
     --end-time   2024-01-06T08:09:10     `
     --output text `
     --region sa-east-1

g4dn.2xlarge

aws ec2 describe-spot-price-history   `
     --instance-types g4dn.2xlarge     `
     --product-descriptions "Linux/UNIX" `
     --start-time 2024-02-09T01:00:09  `
     --end-time   2024-02-10T23:59:00   `
     --output text `
     --region sa-east-1


     --
     
      `
     --region us-east-1


     Europe (Milan)	               eu-south-1
     Europe (Stockholm)	          eu-north-1
     South America (São Paulo)	sa-east-1
     Asia Pacific (Osaka)	     ap-northeast-3
     Middle East (Bahrain)	     me-south-1
     Middle East (Bahrain)	     me-south-1


Europe (Stockholm)
eu-north-1