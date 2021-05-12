create table authority (
    authorityNo int(20) primary key,
    authorityName varchar(20) not null
);

insert into authority values (001, 'Engineer');
insert into authority values (101, 'Company');
insert into authority values (999, 'Admin');

create table member (
    memberNo int(20) primary key,
    memberId varchar(20) not null,
    memberPwd varchar(20) not null,
    memberEmail varchar(40) not null,
    authorityNo int(20) not null,
    foreign key(authorityNo) references authority(authorityNo) on delete cascade
);

create table category (
    categoryNo int(20) primary key,
    categoryName varchar(20) not null
);

insert into category values (1, 'PlayStation');
insert into category values (2, 'Nintendo');
insert into category values (3, 'Xbox');

create table board (
    boardNo int(20) primary key,
    boardTitle varchar(100) not null,
    boardContent varchar(4000) not null,
    boardDate varchar(30) not null,
    boardViewCount int(20) not null,
    categoryNo int(20) not null,
    memberNo int(20) not null,
    foreign key(categoryNo) references category(categoryNo) on delete cascade,
    foreign key(memberNo) references member(memberNo) on delete cascade
);

create table comment (
    commentNo int(20) primary key,
    commentContent varchar(100) not null,
    boardNo int(20) not null,
    memberNo int(20) not null,
    foreign key(boardNo) references board(boardNo) on delete cascade,
    foreign key(memberNo) references member(memberNo) on delete cascade
);