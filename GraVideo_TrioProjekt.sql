/*
 Navicat Premium Data Transfer

 Source Server         : projekt_edited_27.05
 Source Server Type    : MySQL
 Source Server Version : 100509
 Source Host           : localhost:3306
 Source Schema         : projekcik_git_v0806

 Target Server Type    : MySQL
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 28/06/2021 13:13:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dialogues
-- ----------------------------
DROP TABLE IF EXISTS `dialogues`;
CREATE TABLE `dialogues`  (
  `id_dialogue` int NOT NULL AUTO_INCREMENT,
  `id_npc_dialogues` int NULL DEFAULT NULL,
  `dialogue_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'właściwy, pojedynczy dialog danej postaci',
  PRIMARY KEY (`id_dialogue`) USING BTREE,
  INDEX `id_npc`(`id_npc_dialogues`) USING BTREE,
  CONSTRAINT `dialogues_ibfk_1` FOREIGN KEY (`id_npc_dialogues`) REFERENCES `npc` (`id_npc`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dialogues
-- ----------------------------
INSERT INTO `dialogues` VALUES (1, 1, 'Witaj');
INSERT INTO `dialogues` VALUES (2, 2, 'Witaj podróżniku');
INSERT INTO `dialogues` VALUES (4, 2, 'Miło mi PLAYERNAME. Zwą mnie mistrz kartofel, jestem tutaj wróżbiarzem');
INSERT INTO `dialogues` VALUES (5, 1, 'Nazywam się Mietek, jestem handlarzem');
INSERT INTO `dialogues` VALUES (6, 3, 'Pozdrawiam cię');
INSERT INTO `dialogues` VALUES (7, 3, 'Co sprowadza cię w te leśne ostępy');

-- ----------------------------
-- Table structure for enemies
-- ----------------------------
DROP TABLE IF EXISTS `enemies`;
CREATE TABLE `enemies`  (
  `id_enemy` int NOT NULL AUTO_INCREMENT,
  `id_enemy_location` int NULL DEFAULT NULL,
  `enemy_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enemy_attack_damage` int NULL DEFAULT NULL,
  `enemy_attack_speed` float NULL DEFAULT NULL,
  `enemy_attack_range` int NULL DEFAULT NULL,
  `enemy_max_hp` int NULL DEFAULT NULL,
  `enemy_hp` int NULL DEFAULT NULL,
  `enemy_mvm_speed` int NULL DEFAULT NULL,
  `enemy_hitbox_radius` int NULL DEFAULT NULL COMMENT 'wstęnie ustalamy, że przeciwnicy są kołami',
  `enemy_image` binary(255) NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'obrazek reprezentujący przeciwnika',
  `enemy_exp` int NULL DEFAULT NULL COMMENT 'ilość doświadczenia, którą otrzyma nasz bohater po śmierci wroga',
  PRIMARY KEY (`id_enemy`) USING BTREE,
  INDEX `enemies_ibfk_1`(`id_enemy_location`) USING BTREE,
  CONSTRAINT `enemies_ibfk_1` FOREIGN KEY (`id_enemy_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of enemies
-- ----------------------------
INSERT INTO `enemies` VALUES (1, 1, 'Wilk', 10, 5, 5, 18, 18, 20, 10, NULL, 15);
INSERT INTO `enemies` VALUES (2, 1, 'Niedźwiedź górski', 25, 5, 7, 45, 45, 15, 15, NULL, 40);
INSERT INTO `enemies` VALUES (3, 1, 'Pijawka', 5, 3, 1, 1, 1, 0, 5, NULL, 5);
INSERT INTO `enemies` VALUES (4, 1, 'Goblin bandyta', 10, 6, 15, 12, 12, 17, 5, NULL, 20);
INSERT INTO `enemies` VALUES (5, 2, 'Żmija', 35, 5, 7, 10, 10, 13, 5, NULL, 45);
INSERT INTO `enemies` VALUES (6, 2, 'Wielka ropucha', 18, 5, 15, 45, 45, 25, 15, NULL, 65);
INSERT INTO `enemies` VALUES (7, 2, 'Skałogator', 15, 5, 5, 80, 110, 20, 10, NULL, 55);
INSERT INTO `enemies` VALUES (8, 2, 'Bandyta', 18, 8, 12, 25, 25, 13, 10, NULL, 50);
INSERT INTO `enemies` VALUES (9, 3, 'Kot widmo', 45, 10, 7, 40, 40, 22, 10, NULL, 70);
INSERT INTO `enemies` VALUES (10, 3, 'Drzewołaz nunu', 90, 5, 5, 15, 15, 13, 5, NULL, 75);
INSERT INTO `enemies` VALUES (11, 3, 'Zdziczały szaman', 40, 7, 12, 30, 30, 15, 10, NULL, 70);

-- ----------------------------
-- Table structure for inventories
-- ----------------------------
DROP TABLE IF EXISTS `inventories`;
CREATE TABLE `inventories`  (
  `id_inventory` int NOT NULL AUTO_INCREMENT,
  `id_npc` int NULL DEFAULT NULL,
  `id_enemy` int NULL DEFAULT NULL,
  `id_player` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_inventory`) USING BTREE,
  INDEX `id_npc`(`id_npc`) USING BTREE,
  INDEX `id_enemy`(`id_enemy`) USING BTREE,
  INDEX `id_inventory`(`id_inventory`) USING BTREE,
  INDEX `inventories_ibfk_3`(`id_player`) USING BTREE,
  CONSTRAINT `inventories_ibfk_1` FOREIGN KEY (`id_npc`) REFERENCES `npc` (`id_npc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventories_ibfk_2` FOREIGN KEY (`id_enemy`) REFERENCES `enemies` (`id_enemy`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `inventories_ibfk_3` FOREIGN KEY (`id_player`) REFERENCES `player` (`id_player`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of inventories
-- ----------------------------
INSERT INTO `inventories` VALUES (1, NULL, NULL, 2);
INSERT INTO `inventories` VALUES (2, NULL, NULL, 1);
INSERT INTO `inventories` VALUES (3, NULL, NULL, 3);
INSERT INTO `inventories` VALUES (4, 1, NULL, NULL);
INSERT INTO `inventories` VALUES (5, 2, NULL, NULL);
INSERT INTO `inventories` VALUES (6, 3, NULL, NULL);
INSERT INTO `inventories` VALUES (7, NULL, 1, NULL);
INSERT INTO `inventories` VALUES (8, NULL, 2, NULL);
INSERT INTO `inventories` VALUES (9, NULL, 3, NULL);

-- ----------------------------
-- Table structure for items
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items`  (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `item_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'equipment lub consumable',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_drop_chance` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_item`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items
-- ----------------------------
INSERT INTO `items` VALUES (1, '1', 'Kozik bezdomnego', NULL);
INSERT INTO `items` VALUES (2, '1', 'Proca bezdomnego', NULL);
INSERT INTO `items` VALUES (3, '1', 'Kij bezdomnego', NULL);
INSERT INTO `items` VALUES (4, '1', 'Marny sztylet', NULL);
INSERT INTO `items` VALUES (5, '1', 'Proca zawadiaki', NULL);
INSERT INTO `items` VALUES (6, '1', 'Laska biedaka', NULL);
INSERT INTO `items` VALUES (7, '2', 'Stara czapa', NULL);
INSERT INTO `items` VALUES (8, '6', 'Buty kmiota', NULL);
INSERT INTO `items` VALUES (9, '8', 'Suche jabłko', NULL);
INSERT INTO `items` VALUES (10, '4', 'Rękawice po dziadku', NULL);
INSERT INTO `items` VALUES (11, '9', 'Wilcza skóra', 0.3);
INSERT INTO `items` VALUES (12, '8', 'Soczyste jabłko', NULL);
INSERT INTO `items` VALUES (13, '8', 'Bukłak wody źródlanej', NULL);
INSERT INTO `items` VALUES (14, '1', 'Pordzewiały siepacz', NULL);
INSERT INTO `items` VALUES (15, '8', 'Owoc kameleona', 0.02);

-- ----------------------------
-- Table structure for items_consumables
-- ----------------------------
DROP TABLE IF EXISTS `items_consumables`;
CREATE TABLE `items_consumables`  (
  `id_item_consumable` int NOT NULL AUTO_INCREMENT,
  `id_item` int NULL DEFAULT NULL,
  `item_consumable_gain_stat` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `item_consumable_gain_value` int NULL DEFAULT NULL,
  `item_consumable_gain_value_float` float NULL DEFAULT NULL,
  PRIMARY KEY (`id_item_consumable`) USING BTREE,
  INDEX `id_item`(`id_item`) USING BTREE,
  CONSTRAINT `items_consumables_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items_consumables
-- ----------------------------
INSERT INTO `items_consumables` VALUES (1, 9, 'hp', 7, NULL);
INSERT INTO `items_consumables` VALUES (2, 12, 'hp', 15, NULL);
INSERT INTO `items_consumables` VALUES (3, 13, 'mana', 25, NULL);
INSERT INTO `items_consumables` VALUES (4, 15, 'hp', 0, 0);

-- ----------------------------
-- Table structure for items_equipment
-- ----------------------------
DROP TABLE IF EXISTS `items_equipment`;
CREATE TABLE `items_equipment`  (
  `id_items_equipment` int NOT NULL AUTO_INCREMENT,
  `id_item` int NULL DEFAULT NULL,
  `item_hero_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wymagana klasa do założenia przedmiotu: wojownik, mag, łowca',
  `item_slot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'głowa, ręce, ramiona itd.',
  `item_level` int NULL DEFAULT NULL COMMENT 'Wymagany poziom postaci bohatera, by ten mógł przedmiot założyć',
  `item_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ścieżka do obrazka reprezentującego przedmiot',
  `item_str` int NULL DEFAULT NULL COMMENT 'ilość siły, którą daje przedmiot',
  `item_agi` int NULL DEFAULT NULL COMMENT 'ilość zręczności, którą daje przedmiot',
  `item_int` int NULL DEFAULT NULL COMMENT 'ilość inteligencji, którą daje przedmiot',
  `item_armor` decimal(12, 0) NULL DEFAULT NULL COMMENT 'procent redukcji obrażeń fizycznych',
  `item_magic_resist` decimal(12, 0) NULL DEFAULT NULL COMMENT 'procent redukcji obrażeń magicznych',
  `item_mvm_speed` decimal(12, 0) NULL DEFAULT NULL COMMENT 'procent, w jaki wpływa przedmiot na prędkość ruchu postaci',
  PRIMARY KEY (`id_items_equipment`) USING BTREE,
  INDEX `id_item`(`id_item`) USING BTREE,
  CONSTRAINT `items_equipment_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items_equipment
-- ----------------------------
INSERT INTO `items_equipment` VALUES (1, 1, 'Gladiator', '1', 1, NULL, 1, 0, 0, 1, 0, 0);
INSERT INTO `items_equipment` VALUES (2, 2, 'Łowca', '1', 1, NULL, 0, 1, 0, 0, 0, 1);
INSERT INTO `items_equipment` VALUES (3, 3, 'Czarownik', '1', 1, NULL, 0, 0, 1, 0, 1, 0);
INSERT INTO `items_equipment` VALUES (4, 14, 'Gladiator', '1', 4, NULL, 3, 1, 0, 1, 0, 0);

-- ----------------------------
-- Table structure for items_to_inventories
-- ----------------------------
DROP TABLE IF EXISTS `items_to_inventories`;
CREATE TABLE `items_to_inventories`  (
  `id_inventory` int NOT NULL,
  `id_item` int NULL DEFAULT NULL,
  `item_inventory_count` int NULL DEFAULT NULL,
  INDEX `id_inventory`(`id_inventory`) USING BTREE,
  INDEX `id_item`(`id_item`) USING BTREE,
  CONSTRAINT `items_to_inventories_ibfk_1` FOREIGN KEY (`id_inventory`) REFERENCES `inventories` (`id_inventory`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `items_to_inventories_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of items_to_inventories
-- ----------------------------
INSERT INTO `items_to_inventories` VALUES (1, 1, 1);
INSERT INTO `items_to_inventories` VALUES (2, 2, 1);
INSERT INTO `items_to_inventories` VALUES (3, 3, 1);
INSERT INTO `items_to_inventories` VALUES (4, 4, 1);
INSERT INTO `items_to_inventories` VALUES (4, 5, 1);
INSERT INTO `items_to_inventories` VALUES (1, 9, 1);
INSERT INTO `items_to_inventories` VALUES (6, 10, 1);
INSERT INTO `items_to_inventories` VALUES (7, 11, 2);
INSERT INTO `items_to_inventories` VALUES (1, 14, 1);
INSERT INTO `items_to_inventories` VALUES (4, 1, 0);
INSERT INTO `items_to_inventories` VALUES (4, 3, 0);
INSERT INTO `items_to_inventories` VALUES (4, 2, 0);
INSERT INTO `items_to_inventories` VALUES (5, 6, 1);
INSERT INTO `items_to_inventories` VALUES (4, 7, 1);
INSERT INTO `items_to_inventories` VALUES (4, 8, 1);
INSERT INTO `items_to_inventories` VALUES (2, 15, 995);

-- ----------------------------
-- Table structure for locations
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations`  (
  `id_location` int NOT NULL AUTO_INCREMENT,
  `location_lvl_required` int NULL DEFAULT NULL COMMENT 'poziom, który gracz musi mieć by wejść do lokacji',
  `location_image` binary(255) NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'obrazek reprezentujący tło lokacji',
  PRIMARY KEY (`id_location`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of locations
-- ----------------------------
INSERT INTO `locations` VALUES (1, 1, NULL);
INSERT INTO `locations` VALUES (2, 5, NULL);
INSERT INTO `locations` VALUES (3, 10, NULL);
INSERT INTO `locations` VALUES (4, 15, NULL);

-- ----------------------------
-- Table structure for npc
-- ----------------------------
DROP TABLE IF EXISTS `npc`;
CREATE TABLE `npc`  (
  `id_npc` int NOT NULL AUTO_INCREMENT,
  `npc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `npc_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'np. kowal, kupiec, mędrzec itp.',
  `npc_familiarity` int NULL DEFAULT NULL COMMENT 'ogólny stopień zaawansowania znajomości z danym NPC',
  `npc_image` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ścieżka do obrazka reprezentującego postać w grze',
  `npc_coordinates` point NULL COMMENT 'czy to działa tak jak myślimy ?',
  `id_npc_location` int NULL DEFAULT NULL,
  `npc_coord_x` int UNSIGNED NULL DEFAULT NULL,
  `npc_coord_y` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_npc`) USING BTREE,
  INDEX `npc_ibfk_1`(`id_npc_location`) USING BTREE,
  CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`id_npc_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of npc
-- ----------------------------
INSERT INTO `npc` VALUES (1, 'Mietek', NULL, 0, NULL, NULL, 1, 1000, 600);
INSERT INTO `npc` VALUES (2, 'Kartofel', NULL, 9, NULL, NULL, 1, 1900, 600);
INSERT INTO `npc` VALUES (3, 'Jurand', NULL, 0, NULL, NULL, 2, 250, 600);

-- ----------------------------
-- Table structure for platforms
-- ----------------------------
DROP TABLE IF EXISTS `platforms`;
CREATE TABLE `platforms`  (
  `id_platform` int NOT NULL AUTO_INCREMENT COMMENT 'przyjmujemy kształt jako prostokąta',
  `id_location` int NULL DEFAULT NULL,
  `platform_dimension_x` int NULL DEFAULT 256,
  `platform_dimension_y` int NULL DEFAULT 32,
  `platform_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'ground' COMMENT 'np. błotna spowalnia, magmowa pali itp. // ground = podstawowa',
  `platform_image` binary(255) NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' COMMENT 'obrazek reprezentujący platformę',
  `platform_coord_x` int UNSIGNED NULL DEFAULT 0,
  `platform_coord_y` int UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id_platform`) USING BTREE,
  INDEX `id_location`(`id_location`) USING BTREE,
  CONSTRAINT `platforms_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of platforms
-- ----------------------------
INSERT INTO `platforms` VALUES (1, 1, 4096, 600, 'ground', NULL, 2048, 300);
INSERT INTO `platforms` VALUES (2, 2, 512, 600, 'grass', NULL, 120, 300);
INSERT INTO `platforms` VALUES (3, 2, 256, 32, 'grass', NULL, 600, 150);
INSERT INTO `platforms` VALUES (4, 2, 256, 32, 'ground', 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 950, 200);
INSERT INTO `platforms` VALUES (5, 2, 256, 32, 'ground', 0x000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 1300, 250);

-- ----------------------------
-- Table structure for player
-- ----------------------------
DROP TABLE IF EXISTS `player`;
CREATE TABLE `player`  (
  `id_player` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nazwa bohatera wybrana przez gracza',
  `player_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wojownik, mag lub łowca',
  `player_level` int NULL DEFAULT NULL,
  `player_exp` int NULL DEFAULT NULL COMMENT 'obecne doświadczenie postaci, ilość potrzebna do awansowania na wyższy poziom, będzie wyliczana z jakiegoś wzoru',
  `player_int` int NULL DEFAULT NULL COMMENT 'inteligencja postaci',
  `player_agi` int NULL DEFAULT NULL COMMENT 'zwinność postaci',
  `player_str` int NULL DEFAULT NULL COMMENT 'siła postaci',
  `player_hp` int NULL DEFAULT NULL COMMENT 'w trakcie gry ta wartość będzie przechowywana w pamięci podręcznej, a ładowana do bazy danych przy zapisie stanu gry',
  `player_mana` int NULL DEFAULT NULL COMMENT 'to co wyżej',
  `player_coordinates` point NULL COMMENT 'koordynanty gracza w danej lokacji',
  `id_location` int NULL DEFAULT NULL COMMENT 'obecna lokacja gracza (NAZWA TAKA SAMA JAK W TABELI LOKACJE ???)',
  `player_max_hp` int GENERATED ALWAYS AS (`player_level` * 2 + `player_str` * 2) VIRTUAL NULL,
  `player_max_mana` int GENERATED ALWAYS AS (`player_level` * 2 + `player_int` * 2) VIRTUAL NULL,
  `player_play_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_player`) USING BTREE,
  INDEX `player_ibfk_1`(`id_location`) USING BTREE,
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of player
-- ----------------------------
INSERT INTO `player` VALUES (1, 'pabloo', 'Łowca', 4, 56, 13, 33, 19, 20, 40, NULL, 1, DEFAULT, DEFAULT, 2452);
INSERT INTO `player` VALUES (2, 'pablo', 'Gladiator', 8, 30, 15, 28, 47, 65, 46, NULL, 2, DEFAULT, DEFAULT, 6720);
INSERT INTO `player` VALUES (3, 'Klejnot Nilu', 'Czarownik', 10, 76, 50, 12, 18, 45, 116, NULL, 3, DEFAULT, DEFAULT, 8741);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id_session` int NOT NULL AUTO_INCREMENT,
  `id_player` int NOT NULL,
  `session_start` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `session_end` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id_session`, `session_start`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic PARTITION BY RANGE (year(`session_start`))
PARTITIONS 5
(PARTITION `p_do_2018` VALUES LESS THAN (2019) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_2019` VALUES LESS THAN (2020) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_2020` VALUES LESS THAN (2021) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_2021` VALUES LESS THAN (2022) ENGINE = InnoDB MAX_ROWS = 0 MIN_ROWS = 0 ,
PARTITION `p_max` VALUES LESS THAN (MAXVALUE) ENGINE = InnoDB) MAX_ROWS = 0 MIN_ROWS = 0 )
;

-- ----------------------------
-- Records of sessions
-- ----------------------------

-- ----------------------------
-- Table structure for spawn_points
-- ----------------------------
DROP TABLE IF EXISTS `spawn_points`;
CREATE TABLE `spawn_points`  (
  `id_spawn_point` int NOT NULL AUTO_INCREMENT,
  `id_location` int NULL DEFAULT NULL,
  `id_enemy` int NULL DEFAULT NULL,
  `spawn_point_enemy_is_alive` tinyint NOT NULL DEFAULT 0,
  `spawn_point_enemy_death_timer` int UNSIGNED NULL DEFAULT NULL,
  `spawn_point_enemy_coord_x` int UNSIGNED NULL DEFAULT NULL,
  `spawn_point_enemy_coord_y` int UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id_spawn_point`) USING BTREE,
  INDEX `id_location`(`id_location`) USING BTREE,
  CONSTRAINT `spawn_points_ibfk_1` FOREIGN KEY (`id_location`) REFERENCES `locations` (`id_location`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spawn_points
-- ----------------------------
INSERT INTO `spawn_points` VALUES (2, 2, 2, 0, 50, 1200, 800);
INSERT INTO `spawn_points` VALUES (3, 2, 3, 0, 80, 2000, 800);

-- ----------------------------
-- View structure for excepttt
-- ----------------------------
DROP VIEW IF EXISTS `excepttt`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `excepttt` AS select `xd2`.`id_item` AS `id_item`,`xd2`.`item_type` AS `item_type`,`xd2`.`item_name` AS `item_name` from (select `projekcik_git_v0806`.`items_to_inventories`.`id_inventory` AS `id_inventory`,`projekcik_git_v0806`.`items_to_inventories`.`id_item` AS `id_item`,`projekcik_git_v0806`.`items_to_inventories`.`item_inventory_count` AS `item_inventory_count`,`projekcik_git_v0806`.`items`.`item_type` AS `item_type`,`projekcik_git_v0806`.`items`.`item_name` AS `item_name`,`projekcik_git_v0806`.`items`.`item_drop_chance` AS `item_drop_chance`,`projekcik_git_v0806`.`inventories`.`id_npc` AS `id_npc`,`projekcik_git_v0806`.`inventories`.`id_enemy` AS `id_enemy`,`projekcik_git_v0806`.`inventories`.`id_player` AS `id_player` from ((`projekcik_git_v0806`.`items_to_inventories` join `projekcik_git_v0806`.`items` on(`projekcik_git_v0806`.`items_to_inventories`.`id_item` = `projekcik_git_v0806`.`items`.`id_item`)) join `projekcik_git_v0806`.`inventories` on(`projekcik_git_v0806`.`items_to_inventories`.`id_inventory` = `projekcik_git_v0806`.`inventories`.`id_inventory`)) where `projekcik_git_v0806`.`inventories`.`id_npc` is not null) `xd2` except select `xd`.`id_item` AS `id_item`,`xd`.`item_type` AS `item_type`,`xd`.`item_name` AS `item_name` from (select `projekcik_git_v0806`.`items_to_inventories`.`id_inventory` AS `id_inventory`,`projekcik_git_v0806`.`items_to_inventories`.`id_item` AS `id_item`,`projekcik_git_v0806`.`items_to_inventories`.`item_inventory_count` AS `item_inventory_count`,`projekcik_git_v0806`.`items`.`item_type` AS `item_type`,`projekcik_git_v0806`.`items`.`item_name` AS `item_name`,`projekcik_git_v0806`.`items`.`item_drop_chance` AS `item_drop_chance`,`projekcik_git_v0806`.`inventories`.`id_npc` AS `id_npc`,`projekcik_git_v0806`.`inventories`.`id_enemy` AS `id_enemy`,`projekcik_git_v0806`.`inventories`.`id_player` AS `id_player` from ((`projekcik_git_v0806`.`items_to_inventories` join `projekcik_git_v0806`.`items` on(`projekcik_git_v0806`.`items_to_inventories`.`id_item` = `projekcik_git_v0806`.`items`.`id_item`)) join `projekcik_git_v0806`.`inventories` on(`projekcik_git_v0806`.`items_to_inventories`.`id_inventory` = `projekcik_git_v0806`.`inventories`.`id_inventory`)) where `projekcik_git_v0806`.`inventories`.`id_player` = 3) `xd`;

-- ----------------------------
-- View structure for interrr
-- ----------------------------
DROP VIEW IF EXISTS `interrr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `interrr` AS select id_item, item_type, item_name from (select * from items_to_inventories natural join items natural join inventories where inventories.id_player is not null) xd intersect select id_item, item_type, item_name from (select * from items_to_inventories natural join items natural join inventories where inventories.id_npc is not null) xd2 ;

-- ----------------------------
-- View structure for max_funct
-- ----------------------------
DROP VIEW IF EXISTS `max_funct`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `max_funct` AS select MAX(enemy_exp) from enemies ;

-- ----------------------------
-- View structure for replaceee
-- ----------------------------
DROP VIEW IF EXISTS `replaceee`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `replaceee` AS select id_dialogue, replace(dialogue_value, 'PLAYERNAME', 'Klejnot Nilu') from dialogues where id_dialogue = 4 ;

-- ----------------------------
-- View structure for sec_time
-- ----------------------------
DROP VIEW IF EXISTS `sec_time`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `sec_time` AS select player_name, SEC_TO_TIME(player_play_time) from player ;

-- ----------------------------
-- View structure for unionee
-- ----------------------------
DROP VIEW IF EXISTS `unionee`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `unionee` AS SELECT npc_name as all_characters_alive  FROM npc
UNION
SELECT player_name FROM player
order by all_characters_alive ;

-- ----------------------------
-- View structure for v2_group_by2_30_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v2_group_by2_30_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v2_group_by2_30_kwietnia` AS select id_location, count(id_location) as liczność_platform_w_lokacji from platforms group by id_location having liczność_platform_w_lokacji > 3 ;

-- ----------------------------
-- View structure for v_enemies_1
-- ----------------------------
DROP VIEW IF EXISTS `v_enemies_1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_enemies_1` AS select * from enemies where id_enemy_location = 1 ;

-- ----------------------------
-- View structure for v_exists_17_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v_exists_17_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_exists_17_kwietnia` AS SELECT
    id_location 
FROM
    locations 
WHERE
    EXISTS ( SELECT 1 FROM npc WHERE npc.id_npc_location = locations.id_location ) ;

-- ----------------------------
-- View structure for v_group_by_30_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v_group_by_30_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_group_by_30_kwietnia` AS select item_hero_class, count(item_hero_class) as licznosc_ekwipunku_dla_klas from items_equipment group by item_hero_class ;

-- ----------------------------
-- View structure for v_group_by_having_30_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v_group_by_having_30_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_group_by_having_30_kwietnia` AS SELECT id_npc_dialogues, sum(LENGTH(dialogue_value) - LENGTH(REPLACE(REPLACE(dialogue_value,"\n","")," ","")) + 1) as liczba_slow from dialogues group by id_npc_dialogues having liczba_slow > 7 ;

-- ----------------------------
-- View structure for v_having_30_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v_having_30_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_having_30_kwietnia` AS SELECT count(enemy_name), enemy_attack_speed
FROM enemies GROUP BY enemy_attack_speed
HAVING enemy_attack_speed > 5 ;

-- ----------------------------
-- View structure for v_in_17_kwietnia
-- ----------------------------
DROP VIEW IF EXISTS `v_in_17_kwietnia`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_in_17_kwietnia` AS select id_player, player_name from player where id_location in (2,3,4,5) ;

-- ----------------------------
-- View structure for v_items_łowca
-- ----------------------------
DROP VIEW IF EXISTS `v_items_łowca`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_items_łowca` AS select `items_equipment`.`id_items_equipment` AS `id_items_equipment`,`items_equipment`.`id_item` AS `id_item`,`items_equipment`.`item_hero_class` AS `item_hero_class`,`items_equipment`.`item_slot` AS `item_slot`,`items_equipment`.`item_level` AS `item_level`,`items_equipment`.`item_image` AS `item_image`,`items_equipment`.`item_str` AS `item_str`,`items_equipment`.`item_agi` AS `item_agi`,`items_equipment`.`item_int` AS `item_int`,`items_equipment`.`item_armor` AS `item_armor`,`items_equipment`.`item_magic_resist` AS `item_magic_resist`,`items_equipment`.`item_mvm_speed` AS `item_mvm_speed` from `items_equipment` where `items_equipment`.`item_hero_class` = 'Łowca';

-- ----------------------------
-- View structure for v_names_consumables
-- ----------------------------
DROP VIEW IF EXISTS `v_names_consumables`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_names_consumables` AS SELECT
    items.item_name, 
    items_consumables.*
FROM
    items
    INNER JOIN
    items_consumables
    ON 
        items.id_item = items_consumables.id_item ;

-- ----------------------------
-- View structure for v_names_enemy_spawns
-- ----------------------------
DROP VIEW IF EXISTS `v_names_enemy_spawns`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_names_enemy_spawns` AS SELECT
    enemies.enemy_name, 
    spawn_points.*
FROM
    enemies
    INNER JOIN
    spawn_points
    ON 
        enemies.id_enemy = spawn_points.id_enemy ;

-- ----------------------------
-- View structure for v_names_equipment
-- ----------------------------
DROP VIEW IF EXISTS `v_names_equipment`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_names_equipment` AS SELECT
    items.item_name, 
    items_equipment.*
FROM
    items
    INNER JOIN
    items_equipment
    ON 
        items.id_item = items_equipment.id_item ;

-- ----------------------------
-- View structure for v_npc_and_dialogues
-- ----------------------------
DROP VIEW IF EXISTS `v_npc_and_dialogues`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_npc_and_dialogues` AS select npc.npc_name, dialogues.dialogue_value from npc right join dialogues on npc.id_npc = dialogues.id_npc_dialogues ;

-- ----------------------------
-- View structure for v_platforms_2
-- ----------------------------
DROP VIEW IF EXISTS `v_platforms_2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_platforms_2` AS SELECT
    * 
FROM
    platforms 
WHERE
    id_location = 2 ;

-- ----------------------------
-- Procedure structure for change_player_name_via_item
-- ----------------------------
DROP PROCEDURE IF EXISTS `change_player_name_via_item`;
delimiter ;;
CREATE PROCEDURE `change_player_name_via_item`(IN `idp` int,IN `id_name_change_item` int,IN `new_name` varchar(255))
BEGIN
	#źródło do poniższego: https://stackoverflow.com/questions/9974325/mysql-transaction-within-a-stored-procedure
	DECLARE EXIT HANDLER FOR SQLEXCEPTION 
        BEGIN
            ROLLBACK;
            RESIGNAL;
        END;
			
				select id_inventory into @idp_inv from inventories where id_player = idp;
				
	start TRANSACTION;
select * from items_to_inventories WHERE id_inventory = @idp_inv for UPDATE;
select * from npc for UPDATE;
select * from player where id_player = idp for UPDATE;

update items_to_inventories 
set item_inventory_count := item_inventory_count - 1 where id_inventory = @idp_inv and id_item = id_name_change_item;

UPDATE player SET player.player_name=new_name WHERE player.id_player=idp;

update npc set npc.npc_familiarity = npc.npc_familiarity -1 where npc.npc_familiarity > 0;

commit;

END
;;
delimiter ;

-- ----------------------------
-- Function structure for suma_rekordow
-- ----------------------------
DROP FUNCTION IF EXISTS `suma_rekordow`;
delimiter ;;
CREATE FUNCTION `suma_rekordow`(ilosc int)
 RETURNS int(11)
BEGIN
DECLARE suma INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR NOT FOUND RETURN suma;
LOOP
FETCH GROUP NEXT ROW;
IF ilosc THEN
SET suma = suma+ilosc;
END IF;
END LOOP;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for suma_rekordów_z_floatem
-- ----------------------------
DROP FUNCTION IF EXISTS `suma_rekordów_z_floatem`;
delimiter ;;
CREATE FUNCTION `suma_rekordów_z_floatem`(ilosc float)
 RETURNS int(11)
BEGIN
DECLARE suma INT DEFAULT 0;
DECLARE CONTINUE HANDLER FOR NOT FOUND RETURN suma;
LOOP
FETCH GROUP NEXT ROW;

IF  (cast(ilosc as INTEGER)   != ilosc) THEN
SET suma = suma+1;
END IF;

END LOOP;
END
;;
delimiter ;

-- ----------------------------
-- Event structure for new_partition
-- ----------------------------
DROP EVENT IF EXISTS `new_partition`;
delimiter ;;
CREATE EVENT `new_partition`
ON SCHEDULE
EVERY '1' YEAR STARTS '2021-12-25 02:00:00'
ON COMPLETION PRESERVE
DO begin
set @nowy_rok=year(now())+1;
set @sql = concat("alter table sessions reorganize partition p_max into\n(partition p_", @nowy_rok, " values less than (", (@nowy_rok+1) ,"), pa\nrtition p_max values less than maxvalue);");
prepare st1 from @sql;
execute st1;
deallocate prepare st1;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table enemies
-- ----------------------------
DROP TRIGGER IF EXISTS `max_hp`;
delimiter ;;
CREATE TRIGGER `max_hp` BEFORE UPDATE ON `enemies` FOR EACH ROW trigger1:
begin
if (NEW.enemy_hp <0) then
set new.enemy_hp = 0;
elseif NEW.enemy_hp >new.enemy_max_hp  then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aktualne hp nie moze byc wieksze od max_hp';
else
set NEW.enemy_hp = NEW.enemy_hp +0;
LEAVE trigger1;
end if;
end
;
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table enemies
-- ----------------------------
DROP TRIGGER IF EXISTS `max_hp_checker`;
delimiter ;;
CREATE TRIGGER `max_hp_checker` BEFORE UPDATE ON `enemies` FOR EACH ROW trigger1:
begin
if (NEW.enemy_hp <0) then
set new.enemy_hp = 0;
elseif NEW.enemy_hp >new.enemy_max_hp  then
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Aktualne hp nie moze byc wieksze od max_hp';
else
set NEW.enemy_hp = NEW.enemy_hp +0;
LEAVE trigger1;
end if;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
