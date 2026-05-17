CREATE TABLE IF NOT EXISTS badminton_saves (
  id       UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name     TEXT NOT NULL,
  city     TEXT NOT NULL,
  data     JSONB NOT NULL,
  saved_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(name, city)
);

ALTER TABLE badminton_saves ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "public_read"   ON badminton_saves FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE POLICY "public_insert" ON badminton_saves FOR INSERT WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE POLICY "public_update" ON badminton_saves FOR UPDATE USING (true);
EXCEPTION WHEN duplicate_object THEN NULL; END $$;

DO $$ BEGIN
  CREATE POLICY "public_delete" ON badminton_saves FOR DELETE USING (true);
EXCEPTION WHEN duplicate_object THEN NULL; END $$;
