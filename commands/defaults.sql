-- DEFAULT & ON UPDATE TIMESTAMPS
create table name (
    name text,
    created_at timestamp default current_timestamp,
    updated_at timestamp default current_timestamp
);

-- TRIGGER FUNCTION
CREATE OR REPLACE FUNCTION update_updated_at_column()
    RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- CREATE TRIGGER
CREATE TRIGGER update_captions2_updated_at
    BEFORE UPDATE ON name
    FOR EACH ROW
EXECUTE FUNCTION update_updated_at_column();