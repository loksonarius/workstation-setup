# workstation-config

_Ansible playbooks to set up my development machines_

## Bootstrap

Run `./bootstrap.sh` to install the tooling needed to run the setup playbook.

## Running

### tl;dr

```bash
source venv/bin/activate
ansible-playbook setup.yaml
```

### Install Binaries

```bash
source venv/bin/activate
ansible-playbook --tags install setup.yaml
```

### Configure Tooling

```bash
source venv/bin/activate
ansible-playbook --tags configure setup.yaml
```

## Repo Layout

```
.
├── LICENSE
├── README.md
├── ansible.cfg       # Configures options used by ansible-playbook
├── bootstrap.sh      # Run this to get Ansible ready to roll
├── inventory         # Explicitly delcares and configures localhost inventory
├── requirements.txt  # Requirements file for Ansible venv
├── roles
│   └── workstation   # Contains bulk of configuration code
└── setup.yaml        # Entry point for configuration code
```

## Iteration

Testing changes for this repo should occur on a local dev machine. Currently,
most of the configuration code is specific to OSX, so that's something to keep
in mind if ever working on getting the workstation role to be OS-agnostic.

To test changes, run the `setup.yaml` playbook as described in the above usage
instructions and check to ensure whatever changes you made worked.

Aditionally, the `requirements.txt` file will install `ansible-lint` and
`yamllint` to the tools installed by pip into `venv`. Before committing code,
run the following to check for lint errors:

```bash
# Lint Ansible
ansible-lint setup.yaml roles/*

# Lint YAML
yamllint .
```

[:heart:](README.md)
