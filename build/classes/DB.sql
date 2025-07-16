DROP DATABASE `AM_jsp_2025_07`;
CREATE DATABASE `AM_jsp_2025_07`;
USE `AM_jsp_2025_07`;

# 게시글 테이블 생성
CREATE TABLE `article` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `regDate` DATETIME NOT NULL,
    `updateDate` DATETIME NOT NULL,
    `title` CHAR(100) NOT NULL,
    `body` CHAR(100) NOT NULL
);

# 회원 테이블 생성
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
    `title` = '제목1',
    `body` = '내용1';
INSERT INTO `article`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `title` = '제목2',
    `body` = '내용2'; 
INSERT INTO `article`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `title` = '제목3',
    `body` = '내용3';    


INSERT INTO `member`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `loginId` = 'test1',
    `loginPw` = 'test1',
    `name` = '홍길동'; 
INSERT INTO `member`
SET `regDate` = NOW(),
    `updateDate` = NOW(),
    `loginId` = 'test2',
    `loginPw` = 'test2',
    `name` = '김철수';   


SELECT *
FROM `article`;
SELECT *
FROM `member`;

#################################################################################
# 게시글 데이터 대량 생성
insert into `article`
set  `regDate` = now(),
	`updateDate` = now(),
    `title` = CONCAT('제목', subSTRING(RAND() * 1000 FROM 1 for 2)),
    `body` = CONCAT('내용', subSTRING(RAND() * 1000 FROM 1 for 2));

# 회원 데이터 대량생성
insert into `number`
set  `regDate` = now(),
	`updateDate` = now(),
    `loginId` = CONCAT('id', subSTRING(RAND() * 1000 FROM 1 for 3)),
    `loginPw` = CONCAT('pw', subSTRING(RAND() * 1000 FROM 1 for 5)),
    `name` = CONCAT('이름', subSTRING(RAND() * 1000 FROM 1 for 5));