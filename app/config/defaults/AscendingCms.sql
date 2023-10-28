DROP TABLE IF EXISTS pagecomponent;

DROP TABLE IF EXISTS page;

DROP TABLE IF EXISTS seo;

DROP TABLE IF EXISTS component;

DROP TABLE IF EXISTS user;

-- Tabela de Usuários
CREATE TABLE user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    login VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive') NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP
);

-- Tabela de componentes
CREATE TABLE component (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    path VARCHAR(255) NOT NULL,
    config TEXT,
    status ENUM('active', 'inactive') NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP
);

-- Tabela de Configuração SEO
CREATE TABLE seo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    metaTitle VARCHAR(255),
    metaDescription TEXT,
    keywords TEXT,
    type ENUM('global', 'page') NOT NULL,
    headerSnippet TEXT,
    bodySnippet TEXT,
    status ENUM('active', 'inactive') NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP
);

-- Tabela de Páginas (agora pages)
CREATE TABLE page (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    status ENUM('active', 'inactive') NOT NULL,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP,
    userId INT NOT NULL,
    seoId INT NOT NULL,
    seoType ENUM('global', 'page', 'both') NOT NULL,
    FOREIGN KEY (userId) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (seoId) REFERENCES seo(id) ON DELETE CASCADE
);

-- Tabela Relacional entre Páginas (pages) e componentes
CREATE TABLE pagecomponent (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pageId INT NOT NULL,
    componentId INT NOT NULL,
    data TEXT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP,
    FOREIGN KEY (pageId) REFERENCES page(id) ON DELETE CASCADE,
    FOREIGN KEY (componentId) REFERENCES component(id) ON DELETE CASCADE
);

ALTER TABLE
    `page`
ADD
    COLUMN `slug` VARCHAR(255) NOT NULL
AFTER
    `name`,
ADD
    UNIQUE INDEX `slug` (`slug`);

ALTER TABLE
    `page` CHANGE COLUMN `seoId` `seoId` INT(10) NULL
AFTER
    `userId`;