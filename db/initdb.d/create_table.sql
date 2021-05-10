create table member (
    memberNo int(20) primary key,
    memberId varchar(20) not null,
    memberPwd varchar(20) not null,
    memberEmail varchar(40) not null
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
    foreign key(categoryNo) references category(categoryNo),
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