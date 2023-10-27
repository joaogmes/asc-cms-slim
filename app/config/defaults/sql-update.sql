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