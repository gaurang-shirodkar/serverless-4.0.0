variable "prefix" {
  type    = string
  default = "sysdig-fargate"
}

variable "sysdig_access_key" {
  type      = string
  default   = "aa94a5af-be2d-41ea-a9c0-73188811a4ba"
  sensitive = true
}

variable "collector_host" {
  type    = string
  default = "ingest-us2.app.sysdig.com"

}
variable "secure_api_token"{
  type = string
  default = "95da9c2e-1879-4b20-a0ee-f537caec651a"
}
