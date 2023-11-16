insert into author(id, name, email,password) values(4,'kim','abc@naver.com', 'abc');
insert into author(id, name, email,role) values(4,'kim','abc@naver.com', 'admin');
insert into author(id, name, email) values(4,'kim','abc@naver.com');
insert into author(id, name, email) values(4,'kim','abc@naver.com');
insert into author(id, name, email) values(4,'kim','abc@naver.com');

select * from author;

insert into post(id, title, contents, author_id) values(1, 'johoon1', 'johoon2 is...', 2)
insert into post(id, title, contents, author_id) values(2, 'johoon1', 'johoon2 is...', 2)
insert into post(id, title, contents, author_id) values(3, 'johoon1', 'johoon2 is...', )
insert into post(id, title, contents, author_id) values(4, 'johoon1', 'johoon2 is...', )
insert into post(id, title, contents, author_id) values(5, 'johoon1', 'johoon2 is...', 10)
