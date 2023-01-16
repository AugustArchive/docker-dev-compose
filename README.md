# 🛩️ Noel's Terraform Configuration
> *Terraform configuration for development of my projects*

This is a repository of the Terraform configuration for applying the software I use when I develop my projects. I used to use Docker Compose but as the list grows, the more it was hard to maintain and to fix maintenance on. It uses the Docker [Terraform provider](https://github.com/kreuzwerker/terraform-provider-docker).

This is also probably going to be the foundation that [Noelware's Infrastructure](https://noelware.org) will extend from (in a closed repository).

## Docker Images
- Elasticsearch, Kibana, Logstash, and Elastic Agent
- ClickHouse
- PostgreSQL
- Redis

## Scripts
### ./scripts/install.sh
This script will install the `./scripts/apply.sh` and `./scripts/destroy.sh` scripts into the user's bin directory (`/usr/local/bin`) as `terraform-apply` and `terraform-destroy`.

### ./scripts/apply.sh
This script will run the `terraform apply` command.

#### Environment Variables
| Name                   | Description                                                  | Examples                        |
| ---------------------- | ------------------------------------------------------------ | ------------------------------- |
| `BOOTSTRAP_CHECKS`     | If the apply script should run any bootstrap checks or not.  | `BOOTSTRAP_CHECKS=yes`          |
| `TERRAFORM_ARGS`       | List of arguments to append to the `terraform plan` command. | `TERRAFORM_ARGS=-auto-approve`  |
| `TERRAFORM_AUTO_APPLY` | Appends the `-auto-approve` argument to `terraform plan`     | `TERRAFORM_AUTO_APPLY=yes`      |

### ./scripts/destroy.sh
This script will run the `terraform destroy` command. This script uses the same [environment variables](#environment-variables).

## License
This won't have a LICENSE attached to it, so you can use this for yourself if you want to. :)
