DROP DATABASE `AM_jsp_2025_07`;
CREATE DATABASE `AM_jsp_2025_07`;
USE `AM_jsp_2025_07`;

# �Խñ� ���̺� ����
CREATE TABLE `article` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `regDate` DATETIME NOT NULL,
    `updateDate` DATETIME NOT NULL,
    `title` CHAR(100) NOT NULL,
    `body` CHAR(100) NOT NULL
);

# ȸ�� ���̺� ����
CREATE TABLE `member` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `regDate` DATETIME NOT NULL,
    `updateDate` DATETIME NOT NULL,
    `loginId` CHAR(100) NOT NULL,
    `loginPw` CHAR(100) NOT NULL,
    `name` CHAR(100) NOT NULL
);


INSERT INTO `article`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `title` = '����1',
    `body` = '����1';
INSERT INTO `article`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `title` = '����2',
    `body` = '����2'; 
INSERT INTO `article`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `title` = '����3',
    `body` = '����3';    


INSERT INTO `member`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `loginId` = 'test1',
    `loginPw` = 'test1',
    `name` = 'ȫ�浿'; 
INSERT INTO `member`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `loginId` = 'test2',
    `loginPw` = 'test2',
    `name` = '��ö��';   


SELECT *
FROM `article`;
SELECT *
FROM `member`;

#################################################################################
# �Խñ� ������ �뷮 ����
insert into `article`
set  `regDate` = now(),
	`updateDate` = now(),
    `title` = CONCAT('����', subSTRING(RAND() * 1000 FROM 1 for 2)),
    `body` = CONCAT('����', subSTRING(RAND() * 1000 FROM 1 for 2));

# ȸ�� ������ �뷮����
insert into `number`
set  `regDate` = now(),
	`updateDate` = now(),
    `loginId` = CONCAT('id', subSTRING(RAND() * 1000 FROM 1 for 3)),
    `loginPw` = CONCAT('pw', subSTRING(RAND() * 1000 FROM 1 for 5)),
    `name` = CONCAT('�̸�', subSTRING(RAND() * 1000 FROM 1 for 5));