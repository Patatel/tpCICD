# 📦 Projet CI/CD DevOps – Déploiement API Mobile

Ce projet met en œuvre une **infrastructure CI/CD complète, scalable et résiliente** pour le déploiement d’une API destinée à une application mobile.  
Le fonctionnement de l’API n’est pas l’objectif principal : le focus est mis sur l’automatisation, la supervision, la gestion de version, et la fiabilité des déploiements.

## 🔧 Technologies utilisées

- **Azure** (VM, snapshots, disques)
- **Terraform** – Infrastructure as Code
- **Ansible** – Configuration des serveurs
- **GitHub Actions** – CI/CD
- **GitFlow** – Stratégie de branchement
- **SemVer** – Versionnement sémantique
- **Node Exporter / Prometheus** – Monitoring
- **Snapshots Azure** – Sauvegardes
- **Playbooks Rollback** – Reversion rapide

## 📁 Arborescence du projet

```
.
├── .github/
│   └── workflows/
│       ├── deploy.yml          # Déploiement principal (branche main/develop)
│       └── tag-deploy.yml      # Déploiement déclenché par tag Git
├── ansible/
│   ├── inventory.ini
│   ├── setup-api.yml           # Configuration du serveur
│   ├── monitoring.yml          # Installation Node Exporter
│   ├── rollback.yml            # Revenir à une version précédente de l’API
│   ├── snapshot.yml            # Sauvegarde disque via Azure CLI
│   ├── group_vars/
│   │   └── all.yml
│   ├── templates/
│   │   └── node_exporter.service.j2
│   └── roles/
│       └── api_server/
│           └── tasks/
│               └── main.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
├── CHANGELOG.md
└── README.md
```

## 🚀 Déploiement CI/CD

### Déploiement continu (branche)
- `develop` → déploiement sur environnement de test
- `main` → déploiement en production

### Déploiement par version (tag)
Créer un tag Git :
```bash
git tag v1.2.0
git push origin v1.2.0
```

Cela déclenche automatiquement le workflow `tag-deploy.yml`.

## 🌿 GitFlow

| Branche      | Rôle                             |
|--------------|----------------------------------|
| `main`       | Code de production stable        |
| `develop`    | Code validé prêt pour prod       |
| `feature/*`  | Nouvelles fonctionnalités        |
| `release/*`  | Préparation d’une version stable |
| `hotfix/*`   | Corrections critiques sur `main` |

## 🏷️ Versionnement

Le projet suit **SemVer** :
```
MAJOR.MINOR.PATCH
```
Historique des versions disponible dans [`CHANGELOG.md`](./CHANGELOG.md)

## 📈 Monitoring

- **Node Exporter** installé avec Ansible
- Port 9100 exposé pour Prometheus
- Compatible avec Grafana pour visualisation

## 💾 Sauvegardes

- **Snapshots Azure** créés manuellement ou via `snapshot.yml`
- Basé sur `az snapshot create` via Ansible (mode local)

## 🔁 Rollback

- Rollback **code/API** : re-deploiement d’un tag Git (`rollback.yml`)
- Rollback **infrastructure** : rollback Terraform (`terraform plan`)
- Rollback **disques Azure** : restaurer snapshot via Azure

## 🧪 Prérequis

- Azure CLI (`az login`)
- Terraform (`terraform init`)
- Ansible (`ansible-playbook`)
- SSH key configurée sur la VM
- Secrets configurés dans GitHub (`SSH_PRIVATE_KEY`)

## 📌 Commandes utiles

### Déploiement Terraform
```bash
cd terraform
terraform init
terraform apply
```

### Déploiement serveur avec Ansible
```bash
cd ansible
ansible-playbook -i inventory.ini setup-api.yml
```

### Installer monitoring
```bash
ansible-playbook -i inventory.ini monitoring.yml
```

### Snapshot manuel
```bash
ansible-playbook snapshot.yml
```

### Rollback vers version précédente
```bash
ansible-playbook rollback.yml
```
