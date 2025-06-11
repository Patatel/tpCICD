# Changelog

Toutes les modifications notables de ce projet seront consignées ici.

Le format suit le versionnement sémantique : MAJOR.MINOR.PATCH

---

## [v1.2.0] - 2025-06-12
### Ajouté
- Nouvelle étape de déploiement via GitHub Actions
- Firewall Ansible automatisé (UFW)

### Corrigé
- Problème de dépendance dans le playbook Ansible

---

## [v1.1.0] - 2025-06-10
### Ajouté
- Déploiement automatique avec Ansible depuis GitHub Actions
- Structure de projet GitFlow définie

---

## [v1.0.0] - 2025-06-08
### Ajouté
- Infrastructure Terraform basique (VM Azure + VNet)
- Configuration serveur avec Ansible
- Pipeline CI/CD de base sur branche `main` et `develop`
