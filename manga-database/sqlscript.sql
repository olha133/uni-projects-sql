create table AUTHOR( 
    author_id    number(5) NOT NULL PRIMARY KEY, 
    first_name  varchar2(20byte) NOT NULL, 
    last_name  varchar2(25byte) NOT NULL, 
    info      varchar2(1000byte) 
);

create table MANGA_TYPE( 
  manga_type  varchar2(20byte) NOT NULL PRIMARY KEY, 
  info    varchar2(1000byte) 
);

create table MANGA( 
    manga_id      number(6) NOT NULL PRIMARY KEY, 
    title        varchar2(70byte) NOT NULL, 
    author_id      number(5), 
    translator_id    number(5), 
    create_date      date, 
    manga_type      varchar2(20byte), 
    manga_status    varchar2(20byte), 
    translation_status  varchar2(20byte), 
    genre        varchar2(20byte), 
    chapters_number    number(3), 
    updated        date, 
    CONSTRAINT FK_author FOREIGN KEY (author_id) 
    REFERENCES AUTHOR(author_id), 
    CONSTRAINT FK_type FOREIGN KEY (manga_type) 
    REFERENCES  MANGA_TYPE(manga_type) 
);

create table CHAPTER( 
    chapter_id  number(10) NOT NULL PRIMARY KEY, 
    manga_id  number(6), 
    updated    date, 
    title    varchar2(70byte), 
    page_count  number(2), 
    CONSTRAINT FK_manga FOREIGN KEY (manga_id) 
    REFERENCES  MANGA(manga_id) 
);

create table TRANSLATOR( 
    translator_id  number(5) NOT NULL PRIMARY KEY, 
    first_name     varchar2(20byte), 
    last_name    varchar2(25byte), 
    info      varchar2(1000byte) 
);

create table READER( 
    reader_id      number(6) NOT NULL PRIMARY KEY, 
    registration_date  date, 
    nickname      varchar2(20byte), 
    email_address    varchar2(25byte), 
    password      varchar2(30byte) 
);

create table GENRE( 
    genre  varchar2(20byte) NOT NULL PRIMARY KEY, 
    info  varchar2(1000byte) 
);

create table GENRE_MANGA( 
    manga_id  number(6) NOT NULL, 
    genre    varchar2(20byte) NOT NULL, 
    CONSTRAINT PK_genre_manga PRIMARY KEY (manga_id, genre), 
    CONSTRAINT FK_manga1 
    FOREIGN KEY (manga_id) REFERENCES MANGA(manga_id), 
    CONSTRAINT FK_genre 
    FOREIGN KEY (genre) REFERENCES GENRE(genre) 
);

create table READER_MANGA( 
    manga_id  number(6), 
    reader_id  number(6), 
    CONSTRAINT PK_reader_manga PRIMARY KEY (manga_id, reader_id), 
    CONSTRAINT FK_manga2 
    FOREIGN KEY (manga_id) REFERENCES MANGA(manga_id), 
    CONSTRAINT FK_reader 
    FOREIGN KEY (reader_id) REFERENCES READER(reader_id) 
);

create table TRANSLATOR_MANGA( 
    manga_id    number(6), 
    translator_id  number(5), 
    CONSTRAINT PK_translator_manga PRIMARY KEY (manga_id, translator_id), 
    CONSTRAINT FK_manga3 
    FOREIGN KEY (manga_id) REFERENCES MANGA(manga_id), 
    CONSTRAINT FK_translator 
    FOREIGN KEY (translator_id) REFERENCES TRANSLATOR(translator_id) 
);

insert into AUTHOR(author_id, first_name, last_name, info) 
values    (1, 'Katsuhiro', 'Otomo', 'He is best known as the creator of Akira, in terms of both the original 1982 manga series and the 1988 animated film adaptation. He was decorated a Chevalier of the French Ordre des Arts et des Lettres in 2005, promoted to Officier of the order in 2014, became the fourth manga artist ever inducted into the American Eisner Award Hall of Fame in 2012, and was awarded the Purple Medal of Honor from the Japanese government in 2013.');

insert into AUTHOR(author_id, first_name, last_name, info) 
values     (2, 'Naoki', 'Urasawa', 'He has been drawing manga since he was four years old, and for most of his professional career has created two series simultaneously. The stories to many of these were co-written in collaboration with his former editor, Takashi Nagasaki.');

