_STACK_NAME=master03


aws cloudformation deploy \
	--template-file master-03.yaml \
	--stack-name ${_STACK_NAME} \
	--capabilities CAPABILITY_IAM  \
	--profile $(cat .env | grep Profile= | cut -d '=' -f2) \
	--region $(cat .env | grep Region= | cut -d '=' -f2) \


aws ec2 --region "<region> download-key-pair" --key-name "MyKey" --query 'KeyMaterial' --output text > MyKey.pem