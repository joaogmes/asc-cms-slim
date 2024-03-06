CREATE TABLE `file` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL,
	`path` VARCHAR(255) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	`created` DATETIME NOT NULL DEFAULT NOW(),
	PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_general_ci'
;

CREATE TABLE `component` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NOT NULL DEFAULT '0',
	`path` VARCHAR(255) NOT NULL DEFAULT '0',
	`content` TEXT NULL,
	`status` ENUM('active', 'inactive') NOT NULL DEFAULT 'inactive',
	`creation` DATETIME NOT NULL DEFAULT NOW(),
	`update` DATETIME NULL DEFAULT NULL ON UPDATE NOW(),
	PRIMARY KEY (`id`)
)
COLLATE='utf8mb4_general_ci'
;

CREATE TABLE `page` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`slug` VARCHAR(255) NOT NULL DEFAULT '0',
	`name` VARCHAR(255) NULL DEFAULT NULL,
	`status` ENUM('active', 'inactive') NOT NULL DEFAULT 'inactive',
	`visibility` ENUM('hidden', 'menu') NOT NULL DEFAULT 'menu',
	`creation` DATETIME NOT NULL DEFAULT NOW(),
	PRIMARY KEY (`id`),
	UNIQUE INDEX `slug` (`slug`)
)
COLLATE='utf8mb4_general_ci'
;

CREATE TABLE `pagecomponent` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`idPage` INT NOT NULL DEFAULT '0',
	`idComponent` INT NOT NULL DEFAULT '0',
	`creation` DATETIME NOT NULL DEFAULT NOW(),
	PRIMARY KEY (`id`),
	CONSTRAINT `FK__page` FOREIGN KEY (`idPage`) REFERENCES `page` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK__component` FOREIGN KEY (`idComponent`) REFERENCES `component` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
;

CREATE TABLE `filecomponent` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`idFile` INT(10) UNSIGNED NOT NULL DEFAULT '0',
	`idComponent` INT(11) NOT NULL DEFAULT '0',
	`creation` DATETIME NOT NULL DEFAULT current_timestamp(),
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `FK__file` (`idFile`) USING BTREE,
	INDEX `FK_filecomponent_component` (`idComponent`) USING BTREE,
	CONSTRAINT `FK__file` FOREIGN KEY (`idFile`) REFERENCES `file` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_filecomponent_component` FOREIGN KEY (`idComponent`) REFERENCES `component` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

ALTER TABLE `page`
	ADD COLUMN `title` TEXT NULL AFTER `name`,
	ADD COLUMN `description` TEXT NULL AFTER `title`,
	ADD COLUMN `keywords` TEXT NULL AFTER `description`,
	ADD COLUMN `scripts` TEXT NULL AFTER `keywords`;

ALTER TABLE `component`
	ADD	COLUMN `fields` VARCHAR(255) NULL DEFAULT '0' AFTER `path`;

ALTER TABLE `pagecomponent`
	ADD	COLUMN `content` TEXT NULL AFTER `idComponent`;

CREATE TABLE `auth` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
	`userId` INT(10) NOT NULL,
	`token` VARCHAR(255) NOT NULL DEFAULT '0',
	`expiration` DATETIME NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `userId` (`userId`),
	CONSTRAINT `FK__user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE NO ACTION ON DELETE NO ACTION
) COLLATE = 'utf8mb4_general_ci';

CREATE TABLE `lead` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT '0',
	`phone` VARCHAR(255) NULL DEFAULT '0',
	`cpf` VARCHAR(255) NULL DEFAULT '0',
	`state` VARCHAR(255) NULL DEFAULT '0',
	`city` VARCHAR(255) NULL DEFAULT '0',
	`birth` VARCHAR(255) NULL DEFAULT '0',
	`energyProvider` VARCHAR(255) NULL DEFAULT '0',
	`status` ENUM('incomplete', 'complete', 'integrated') NOT NULL DEFAULT 'incomplete',
	`integrationId` VARCHAR(255) NULL DEFAULT '0',
	`integrationResult` VARCHAR(255) NULL DEFAULT '0',
	PRIMARY KEY (`id`)
) COLLATE = 'utf8mb4_general_ci';

ALTER TABLE `lead`
	CHANGE COLUMN `name` `name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `id`,
	CHANGE COLUMN `phone` `phone` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `name`,
	CHANGE COLUMN `cpf` `cpf` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `phone`,
	CHANGE COLUMN `state` `state` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `cpf`,
	CHANGE COLUMN `city` `city` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `state`,
	CHANGE COLUMN `birth` `birth` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `city`,
	CHANGE COLUMN `energyProvider` `energyProvider` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `birth`,
	ADD COLUMN `origin` ENUM('fgts', 'luz') NULL DEFAULT NULL AFTER `status`,
	CHANGE COLUMN `integrationId` `integrationId` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `origin`,
	CHANGE COLUMN `integrationResult` `integrationResult` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci' AFTER `integrationId`;

ALTER TABLE
	`lead`
ADD
	COLUMN `offerResult` VARCHAR(255) NULL DEFAULT NULL
AFTER
	`integrationResult`;