insert into AUTHOR(author_id, first_name, last_name, info) 
values    (3, 'Hiroya', 'Oku', 'The creator of Gantz, Gigant, Hen and Inuyashiki, the first two of which have been serialized in Weekly Young Jump. Originally influenced by Katsuhiro Otomo and Ryoichi Ikegami, his manga often contain explicit violence, sexual depictions, and matters that are considered taboo by the public, and he is known as a pioneer in the use of digital processing for manga backgrounds.');

insert into AUTHOR(author_id, first_name, last_name, info) 
values    (4, 'Hiromu', 'Arakawa', 'She is best known for the manga series Fullmetal Alchemist (2001–2010), which became a hit both domestically and internationally, and was adapted into two anime television series. She is also known for Silver Spoon (2011–2019) and the manga adaptation of The Heroic Legend of Arslan novels.');

insert into AUTHOR(author_id, first_name, last_name, info) 
values    (5, 'Makoto', 'Yukimura', 'He is currently working on Vinland Saga which was first serialized in Weekly Shonen Magazine then moved to the monthly Afternoon magazine due to releases pacing issues. He was inspired by anime series about Vikings he watched as a child, and since then he has been fascinated about Vikings.');

insert into MANGA_TYPE(manga_type, info) 
values ('Shonen', 'Shonen manga is typically targeted towards young boys and is known for its action-packed storylines and focus on male protagonists. Shonen manga often includes themes of friendship, rivalry, and self-improvement. Examples of popular shonen manga include "Dragon Ball," "Naruto," and "One Piece."');

insert into MANGA_TYPE(manga_type, info) 
values ('Shojo', 'Shojo manga is typically targeted towards young girls and is known for its romantic storylines and focus on female protagonists. Shojo manga often includes themes of love, friendship, and self-discovery. Examples of popular shojo manga include "Sailor Moon," "Fruits Basket," and "Kimi ni Todoke."');

insert into MANGA_TYPE(manga_type, info) 
values ('Seinen', 'Seinen manga is targeted towards adult male readers and often includes mature themes and complex characters. Seinen manga can cover a wide range of genres, including action, romance, and horror. Examples of popular seinen manga include "Berserk," "Attack on Titan," and "Monster."');

insert into MANGA_TYPE(manga_type, info) 
values ('Josei', 'Josei manga is targeted towards adult female readers and often includes mature themes and realistic characters. Josei manga can cover a wide range of genres, including romance, drama, and slice of life. Examples of popular josei manga include "Nana," "Honey and Clover," and "Princess Jellyfish."');

insert into MANGA_TYPE(manga_type, info) 
values ('Kodomo', 'Kodomo manga is targeted towards young children and often features simple storylines and cute, colorful artwork. Kodomo manga can cover a wide range of genres, including adventure, fantasy, and comedy. Examples of popular kodomo manga include "Doraemon," "Pokemon Adventures," and "Chis Sweet Home."');

insert into MANGA(manga_id, title, author_id, translator_id, create_date, manga_type, manga_status, translation_status, genre, chapters_number, updated) 
values ( 1, 'Akira', 1, 1, to_date('1982-12-20', 'yyyy-mm-dd'), 'Seinen', 'Completed', 'Ongoing', 'Cyberpunk', 120,  SYSDATE);

insert into MANGA(manga_id, title, author_id, translator_id, create_date, manga_type, manga_status, translation_status, genre, chapters_number, updated) 
values ( 2, '20th Century Boys', 2, 2, to_date('1999-12-01', 'yyyy-mm-dd'), 'Seinen', 'Completed', 'Ongoing', 'Cyberpunk', 120,  SYSDATE);

insert into MANGA(manga_id, title, author_id, translator_id, create_date, manga_type, manga_status, translation_status, genre, chapters_number, updated) 
values ( 3, 'Hen', 3, 3, to_date('1989-12-20', 'yyyy-mm-dd'), 'Seinen', 'Completed', 'Completed', 'Romantic comedy', 13,  SYSDATE);

