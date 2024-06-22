-- ADD COLUMN
alter table babies_2 add column gender char(1) default 'M';

-- DROP COLUMN
alter table babies drop column gender;

-- rename table
alter table babies_2 rename to children;

-- rename column
alter table children rename gender to sex;

-- alter column
alter table babies alter column name type char(50);
alter table babies add constraint age_check check (age > 0);
alter table babies drop constraint age_check;