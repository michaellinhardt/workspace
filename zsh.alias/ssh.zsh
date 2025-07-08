ssh_lightsail_restart () {
  INSTANCE_NAME="dktvnwordpress"

  echo "aws lightsail stop-instance --instance-name $INSTANCE_NAME > /dev/null"
  aws lightsail stop-instance --instance-name $INSTANCE_NAME > /dev/null
  
  # Wait until the instance is stopped
  while state=$(aws lightsail get-instance-state --instance-name $INSTANCE_NAME --query "state.name" --output text); [ "$state" != "stopped" ]; do
    echo "Waiting for instance to [stop]. Current state: $state"
    sleep 5
  done
  
  echo "aws lightsail start-instance --instance-name $INSTANCE_NAME > /dev/null"
  aws lightsail start-instance --instance-name $INSTANCE_NAME > /dev/null

  # Wait until the instance is running
  while state=$(aws lightsail get-instance-state --instance-name $INSTANCE_NAME --query "state.name" --output text); [ "$state" != "running" ]; do
    echo "Waiting for instance to [start]. Current state: $state"
    sleep 5
  done
  
  echo "Instance is running."
}

ssh_dktvnorders_restart () {
  echo "aws ec2 stop-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null"
  aws ec2 stop-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null
  
  # Wait until the instance is stopped
  while state=$(aws ec2 describe-instances --instance-ids i-0555cc0f0c5e3fffa --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "stopped" ]; do
    echo "Waiting for instance to [stop]. Current state: $state"
    sleep 5
  done
  
  echo "aws ec2 start-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null"
  aws ec2 start-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null

  # Wait until the instance is running
  while state=$(aws ec2 describe-instances --instance-ids i-0555cc0f0c5e3fffa --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "running" ]; do
    echo "Waiting for instance to [start]. Current state: $state"
    sleep 5
  done
  
  echo "Instance is running."
}

ssh_dktvnorders () { ssh -i $KEYS_DKT/ec2_dktvnorders.pem ubuntu@ec2-47-128-207-99.ap-southeast-1.compute.amazonaws.com }
ssh_lightsail () { ssh -i $KEYS_DKT/lightsail_dktvnwordpress.pem bitnami@dktvnblog.com }
