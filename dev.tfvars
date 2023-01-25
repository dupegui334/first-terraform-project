ami_id="ami-05fa00d4c63e32376"
instance_type = "t2.micro"
tags={
    env="dev"
}
env="dev"
sg_name="ec2-sg-tf"
ingress_rules=[
    {
        from_port = "22"
        to_port = "22"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    },
    {
        from_port = "80"
        to_port = "80"
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
]
bucket_name = "tfstate-s3-sdupegui-proj1"
acl = "private"
