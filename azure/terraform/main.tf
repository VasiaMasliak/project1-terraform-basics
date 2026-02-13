module "compute_stack" { 
    source = "./modules/compute_stack"

    project = var.project
    location = var.location
    vm_size = var.vm_size
    admin_username = var.admin_username
    public_key_path = var.public_key_path
    storage_name = var.storage_name
}