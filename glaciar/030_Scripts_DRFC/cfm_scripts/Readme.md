Cloud Formation Scripts


## Crear un Security Group

     - cfn-DRFC-sg.yaml

          Anduvo Ok!
          Lo bueno, hace el attach a la Default Network

### Describe un Security Group

     aws ec2 describe-security-groups \
           --group-ids sg-0bd9125ce1fe461ae     \
           --output yaml    \
           --profile pabloeze-glaciar

     aws ec2 describe-security-groups `
           --group-ids sg-0bd9125ce1fe461ae     `
           --output yaml    `
           --profile pabloeze-glaciar

### Crear un Security Group

     aws cloudformation deploy     \
     --template ./cfn-DRFC-sg.yaml  \
     --stack-name dr-cloud-sg-stack  \
     --profile pabloeze-glaciar


     aws cloudformation deploy --template ./cfn-DRFC-sg.yaml --stack-name my-dr-sg-stack --profile pabloeze-glaciar

     aws cloudformation deploy  `
          --template ./cfn-DRFC-sg.yaml `
          --stack-name dr-cloud-sg-stack  `
          --profile racer2
     

     When entering multi-line commands, you'll use "\" for Bash 
     and "`" for PowerShell.
     
     
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
