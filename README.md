## How to use
### 事前準備
```
sh install.sh
```

### ansibleの実行
- check syntax
```
ansible-playbook --syntax-check setup.yml -i inventory
```
- lint
```
ansible-lint -vvv
```
- dryrun
```
ansible-playbook --check --diff setup.yml -i inventory
```
- run playbook
```
ansible-playbook setup.yml -i inventory
```
