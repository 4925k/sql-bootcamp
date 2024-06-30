-- triggers
-- trigger_time BEFORE AFTER
-- trigger_event INSERT UPDATE DELETE

create table if not exists people (
    id serial primary key,
    created_at timestamp default current_timestamp,
    name text not null,
    age int not null
);

insert into people (name, age) values ('Alice', 30), ('Bob', 20), ('Charlie', 10);

create or replace function must_be_adult()
returns trigger as $$
begin
    if new.age < 18 then
        raise exception 'Age must be greater than 18';
    end if;
    return new;
end;
$$ language plpgsql;

create trigger must_be_adult
before insert or update on people
for each row
execute procedure must_be_adult();