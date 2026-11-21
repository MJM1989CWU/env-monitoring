CREATE TABLE sites (
  site_id INTEGER PRIMARY KEY,
  site_name TEXT,
  site_type TEXT
);

INSERT INTO sites (site_id, site_name, site_type)
VALUES
  (1, 'Well A', 'well'),
  (2, 'Well B', 'well'),
  (3, 'River C', 'river');

SELECT * FROM sites;

CREATE TABLE samples (
  sample_id INTEGER PRIMARY KEY,
  site_id INTEGER,
  sample_date TEXT
);

INSERT INTO samples (sample_id, site_id, sample_date)
VALUES
  (101, 1, '2026-10-05'),
  (102, 2, '2026-10-06'),
  (103, 3, '2026-10-07');

SELECT * FROM samples;

UPDATE samples
SET sample_date = '2026-10-08'
WHERE sample_id = 103;

SELECT * FROM samples;

INSERT INTO samples (sample_id, site_id, sample_date)
VALUES (999, 1, '2026-10-09');

SELECT * FROM samples;

DELETE FROM samples
WHERE sample_id = 999;

SELECT * FROM samples;