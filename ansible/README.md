Directory consists of a "hodge podge" of various ansible playbooks to configure your F5 infrastructure.  Unfortunately at this time
values exported by terraform are not automatically populated in these ansible playbooks.  Hoping to do this in the future.

All of these playbooks utilize F5's ansible module.  You can install the F5 modules following the directions in this link
https://clouddocs.f5.com/products/orchestration/ansible/devel/f5_modules/getting_started.html

The directory "group_vars" contains 3 yaml files which in dictionary format lays out various key value pairs to populate the
ansible playbooks.  

The "hosts" file contains 3 different groups all referencing "localhost".  All F5 ansible modules interact with the iControl REST api on the BigIP.
Not ssh.  So the ansible playbook targets the localhost (where you are running the playbook) to then make the REST call to the appropriate BigIP

Looking to improve the quality of these playbooks and make them "turn key" ready at some point.  As for now use pieces of them or in their entirety as examples of how to configure BigIP with Ansible.
 
