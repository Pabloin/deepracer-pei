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
     --stack-name my-dr-sg-stack     \
     --profile pabloeze-glaciar


     aws cloudformation deploy --template ./cfn-DRFC-sg.yaml --stack-name my-dr-sg-stack --profile pabloeze-glaciar

     aws cloudformation deploy  `
          --template ./cfn-DRFC-sg.yaml `
          --stack-name my-dr-sg--tres  `
          --profile pabloeze-glaciar
     

     When entering multi-line commands, you'll use "\" for Bash 
     and "`" for PowerShell.
     
     
### Crear un Launch Template


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
          --stack-name my-dr-grupos  `
          --capabilities CAPABILITY_NAMED_IAM `
          --profile racer1

     aws cloudformation delete-stack `
          --stack-name my-dr-grupos `
          --profile racer1

     # Update (Create a Change Set)
     # No funciona bien ...


     aws cloudformation create-change-set  `
          --stack-name arn:aws:cloudformation:us-east-1:730335328884:stack/my-dr-groups/0199e100-bd71-11ee-a28a-0a32c661bb95    `
          --change-set-name SampleChangeSet2   `
          --use-previous-template    `
          --profile racer1


     aws cloudformation create-change-set  `
          --stack-name arn:aws:cloudformation:us-east-1:730335328884:stack/my-dr-groups/0199e100-bd71-11ee-a28a-0a32c661bb95    `
          --change-set-name SampleChangeSet2   `
          --template-body ./cfn-DRFC-groups.yaml `
          --profile racer1


    
    
--parameters ParameterKey="InstanceType",UsePreviousValue=true ParameterKey="KeyPairName",UsePreviousValue=true ParameterKey="Purpose",ParameterValue="production"


     aws cloudformation update-stack  `
          --template ./cfn-DRFC-groups.yaml `
          --stack-name my-dr-groups  `
          --capabilities CAPABILITY_NAMED_IAM `
          --profile racer1

  GrupoDRFC:
    Type: "AWS::IAM::Group"
    Properties:
      GroupName: AdminDRFC
      ManagedPolicyArns:
        - arn:aws:iam::aws:policy/AdministratorAccess
        - arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess
        - arn:aws:iam::aws:policy/AWSBudgetsActionsWithAWSResourceControlAccess

      Path: String
      Policies: 
        - Policy
