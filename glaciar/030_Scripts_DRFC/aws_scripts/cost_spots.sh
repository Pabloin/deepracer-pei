# TODO:

## Script para saber en que region la instancia SPOT XX está mas barata ... 


aws ec2 describe-spot-price-history   `
     --instance-types g4dn.2xlarge     `
     --product-descriptions "Linux/UNIX" `
     --start-time 2024-01-26T07:08:09  `
     --end-time   2024-01-27T08:09:10   `
     --output text