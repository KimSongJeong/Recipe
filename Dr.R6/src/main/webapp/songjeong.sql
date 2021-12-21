SELECT * FROM USERS;
delete from users where u_id='test2';
insert into users values('test','1234','test@test','또훈',1,0,1,0,1,0);
select u_email from users where u_email='test@test';

select * from commentss;

select cmt_content, cmt_time, cmt_id from commentss where cmt_recipe=1;

select * from food where food_good like '%고혈압%' and food_month=8;

select recipe_code, recipe_name, recipe_method, recipe_img from recipe where recipe_name like '%오이%' or recipe_food like '%오이%';
select food_name, food_code from food where food_name like '%오이%';
select cmt_content, cmt_time, cmt_id from commentss where cmt_recipe=1;

select * from v_dang where recipe_name like '%표고버섯%';

select * from myrecipe;

select * from food where FOOD_MONTH = 8;