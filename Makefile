# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nistanoj <nistanoj@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/09/30 01:00:00 by nistanoj          #+#    #+#              #
#    Updated: 2025/09/30 20:32:23 by nistanoj         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Variables
PATH_TO_CLIENT = ../client
PID = $(wordlist 2,2,$(MAKECMDGOALS))

# Colors
BLACK = \033[0;30m
D_GRAY = \033[1;30m
RED = \033[0;31m
L_RED = \033[1;31m
GREEN = \033[0;32m
L_GREEN = \033[1;32m
ORANGE = \033[0;33m
YELLOW = \033[1;33m
BLUE = \033[0;34m
L_BLUE = \033[1;34m
PURPLE = \033[0;35m
L_PURPLE = \033[1;35m
CYAN = \033[0;36m
L_CYAN = \033[1;36m
L_GRAY = \033[0;37m
WHITE = \033[1;37m
NC = \033[0m

# Règles principales
.PHONY: all test mandatory bonus speed test1 test2 test3 test4 test5 test6 help

all: help

help:
	@echo "$(L_GREEN)=== Minitalk Tester ===$(NC)"
	@echo "Usage: make [test] [PID]"
	@echo ""
	@echo "Tests disponibles:"
	@echo "  $(YELLOW)make speed [PID]$(NC)      - Test de vitesse (1000 caractères)"
	@echo "  $(YELLOW)make test1 [PID]$(NC)      - Test de base"
	@echo "  $(YELLOW)make test2 [PID]$(NC)      - Test chaîne vide"
	@echo "  $(YELLOW)make test3 [PID]$(NC)      - Test gros message (20 000 chars)"
	@echo "  $(YELLOW)make test4 [PID]$(NC)      - Test de crash (15 messages)"
	@echo "  $(YELLOW)make test5 [PID]$(NC)      - Test bonus emojis"
	@echo "  $(YELLOW)make test6 [PID]$(NC)      - Test connexion (10 messages)"
	@echo "  $(YELLOW)make mandatory [PID]$(NC)  - Tous les tests obligatoires"
	@echo "  $(YELLOW)make bonus [PID]$(NC)      - Tous les tests bonus"
	@echo "  $(YELLOW)make test [PID]$(NC)       - Tous les tests"
	@echo ""
	@echo "Exemple: $(GREEN)make test1 12345$(NC)"

# Vérification du PID
check_pid:
	@if [ -z "$(PID)" ]; then \
		echo "$(RED)[ERROR] Veuillez spécifier le PID du serveur$(NC)"; \
		echo "Exemple: make test1 12345"; \
		exit 1; \
	fi
	@if ! echo "$(PID)" | grep -q '^[0-9][0-9]*$$'; then \
		echo "$(RED)[ERROR] Le PID doit être un nombre$(NC)"; \
		exit 1; \
	fi

# Tests individuels
speed: check_pid
	@echo "$(L_GREEN) [Speed test]\tTime to print 1 000 char $(NC)"
	@time $(PATH_TO_CLIENT) $(PID) "$$(cat assets/speed_test.txt)"

test1: check_pid
	@echo "$(L_GREEN) [Test 1]\tBasic test $(NC)"
	@$(PATH_TO_CLIENT) $(PID) "Hello, this is a first test"

test2: check_pid
	@echo "$(L_GREEN) [Test 2]\tEmpty string$(NC)"
	@$(PATH_TO_CLIENT) $(PID) ""

test3: check_pid
	@echo "$(L_GREEN) [Test 3]\tSending big str with 20 000 char$(NC)"
	@$(PATH_TO_CLIENT) $(PID) "$$(cat assets/big_text.txt)"

test4: check_pid
	@echo "$(L_GREEN) [Test 4]\tTrying to crash your exchange Server-Client, sending str with 3 000 char (15 times) $(NC)"
	@for i in $$(seq 1 15); do \
		echo -n "$(GREEN) [ $$i ]$(NC)"; \
		$(PATH_TO_CLIENT) $(PID) "$$(cat assets/crash_test.txt)"; \
	done

test5: check_pid
	@echo "$(L_GREEN) [Test 5]\tGuess the movie with emojis $(NC)"
	@$(PATH_TO_CLIENT) $(PID) "$$(cat assets/emojis.txt)"

test6: check_pid
	@echo "$(L_GREEN) [Test 6]\tTesting the connexion between server-client, sending str with 5 300 char (10 times)$(NC)"
	@for i in $$(seq 1 10); do \
		echo -n "$(L_GREEN) [ $$i ]$(NC)"; \
		$(PATH_TO_CLIENT) $(PID) "$$(cat assets/ascii_art.txt)"; \
	done

# Tests groupés
mandatory: check_pid test1 test2 test3 test4
	@echo "\n$(L_GREEN)Tests obligatoires terminés !$(NC)"

bonus: check_pid test5 test6
	@echo "\n$(L_GREEN)Tests bonus terminés !$(NC)"

test: check_pid speed mandatory bonus
	@echo "\n$(GREEN)Si tout s'est affiché correctement sur votre terminal serveur: Parfait, bien joué ! 💪$(NC)"

# Empêcher Make de traiter les nombres comme des cibles
%:
	@:
