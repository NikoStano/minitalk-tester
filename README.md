# Minitalk Tester

## Installation

`IN YOU'R PROJECT DIRECTORY`
```bash
git clone https://github.com/NikoStano/minitalk-Tester.git
cd minitalk-Tester
```

## Preparation and execution

1. **Modifier le chemin du client** : Édite la variable `PATH_TO_CLIENT` dans le Makefile avec le chemin vers ton client
2. **Compiler ton projet** : Compile tes programmes `client` et `server`
3. **Lancer ton serveur** : `./server`
4. **Exécuter les tests** : Utilise le Makefile comme ci-dessous

## Usage

```bash
make [test] [PID]
```

### Tests disponibles :

- `make help` - Affiche cette aide
- `make speed [PID]` - Test de vitesse (1000 caractères)
- `make test1 [PID]` - Test de base
- `make test2 [PID]` - Test chaîne vide
- `make test3 [PID]` - Test gros message (20 000 chars)
- `make test4 [PID]` - Test de crash (15 messages)
- `make test5 [PID]` - Test bonus emojis
- `make test6 [PID]` - Test connexion (10 messages)
- `make mandatory [PID]` - Tous les tests obligatoires (tests 1-4)
- `make bonus [PID]` - Tous les tests bonus (tests 5-6)
- `make test [PID]` - Tous les tests

### Exemples :

```bash
# Test individuel
make test1 `PID`

# Tests groupés
make mandatory `PID`
make bonus `PID`

# Tous les tests
make test `PID`
```

**Note :** Remplace `12345` par le PID de ton serveur.
```
