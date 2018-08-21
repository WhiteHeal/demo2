resource "vagrant_instance" "develop" {
    name = "develop"
    network = "private_network"
    box = "ubuntu/trusty64"
    ip = "192.168.123.11"
    provision = "shell"
    path = "./shell/develop.sh"
}
resource "vagrant_instance" "builder" {
    name = "builder"
    network = "private_network"
    box = "ubuntu/trusty64"
    ip = "192.168.123.12"
    provision = "shell"
    path = "./shell/builder.sh"
}
resource "vagrant_instance" "prod" {
    name = "develop"
    network = "private_network"
    box = "ubuntu/trusty64"
    ip = "192.168.123.13"
    provision = "prod"
    path = "./shell/prod.sh"
}
resource "vagrant_instance" "vault" {
    name = "vault"
    network = "private_network"
    box = "ubuntu/trusty64"
    ip = "192.168.123.14"
    provision = "prod"
    path = "./shell/vault.sh"
}

