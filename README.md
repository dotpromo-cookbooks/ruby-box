dotpromo-ruby-box Cookbook
================================
Ruby lego as chef receipt

Requirements
------------

#### packages

- `users`
- `rvm`
- `apt`
- `yum-repoforge` 

Attributes
----------
None

Usage
-----
#### dotpromo-ruby-box::default

Just include `dotpromo-ruby-box` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dotpromo-ruby-box]"
  ]
}
```

And create data bag for deployer user (`data_bags/users/deployer.json`):

```json
{
  "id": "deployer",
  "comment": "Deployer user",
  "home": "/home/deployer",
  "shell": "\/bin\/bash",
  "ssh_keys": [
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Alexander Simonov <alex@simonov.me>