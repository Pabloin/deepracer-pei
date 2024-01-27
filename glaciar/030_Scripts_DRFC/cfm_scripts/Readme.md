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

