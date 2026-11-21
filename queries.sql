CREATE TABLE results (
  result_id INTEGER PRIMARY KEY,
  sample_id INTEGER,
  analyte TEXT,
  result REAL,
  action_limit REAL
);

INSERT INTO results (result_id, sample_id, analyte, result, action_limit)
VALUES
  (1, 101, 'Nitrate', 8.2, 10),
  (2, 101, 'Lead', 12.5, 15),
  (3, 101, 'Arsenic', 8, 10),
  (4, 102, 'Nitrate', 11.4, 10),
  (5, 102, 'Lead', 18.0, 15),
  (6, 102, 'Arsenic', 6, 10),
  (7, 103, 'Nitrate', 5.1, 10),
  (8, 103, 'Lead', 14.2, 15),
  (9, 103, 'Arsenic', 12, 10);

SELECT * FROM results;

SELECT samples.sample_id, samples.sample_date, results.analyte, results.result
FROM results
JOIN samples
  ON results.sample_id = samples.sample_id;

SELECT sites.site_name, COUNT(*) AS n
FROM results
JOIN samples
  ON results.sample_id = samples.sample_id
JOIN sites
  ON samples.site_id = sites.site_id
WHERE results.result > results.action_limit
GROUP BY sites.site_name;

INSERT INTO sites (site_id, site_name, site_type)
VALUES (4, 'Pond D', 'pond');

SELECT * FROM sites;

SELECT sites.site_name, samples.sample_id
FROM sites
JOIN samples
  ON sites.site_id = samples.site_id;

SELECT sites.site_name, samples.sample_id
FROM sites
LEFT JOIN samples
  ON sites.site_id = samples.site_id;

  SELECT sites.site_name, samples.sample_id
FROM sites
LEFT JOIN samples
  ON sites.site_id = samples.site_id
WHERE samples.sample_id IS NULL;