---- AWS CLI CHEATSHEET ----
============================

## EC2

### Instances

#### Get instances currently owned instances
  $ aws ec2 describe-instances


#### Get instance parameters
  $ aws ec2 describe-instances --instance-ids i-56ef2dbf

#### Create key pair named 'micro'
  $ aws ec2 create-key-pair --key-name micro

#### Get instances spot prices in us-east-1 region for m1.xlarge linux instance from yesterday 
  $ aws ec2 describe-spot-price-history --instance-types m1.xlarge --product-description "Linux/UNIX" --start-time $(date -d -1days -u +"%Y%m%dT%H0000") --region us-east-1 --output table


#### Bid for a spot instance
  # [TODO]: Create a local JSON file with all images that are allowed on MFC AWS network.
  # To find additionnal Images ID: 
  # 1. Connect on https://aws.amazon.com/marketplace
  # 2. Enter search keywords: "Ubuntu Server 14.04 LTS HVM EBS"
  # 3. Select an Image and click "Continue" Button
  # 4. Select "Manual Launch" Tab
  # 5. Select an image id according to the target region

  # Current standard are : 
  #  + Key Pair: "sshkey_webservyices"
  #  + Image ID: "ami-663a6e0c"
  #  + Security Group ID: "sg-2e503557"
  #  + Region: us-east-1

  $ IMGID="ami-663a6e0c"
  $ SGID="sg-2e503557"
  $ AWSKEYPAIR="sshkey_webservices"
  $ aws ec2 request-spot-instances \
    --region us-east-1 \
    --spot-price 0.02 \
    --launch-specification "{
        \"KeyName\": \"$AWSKEYPAIR\",
        \"ImageId\": \"$IMGID\",
        \"InstanceType\": \"m3.medium\" ,
        \"SecurityGroupIds\": [\"$SGID\"]
    }"

  # if we can't ensure that we have a fixed IP
  $ MYIP=$(dig +short myip.opendns.com @resolver1.opendns.com)
  $ aws ec2 authorize-security-group-ingress 
  --group-name digits 
  --protocol tcp 
  --port 22 
  --cidr $MYIP/32 
  --region eu-west-1

#### Watch a Spot Instance Bid
  # Watch spot instance request state
  # This command gives immediately the request-id and the instance-id when the request is fullfilled
  $ watch -n 1 "aws ec2 describe-spot-instance-requests"

#### Start/Stop instances
  $ aws ec2 stop-instances --instance-ids i-56ef2dbf
  $ aws ec2 start-instances --instance-ids i-56ef2dbf
  $ aws ec2 reboot-instances --instance-ids <instance-id>
  $ aws ec2 terminate-instances --instance-ids <instance-id>

#### Viewing console output
  $ aws ec2 get-console-output --instance-id <instance-id>

#### Using filter
aws ec2 describe-instances --filters "Name=instance-type,Values=t2.micro"
aws ec2 describe-instances --filters file://filter.json
`
  cat filter.json
  [
    {
      "Name": "instance-type",
        "Values": ["t2.micro"]
    }
  ]
`

#### Querying results see: http://jmespath.readthedocs.org/en/latest/specification.html
  $ aws ec2 describe-instances --instance-ids i-56ef2dbf --output=json \
  --query 'Reservations[0].Instances[*].{PublicIpAddress: PublicIpAddress, PrivateIpAddress: PrivateIpAddress}'
    `
    [
      {
        "PrivateIpAddress": "10.0.0.86",
          "PublicIpAddress": "54.154.78.80"
      }
    ]
    `


  $ aws ec2 describe-instances \                                                                                                                                                         ~  
    --query 'Reservations[*].Instances[*].{Id:InstanceId,Domain:PublicDnsName,Pub:PublicIpAddress,Pri:PrivateIpAddress,State:State.Name}' \ 
    --output table

  $ aws ec2 describe-instances \
    --filters "Name=vpc-id,Values=<vpc-id>" \
    --query 'Reservations[*].Instances[*].{Id:InstanceId,Pub:PublicIpAddress,Pri:PrivateIpAddress,State:State.Name}' \
    --output table


#### Checking the enhanced networking attribute 

    aws ec2 describe-instance-attribute \
     --instance-id <instance-id> \
     --attribute sriovNetSupport

### Images
** note **

  - There are so many images that queries takes much too long
  - [TODO]
    + Option 1: We should have a frequently updated local cache of images of interest (A file with a list of images ID and descriptions)
    + Option 2: We can download periodically a huge json database containing all images and query this local database with jq

#### Listing images 

    aws ec2 describe-images --image-ids <ami-id>

#### Get all 64bits Ubuntu trusty images with HVM virtualization
  $ aws ec2 describe-images --filters '[ { "Name" : "virtualization-type", "Values" : [ "hvm" ] }, { "Name" : "architecture", "Values" : [ "x86_64" ] }, { "Name" : "name", "Values" : [ "ubuntu/images/hvm*trusty*" ] }  ]'

