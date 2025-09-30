# Minitalk Tester

## Installation

### Preparation and execution :

1. **Compiler ton projet** : `client` et `server`.
2. **Lancer ton serveur** : `./server`
3. **Exécuter les tests** : 👇👇👇

### Dans ton projet :
```bash
git clone https://github.com/NikoStano/minitalk-tester.git
cd minitalk-tester
```

### Usage :
```bash
make [test] [PID]
```

### Tests disponibles :

- `make mandatory <PID>` - Tous les tests obligatoires (tests 1-4)
- `make `bonus`   <PID>` - Tous les tests bonus (tests 5-6)
- `make test      <PID>` - Tous les tests
- `make speed     <PID>` - Test de vitesse (1000 caractères)
- `make test1     <PID>` - Test de base
- `make test2     <PID>` - Test chaîne vide
- `make test3     <PID>` - Test gros message (20 000 chars)
- `make test4     <PID>` - Test de crash (15 messages)
- `make test5     <PID>` - Test bonus emojis
- `make test6     <PID>` - Test connexion (10 messages)
- `make help` 		     - Affiche cette aide

### Exemples :

```bash
# Test individuel
make test1 <PID>

# Tests groupés
make mandatory <PID>
make bonus <PID>

# Tous les tests
make test <PID>
```
