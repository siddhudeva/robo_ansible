

LOG=/tmp/ansible.log
rm -rf /tmp/ansible.log


EC2() {
component=${1}

aws ec2 describe-instances --filters Name=instance-state-name,Values=running | grep {component} &>>${LOG}
if [ "$?" -ne 0 ]; then
 aws ec2 run-instances \
    --launch-template LaunchTemplateId=lt-0078ea8f7c4e4b68e \
    '--tag-specifications' "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"
 else
    echo -e "\e[1;31m EC2 of ${component} is already exists\e[0m"
exit
fi
}