#### Creating an AMI 

    aws ec2 create-image \
     --instance-id <instance-id> \
     --name myAMI \
     --description 'Test AMI'

### Security Groups
#### Viewing a security group 
  $ aws ec2 describe-security-groups --group-names <group-name>

### Users
#### Add a new user
  $ aws iam create-user --user-name Bob
#### Create a password for a user
  1. $ aws iam create-login-profile --generate-cli-skeleton > create-login-profile.json
  2. # complete the file `create-login-profile.json2
  3. $ aws iam create-login-profile --cli-input-json create-login-profile.json
#### Create an access key for the user
  $ aws iam create-access-key --user-name Bob
  # store in a safe & secure place the `AccessKeyId` & `SecretAccessKey` generated (they're not recoverable)
#### Add a user to an existing group
  $ aws iam add-user-to-group --user-name Bob --group-name Admins

### User Groups
#### Create a group
  $ aws iam create-group --group-name Admins
#### List existing groups
  $ aws iam list-groups
#### Attach a access policy to a group
  $ aws iam attach-group-policy --group-name Admins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess
#### List policies attached to a group
  $ aws iam list-attached-group-policies --group-name Admins

#### List content of a policy
  $ aws iam get-policy --policy-arn arn:aws:iam::123456789012:policy/MySamplePolicy


### Elastic IPs

#### Allocate Elastic IP
aws ec2 allocate-address --domain vpc

#### Show all VPC Elastic IPs
aws ec2 describe-addresses --filter Name=domain,Values=vpc

#### Release allocated IP
aws ec2 describe-addresses --public-ip 54.174.33.79 
#### to find out allocation id
aws ec2 release-address --allocation-id eipalloc-9faa1ffa

### Work with VPC

#### list all vps
  $ aws ec2 describe-vpcs
  $ aws ec2 describe-vpcs --query="Vpcs[*].[VpcId, CidrBlock]"

#### list subnets 
  $ aws ec2 describe-subnets --filters Name=vpc-id,Values=<vpc-id>

#### list route tables
  $ aws ec2 describe-route-tables --filters Name=vpc-id,Values=<vpc-id>

#### list network acls
  $ aws ec2 describe-network-acls --filters Name=vpc-id,Values=<vpc-id>

#### list vpc peering
  $ aws ec2 describe-vpc-peering-connections


#### Create new VPC with CIDR block 10.0.0.0/16
aws ec2 create-vpc --cidr-block 10.0.0.0/16


#### Add subnet to VPC
aws ec2 create-subnet --vpc-id vpc-56990b33 --cidr-block 10.0.56.0/24

#### Delete VPC
#### Delete associated resources first
aws ec2 delete-subnet --subnet-id subnet-6a4df11d
aws ec2 delete-vpc --vpc-id vpc-56990b33



## Cloudtrail

### Creating a subscription**

    aws cloudtrail create-subscription \
     --name cloudtrail-logs-ue1 \
     --s3-use-bucket cloudtrail-logs \
     --s3-prefix stage \
     --sns-new-topic cloudtrail-stage-notify-ue1

### Describing and retrieving status**

    aws cloudtrail describe-trails

    aws cloudtrail get-trail-status --name cloudtrail-logs-ue1

## IAM

### Uploading a server certificate**
    aws iam upload-server-certificate
     --server-certificate-name my.cert.com
     --certificate-body file://my.cert.com.crt
     --private-key file://my.cert.com.key
     --certificate-chain file://Verisign_Chain_CA.crt

### Listing your certificates**
    aws iam list-server-certificates



## ECS

```
aws ecs create-cluster
  --cluster-name=NAME
  --generate-cli-skeleton

aws ecs create-service
```



## ELB

### Describing

    aws elb describe-load-balancers --load-balancer-names <lb-name>
    aws elb describe-load-balancer-attributes --load-balancer-name <lb-name>
    aws elb describe-load-balancer-policies  --policy-names [ <policy-name> | ELBSecurityPolicy-2014-10 ]

### Registering and removing instances
    aws elb register-instances-with-load-balancer --load-balancer-name <lb-name> --instances <instance-id>
    aws elb deregister-instances-from-load-balancer --load-balancer-name <lb-name> --instances <instance-id>

### Viewing the health of your ELB instances
    aws elb describe-instance-health --load-balancer-name <lb-name>


## Elastic Beanstalk

### Configuration

* .elasticbeanstalk/config.yml - application config
* .elasticbeanstalk/dev-env.env.yml - environment config

```
eb config
```

See: http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/command-options.html

## ebextensions

* see <http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers.html>
* see <http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/customize-containers-ec2.html>

----

See:

* [AWS CLI](https://aws.amazon.com/cli/)
* [Documentation](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
* [All commands](http://docs.aws.amazon.com/cli/latest/reference/#available-services)



---------------