insert into MANGA(manga_id, title, author_id, translator_id, create_date, manga_type, manga_status, translation_status, genre, chapters_number, updated) 
values ( 4, 'Fullmetal Alchemist', 4, 4, to_date('2001-06-12', 'yyyy-mm-dd'), 'Shonen', 'Completed', 'Ongoing', 'Adventure', 108,  SYSDATE);

insert into MANGA(manga_id, title, author_id, translator_id, create_date, manga_type, manga_status, translation_status, genre, chapters_number, updated) 
values ( 5, 'Vinland Saga', 5, 5, to_date('2005-03-13', 'yyyy-mm-dd'), 'Shonen', 'Ongoing', 'Ongoing', 'Historical', 200,  SYSDATE);

insert into CHAPTER(chapter_id, manga_id, updated, title, page_count) 
values (1, 1, sysdate, 'Awakening', 71);

insert into CHAPTER(chapter_id, manga_id, updated, title, page_count) 
values (2, 1, sysdate, 'Revelations', 45);

insert into CHAPTER(chapter_id, manga_id, updated, title, page_count) 
values (3, 1, sysdate, 'The Children', 42);

insert into CHAPTER(chapter_id, manga_id, updated, title, page_count) 
values (4, 1, sysdate, 'Prologue', 40);

insert into CHAPTER(chapter_id, manga_id, updated, title, page_count) 
values (5, 1, sysdate, 'Nightmare', 39);

insert into TRANSLATOR(translator_id, first_name, last_name, info) 
values (1, 'William', 'Flanagan', 'Flanagan is a translator who has worked on many popular manga series, including "Naruto," "Death Note," and "One Piece." He is known for his faithful translations and attention to detail, and has won several awards for his work.');

insert into TRANSLATOR(translator_id, first_name, last_name, info) 
values (2, 'Jocelyne', 'Allen', 'Allen is a translator and editor who has worked on many manga series, including "Cardcaptor Sakura," "Assassination Classroom," and "Cells at Work!" She is known for her accurate and readable translations, and has also given talks and workshops on manga translation.');

insert into TRANSLATOR(translator_id, first_name, last_name, info) 
values (3, 'Alethea', 'Nibley', 'Nibley is a translator who has worked on many manga series, including "Fruits Basket," "Skip Beat!," and "Yona of the Dawn." She is known for her natural-sounding translations and her ability to capture the characters voices and personalities.');

insert into TRANSLATOR(translator_id, first_name, last_name, info) 
values (4, 'Mari', 'Morimoto', 'Morimoto is a translator and editor who has worked on many manga series, including "Haikyu!!," "JoJos Bizarre Adventure," and "The Promised Neverland." She is known for her skill in adapting the text for English readers while maintaining the original flavor of the Japanese.');

insert into TRANSLATOR(translator_id, first_name, last_name, info) 
values (5, 'Adrienne', 'Beck', 'Beck is a translator and editor who has worked on many manga series, including "My Hero Academia," "Attack on Titan," and "Blue Exorcist." She is known for her clean, readable translations and her attention to cultural nuances and references.');

insert into READER(reader_id, registration_date, nickname, email_address, password) 
values (1, TO_DATE('2023-04-03', 'YYYY-MM-DD'), 'JohnDoe', 'johndoe@email.com', 'p@ssw0rd_1!');

insert into READER(reader_id, registration_date, nickname, email_address, password) 
values (2, TO_DATE('2023-04-02', 'YYYY-MM-DD'), 'JaneDoe', 'janedoe@email.com', 'p@ssw0rd_2!');

insert into READER(reader_id, registration_date, nickname, email_address, password) 
values (3, TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'BobSmith', 'bobsmith@email.com', 'p@ssw0rd_3!');

insert into READER(reader_id, registration_date, nickname, email_address, password) 
values (4, TO_DATE('2023-03-31', 'YYYY-MM-DD'), 'AliceJohnson', 'alicejohnson@email.com', 'p@ssw0rd_4!');

insert into READER(reader_id, registration_date, nickname, email_address, password) 
values (5, TO_DATE('2023-03-30', 'YYYY-MM-DD'), 'MichaelLee', 'michaellee@email.com', 'p@ssw0rd_5!');

insert into GENRE(genre, info) 
values ('Cyberpunk', 'A genre that features a futuristic and dystopian world that is heavily influenced by advanced technology and often explores themes of social decay, artificial intelligence, and corporate greed.');

