output "vm_public_ip" { 
    value = module.compute_stack.vm_public_ip
}

output "storage_account_name" { 
    value = module.compute_stack.storage_account_name
}