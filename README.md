## How to use
### 事前準備
- install homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
- install ansible
```
brew install ansible
```

### ansibleの実行
- check syntax
```
ansible-playbook --syntax-check setup.yml -i inventory
```
- run playbook
```
ansible-playbook setup.yml -i inventory
```