insert into GENRE(genre, info) 
values ('Romantic comedy', 'A genre that typically focuses on a humorous and light-hearted romance between two characters, often with elements of comedic misunderstandings, love triangles, and awkward situations.');

insert into GENRE(genre, info) 
values ('Adventure', 'A genre that follows the journey of a protagonist or group of characters as they embark on a quest or explore a new world, often facing challenges and obstacles along the way.');

insert into GENRE(genre, info) 
values ('Historical', 'A genre that is set in a specific historical period, often featuring fictionalized events and characters that are inspired by real-life historical events and figures.');

insert into GENRE(genre, info) 
values ('Drama', 'A genre that often explores serious and emotional themes such as tragedy, love, and human relationships. Dramas may include elements of romance, action, or suspense, but often prioritize character development and emotional depth over other genre elements.');

insert into GENRE_MANGA(manga_id, genre) 
values (1, 'Cyberpunk');

insert into GENRE_MANGA(manga_id, genre) 
values (2, 'Cyberpunk');

insert into GENRE_MANGA(manga_id, genre) 
values (3, 'Romantic comedy');

insert into GENRE_MANGA(manga_id, genre) 
values (4, 'Adventure');

insert into GENRE_MANGA(manga_id, genre) 
values (5, 'Historical');

insert into READER_MANGA(manga_id, reader_id) 
values (1, 1);

insert into READER_MANGA(manga_id, reader_id) 
values (1, 2);

insert into READER_MANGA(manga_id, reader_id) 
values (2, 3);

insert into READER_MANGA(manga_id, reader_id) 
values (3, 4);

insert into READER_MANGA(manga_id, reader_id) 
values (4, 5);

insert into TRANSLATOR_MANGA(manga_id, translator_id) 
values (1, 1);

insert into TRANSLATOR_MANGA(manga_id, translator_id) 
values (2, 2);

insert into TRANSLATOR_MANGA(manga_id, translator_id) 
values (3, 3);

insert into TRANSLATOR_MANGA(manga_id, translator_id) 
values (4, 4);

insert into TRANSLATOR_MANGA(manga_id, translator_id) 
values (5, 5);

--1. create 10 meaningful views according to the following criteria (a description should be added to each view):
--1.1. 2 views with a non-trivial select over one table (it is not enough to use only the enumeration 
--columns, it is necessary to use "something extra" e.g.: built-in functions);

--List of current genres (with at least one manga) and number of manga in these genres
SELECT genre, COUNT(*) AS "COUNT OF MANGA"
FROM MANGA
GROUP BY genre;

--List of current manga types (with at least one manga) and the average number of manga chapters of each type.
SELECT manga_type, ROUND(AVG(chapters_number), 2) AS "AVERAGE AMOUNT OF CHAPTERS" FROM MANGA
GROUP BY manga_type;

--1.2. 3 views with table joins (1x join of 3 tables, 1x outer join, 1x join of at least 2 tables);

--Recent manga updates (new chapters) on the page and detailed information about them
SELECT MANGA.title AS "MANGA", 
       AUTHOR.first_name  ||' '||  AUTHOR.last_name AS "AUTHOR", 
       MANGA.updated, 
       CHAPTER.title AS "NEW CHAPTER", 
       CHAPTER.page_count 
FROM MANGA
INNER JOIN CHAPTER ON MANGA.manga_id = CHAPTER.manga_id
INNER JOIN AUTHOR ON MANGA.author_id = AUTHOR.author_id;

--This select lists the title of each manga, the name of its author and the name of its translator
SELECT MANGA.title AS "MANGA", 
       AUTHOR.first_name || ' ' || AUTHOR.last_name AS "AUTHOR", 
       TRANSLATOR.first_name  ||' ' || TRANSLATOR.last_name AS "TRANSLATOR"
FROM MANGA
INNER JOIN AUTHOR ON MANGA.author_id = AUTHOR.author_id
LEFT OUTER JOIN TRANSLATOR_MANGA ON MANGA.manga_id = TRANSLATOR_MANGA.manga_id
LEFT OUTER JOIN TRANSLATOR ON TRANSLATOR_MANGA.translator_id = TRANSLATOR.translator_id;

