Cloud Formation Scripts


     a) Crear un Security Group


     - cfn-DRFC-sg.yaml

          Anduvo Ok!
          Lo bueno, hace el attach a la Default Network

----------------

     aws cloudformation deploy     \
     --template ./cfn-DRFC-sg.yaml  \
     --stack-name my-dr-sg-stack     \
     --profile pabloeze-glaciar

     #Windows

     aws cloudformation deploy --template ./cfn-DRFC-sg.yaml --stack-name my-dr-sg-stack --profile pabloeze-glaciar


     aws cloudformation deploy  `
          --template ./cfn-DRFC-sg.yaml `
          --stack-name my-dr-sg--dos  `
          --profile pabloeze-glaciar
     

     When entering multi-line commands, you'll use "\" for Bash 
     and "`" for PowerShell.
     
     
----------------

     aws cloudformation deploy \
     --template /path_to_template/my-template.json \
     --stack-name my-new-stack \
     --parameter-overrides Key1=Value1 Key2=Value2 \