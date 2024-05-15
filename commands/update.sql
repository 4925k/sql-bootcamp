-- updating existing data
-- works without where if you want to update whole table.

-- better to do a select command to see what the conditions work on before update.

update cats set breed = 'Short hair' where breed='Tabby';
update cats set age = 14 where name = 'Misty';