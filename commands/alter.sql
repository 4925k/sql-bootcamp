-- ADD COLUMN
alter table babies_2 add column gender char(1) default 'M';

-- DROP COLUMN
alter table babies drop column gender;

-- rename table
alter table babies_2 rename to children;

-- rename column

alter table children rename gender to sex;