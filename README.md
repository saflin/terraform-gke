# terraform-gke

A Terraform project that provisions VPC, Subnet and public GKE cluster on Google cloud.

## Input variables

* project_id

* region (Optional, defaults to europe-west2)

* subnet_ip_cidr_range (Optional, defaults to 10.10.0.0/24)

* gke_num_nodes (Optional, defaults to 1 node per zone)


## Output variables

* gke_cluster_name: Name of the gke cluster