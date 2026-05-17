-- Allow multiple saves per name+city (needed for "save as new copy")
ALTER TABLE badminton_saves DROP CONSTRAINT IF EXISTS badminton_saves_name_city_key;
