CREATE TABLE publishing_company.authors
(
    id_author int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    First_name varchar(255) NOT NULL,
    Last_name varchar(255) NOT NULL,
    id_country int(10) unsigned NOT NULL,
    CONSTRAINT authors FOREIGN KEY (id_country) REFERENCES publishing_company.country (id_country)
);
CREATE INDEX authors ON publishing_company.authors (id_country);
INSERT INTO publishing_company.authors (First_name, Last_name, id_country) VALUES ('John', 'Dakett', 2);
INSERT INTO publishing_company.authors (First_name, Last_name, id_country) VALUES ('Ben', 'Frain', 3);
INSERT INTO publishing_company.authors (First_name, Last_name, id_country) VALUES ('Eric', 'May', 3);
INSERT INTO publishing_company.authors (First_name, Last_name, id_country) VALUES ('Shay', 'How', 4);
INSERT INTO publishing_company.authors (First_name, Last_name, id_country) VALUES ('Ivanov', 'Ivan', 1);
CREATE TABLE publishing_company.books
(
    id_book int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NameBook varchar(255) NOT NULL,
    id_themes int(10) unsigned NOT NULL,
    id_author int(10) unsigned NOT NULL,
    Price float unsigned NOT NULL,
    DrawingOfBook int(11) NOT NULL,
    DateOfPublish smallint(5) unsigned NOT NULL,
    Pages smallint(5) unsigned NOT NULL,
    CONSTRAINT books_ibfk_1 FOREIGN KEY (id_themes) REFERENCES publishing_company.themes (id_themes) ON UPDATE CASCADE,
    CONSTRAINT books_ibfk_2 FOREIGN KEY (id_author) REFERENCES publishing_company.authors (id_author) ON UPDATE CASCADE
);
CREATE UNIQUE INDEX NameBook ON publishing_company.books (NameBook);
CREATE INDEX id_themes ON publishing_company.books (id_themes);
CREATE INDEX id_author ON publishing_company.books (id_author);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('HTML & CSS: Design and Build Web Sites', 1, 1, 600, 100000, 2005, 550);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Responsive Web Design', 1, 2, 550.5, 50000, 2008, 480);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('CSS Pocket References', 1, 3, 450.3, 150000, 2010, 420);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Learn to code HTML and CSS', 1, 4, 340.3, 145000, 2008, 540);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Javascript on things', 2, 1, 680.2, 65000, 2008, 550);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Javascript for fids', 2, 3, 610, 78000, 2005, 360);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Speaking PHP', 3, 5, 850, 100000, 2006, 620);
INSERT INTO publishing_company.books (NameBook, id_themes, id_author, Price, DrawingOfBook, DateOfPublish, Pages) VALUES ('Mysql and Json', 3, 5, 1050, 60000, 2015, 410);
CREATE TABLE publishing_company.country
(
    id_country int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_country varchar(255) NOT NULL
);
CREATE UNIQUE INDEX name_country ON publishing_company.country (name_country);
INSERT INTO publishing_company.country (name_country) VALUES ('Germany');
INSERT INTO publishing_company.country (name_country) VALUES ('Great Britain');
INSERT INTO publishing_company.country (name_country) VALUES ('Ukraine');
INSERT INTO publishing_company.country (name_country) VALUES ('USA');
CREATE TABLE publishing_company.sales
(
    id_sale int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_book int(10) unsigned NOT NULL,
    date_of_sale date NOT NULL,
    price float unsigned NOT NULL,
    qty int(10) unsigned NOT NULL,
    id_shop int(10) unsigned NOT NULL,
    CONSTRAINT sales_ibfk_2 FOREIGN KEY (id_book) REFERENCES publishing_company.books (id_book) ON UPDATE CASCADE,
    CONSTRAINT sales_ibfk_1 FOREIGN KEY (id_shop) REFERENCES publishing_company.shops (id_shop) ON UPDATE CASCADE
);
CREATE INDEX id_book ON publishing_company.sales (id_book);
CREATE INDEX id_shop ON publishing_company.sales (id_shop);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (1, '2018-01-30', 0, 160, 1);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (2, '2018-02-02', 0, 552, 1);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (3, '2018-02-05', 0, 1620, 2);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (2, '2018-02-06', 0, 126, 2);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (4, '2018-02-18', 0, 15, 3);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (5, '2018-03-05', 0, 18, 3);
INSERT INTO publishing_company.sales (id_book, date_of_sale, price, qty, id_shop) VALUES (5, '2018-02-06', 0, 562, 4);
CREATE TABLE publishing_company.shops
(
    id_shop int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_shop varchar(255) NOT NULL,
    id_country int(10) unsigned NOT NULL,
    CONSTRAINT shops FOREIGN KEY (id_country) REFERENCES publishing_company.country (id_country) ON UPDATE CASCADE
);
CREATE UNIQUE INDEX name_shop ON publishing_company.shops (name_shop);
CREATE INDEX shops ON publishing_company.shops (id_country);
INSERT INTO publishing_company.shops (name_shop, id_country) VALUES ('offline_Ukr', 1);
INSERT INTO publishing_company.shops (name_shop, id_country) VALUES ('online_Ukr', 1);
INSERT INTO publishing_company.shops (name_shop, id_country) VALUES ('online_USA', 2);
INSERT INTO publishing_company.shops (name_shop, id_country) VALUES ('online_Germany', 4);
CREATE TABLE publishing_company.themes
(
    id_themes int(10) unsigned PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name_theme varchar(255) NOT NULL
);
CREATE UNIQUE INDEX name_theme ON publishing_company.themes (name_theme);
INSERT INTO publishing_company.themes (name_theme) VALUES ('HTML&CSS');
INSERT INTO publishing_company.themes (name_theme) VALUES ('JS');
INSERT INTO publishing_company.themes (name_theme) VALUES ('MySQL');
INSERT INTO publishing_company.themes (name_theme) VALUES ('PHP');