--Shows how many citations the manga has
SELECT MANGA.title AS "MANGA", COUNT(DISTINCT READER_MANGA.reader_id) AS "READER COUNT"
    -- DISTINCT returns only different values (reader can read manga several times)
FROM MANGA
LEFT JOIN READER_MANGA ON MANGA.manga_id = READER_MANGA.manga_id
    --LEFT JOIN to include all manga, even those that have no readers
GROUP BY MANGA.title;

--1.3. 2 views using aggregate functions or groupings;

--Displays the current state of the manga on the page.
SELECT manga_status as "STATUS", COUNT(*) as "NUMBER OF MANGA"
FROM manga
GROUP BY manga_status;

--Displays the number of new users on certain days
SELECT registration_date as "REGISTRATION DATE", COUNT(*) as "NEW READERS"
FROM READER
GROUP BY registration_date;

--1.4. 1 view using set operations;
--Displays when the manga in the "in progress" state was last updated
SELECT manga_id, updated FROM manga
where manga_status = 'Ongoing'
UNION
SELECT manga_id, updated FROM chapter;

--1.5. 2 views using nested selections;

--Searching manga by author name
SELECT title, author_id
FROM manga
WHERE author_id IN (SELECT author_id FROM author WHERE last_name = 'Urasawa');

--Searching manga by translator name
SELECT title, translator_id FROM manga
WHERE manga_id IN ( SELECT manga_id FROM translator_manga
  WHERE translator_id IN ( SELECT translator_id FROM translator
    WHERE last_name = 'Nibley'));
--2. create 1 sequence to generate primary keys and a trigger to insert values
--into the appropriate tables;

--Sequences and triggers to automatically create PK
CREATE SEQUENCE pk_seq_author START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_manga START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_reader START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_translator START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_chapter START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_reader_manga START WITH 6 INCREMENT BY 1;
CREATE SEQUENCE pk_seq_translator_manga START WITH 6 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER pk_trigger
BEFORE INSERT ON AUTHOR
FOR EACH ROW
BEGIN
  SELECT pk_seq_author.NEXTVAL
  INTO :NEW.author_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger2
BEFORE INSERT ON MANGA
FOR EACH ROW
BEGIN
  SELECT pk_seq_manga.NEXTVAL
  INTO :NEW.manga_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger3
BEFORE INSERT ON CHAPTER
FOR EACH ROW
BEGIN
  SELECT pk_seq_chapter.NEXTVAL
  INTO :NEW.chapter_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger4
BEFORE INSERT ON READER
FOR EACH ROW
BEGIN
  SELECT pk_seq_reader.NEXTVAL
  INTO :NEW.reader_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger5
BEFORE INSERT ON TRANSLATOR
FOR EACH ROW
BEGIN
  SELECT pk_seq_translator.NEXTVAL
  INTO :NEW.translator_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger6
BEFORE INSERT ON READER_MANGA
FOR EACH ROW
BEGIN
  SELECT pk_seq_reader_manga.NEXTVAL
  INTO :NEW.manga_id
  FROM dual;
  SELECT pk_seq_reader_manga.NEXTVAL
  INTO :NEW.reader_id
  FROM dual;
END;
/

CREATE OR REPLACE TRIGGER pk_trigger7
BEFORE INSERT ON TRANSLATOR_MANGA
FOR EACH ROW
BEGIN
  SELECT pk_seq_translator_manga.NEXTVAL
  INTO :NEW.translator_id
  FROM dual;
  SELECT pk_seq_translator_manga.NEXTVAL
  INTO :NEW.manga_id
  FROM dual;
END;
/

--3. create 1 arbitrary trigger in addition to the trigger type specified above (the trigger must contain either
--condition, loop or exception)
    
--Trigger that checks if the translation of the manga has been stopped (the manga was updated more than 3 months ago)
CREATE OR REPLACE TRIGGER check_manga_status
before INSERT OR UPDATE ON manga
FOR EACH ROW
BEGIN
  IF (MONTHS_BETWEEN(SYSDATE, :NEW.updated) > 3 AND :NEW.translation_status = 'Ongoing' AND :NEW.manga_status = 'Completed') THEN
    :NEW.translation_status := 'Abandoned';
  END IF;
END;
/