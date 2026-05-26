-- Migration: create_core_tables
-- Project: OvercomePMO (Supabase)

CREATE TABLE diary_entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  title TEXT,
  body TEXT NOT NULL,
  mood TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE trigger_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  emotion TEXT,
  location TEXT,
  tiredness_level INTEGER CHECK (tiredness_level BETWEEN 1 AND 5),
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE emergency_sessions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  steps_completed INTEGER DEFAULT 0,
  completed_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE check_ins (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  checked_in_at DATE DEFAULT CURRENT_DATE,
  note TEXT,
  relapse BOOLEAN DEFAULT FALSE
);

CREATE TABLE identity (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  purpose_text TEXT,
  values JSONB DEFAULT '[]',
  reminder_text TEXT,
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_diary_created ON diary_entries(created_at DESC);
CREATE INDEX idx_trigger_created ON trigger_logs(created_at DESC);
CREATE INDEX idx_checkin_date ON check_ins(checked_in_at DESC);

-- RLS
ALTER TABLE diary_entries ENABLE ROW LEVEL SECURITY;
ALTER TABLE trigger_logs ENABLE ROW LEVEL SECURITY;
ALTER TABLE emergency_sessions ENABLE ROW LEVEL SECURITY;
ALTER TABLE check_ins ENABLE ROW LEVEL SECURITY;
ALTER TABLE identity ENABLE ROW LEVEL SECURITY;

-- Public access (prototype — add auth policies when ready)
CREATE POLICY "public_all_diary" ON diary_entries FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all_triggers" ON trigger_logs FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all_emergency" ON emergency_sessions FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all_checkins" ON check_ins FOR ALL USING (true) WITH CHECK (true);
CREATE POLICY "public_all_identity" ON identity FOR ALL USING (true) WITH CHECK (true);
