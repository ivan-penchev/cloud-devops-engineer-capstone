aws cloudformation create-stack \
--stack-name "capstone-project-user" \
--template-body file://user.yaml \
--region=eu-central-1 \
--capabilities CAPABILITY_NAMED_IAM
