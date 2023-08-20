-- CREATE TABLE IF NOT EXISTS comments ( id TEXT NOT NULL, subreddit TEXT NOT NULL, body TEXT NOT NULL, score INT NOT NULL, gilded INT NOT NULL, created_utc BIGINT NOT NULL, link_id TEXT NOT NULL, primary key (id, created_utc)) PARTITION BY RANGE (created_utc);
-- CREATE TABLE IF NOT EXISTS submissions ( id TEXT NOT NULL, subreddit TEXT NOT NULL, title TEXT NOT NULL, num_comments INT NOT NULL, score INT NOT NULL, gilded INT NOT NULL, created_utc BIGINT NOT NULL, self_text TEXT NOT NULL, primary key (id, created_utc)) PARTITION BY RANGE (created_utc);
CREATE TABLE IF NOT EXISTS comments ( id TEXT PRIMARY KEY, subreddit TEXT NOT NULL, body TEXT NOT NULL, score INT NOT NULL, gilded INT NOT NULL, created_utc BIGINT NOT NULL, link_id TEXT NOT NULL);
CREATE TABLE IF NOT EXISTS submissions ( id TEXT PRIMARY KEY, subreddit TEXT NOT NULL, title TEXT NOT NULL, num_comments INT NOT NULL, score INT NOT NULL, gilded INT NOT NULL, created_utc BIGINT NOT NULL, self_text TEXT NOT NULL);
CREATE INDEX IF NOT EXISTS submissions_idx on submissions(subreddit, created_utc);
CREATE INDEX IF NOT EXISTS comments_idx on comments(subreddit, created_utc);

ALTER TABLE comments ADD COLUMN IF NOT EXISTS ts tsvector GENERATED ALWAYS AS (to_tsvector('english', body)) STORED;
CREATE INDEX ts_comments_idx ON comments USING GIN (ts);

ALTER TABLE submissions ADD COLUMN IF NOT EXISTS ts tsvector GENERATED ALWAYS AS (to_tsvector('english', title || ' ' || self_text)) STORED;
CREATE INDEX ts_submissions_idx ON submissions USING GIN (ts);

-- CREATE TABLE IF NOT EXISTS comments_y2006 PARTITION OF comments
--     FOR VALUES FROM (1136073600) TO (1167609599);

-- CREATE TABLE IF NOT EXISTS comments_y2007 PARTITION OF comments
--     FOR VALUES FROM (1167609600) TO (1199145599);

-- CREATE TABLE IF NOT EXISTS comments_y2008 PARTITION OF comments
--     FOR VALUES FROM (1199145600) TO (1230767999);

-- CREATE TABLE IF NOT EXISTS comments_y2009 PARTITION OF comments
--     FOR VALUES FROM (1230768000) TO (1262303999);

-- CREATE TABLE IF NOT EXISTS comments_y2010 PARTITION OF comments
--     FOR VALUES FROM (1262304000) TO (1293839999);

-- CREATE TABLE IF NOT EXISTS comments_y2011 PARTITION OF comments
--     FOR VALUES FROM (1293840000) TO (1325375999);

-- CREATE TABLE IF NOT EXISTS comments_y2012 PARTITION OF comments
--     FOR VALUES FROM (1325376000) TO (1356998399);

-- CREATE TABLE IF NOT EXISTS comments_y2013 PARTITION OF comments
--     FOR VALUES FROM (1356998400) TO (1388534399);

-- CREATE TABLE IF NOT EXISTS comments_y2014 PARTITION OF comments
--     FOR VALUES FROM (1388534400) TO (1420070399);

-- CREATE TABLE IF NOT EXISTS comments_y2015 PARTITION OF comments
--     FOR VALUES FROM (1420070400) TO (1451606399);

-- CREATE TABLE IF NOT EXISTS comments_y2016 PARTITION OF comments
--     FOR VALUES FROM (1451606400) TO (1483228799);

-- CREATE TABLE IF NOT EXISTS comments_y2017 PARTITION OF comments
--     FOR VALUES FROM (1483228800) TO (1514764799);

-- CREATE TABLE IF NOT EXISTS comments_y2018 PARTITION OF comments
--     FOR VALUES FROM (1514764800) TO (1546300799);

-- CREATE TABLE IF NOT EXISTS comments_y2019 PARTITION OF comments
--     FOR VALUES FROM (1546300800) TO (1577836799);

-- CREATE TABLE IF NOT EXISTS comments_y2020 PARTITION OF comments
--     FOR VALUES FROM (1577836800) TO (1609459199);

-- CREATE TABLE IF NOT EXISTS comments_y2021 PARTITION OF comments
--     FOR VALUES FROM (1609459200) TO (1640995199);
    
-- CREATE TABLE IF NOT EXISTS comments_y2022 PARTITION OF comments
--     FOR VALUES FROM (1640995200) TO (1672531199);

-- CREATE TABLE IF NOT EXISTS comments_y2023 PARTITION OF comments
--     FOR VALUES FROM (1672531200) TO (1703980800);


-- CREATE TABLE IF NOT EXISTS submissions_y2006 PARTITION OF submissions
--     FOR VALUES FROM (1136073600) TO (1167609599);

-- CREATE TABLE IF NOT EXISTS submissions_y2007 PARTITION OF submissions
--     FOR VALUES FROM (1167609600) TO (1199145599);

-- CREATE TABLE IF NOT EXISTS submissions_y2008 PARTITION OF submissions
--     FOR VALUES FROM (1199145600) TO (1230767999);

-- CREATE TABLE IF NOT EXISTS submissions_y2009 PARTITION OF submissions
--     FOR VALUES FROM (1230768000) TO (1262303999);

-- CREATE TABLE IF NOT EXISTS submissions_y2010 PARTITION OF submissions
--     FOR VALUES FROM (1262304000) TO (1293839999);

-- CREATE TABLE IF NOT EXISTS submissions_y2011 PARTITION OF submissions
--     FOR VALUES FROM (1293840000) TO (1325375999);

-- CREATE TABLE IF NOT EXISTS submissions_y2012 PARTITION OF submissions
--     FOR VALUES FROM (1325376000) TO (1356998399);

-- CREATE TABLE IF NOT EXISTS submissions_y2013 PARTITION OF submissions
--     FOR VALUES FROM (1356998400) TO (1388534399);

-- CREATE TABLE IF NOT EXISTS submissions_y2014 PARTITION OF submissions
--     FOR VALUES FROM (1388534400) TO (1420070399);

-- CREATE TABLE IF NOT EXISTS submissions_y2015 PARTITION OF submissions
--     FOR VALUES FROM (1420070400) TO (1451606399);

-- CREATE TABLE IF NOT EXISTS submissions_y2016 PARTITION OF submissions
--     FOR VALUES FROM (1451606400) TO (1483228799);

-- CREATE TABLE IF NOT EXISTS submissions_y2017 PARTITION OF submissions
--     FOR VALUES FROM (1483228800) TO (1514764799);

-- CREATE TABLE IF NOT EXISTS submissions_y2018 PARTITION OF submissions
--     FOR VALUES FROM (1514764800) TO (1546300799);

-- CREATE TABLE IF NOT EXISTS submissions_y2019 PARTITION OF submissions
--     FOR VALUES FROM (1546300800) TO (1577836799);

-- CREATE TABLE IF NOT EXISTS submissions_y2020 PARTITION OF submissions
--     FOR VALUES FROM (1577836800) TO (1609459199);

-- CREATE TABLE IF NOT EXISTS submissions_y2021 PARTITION OF submissions
--     FOR VALUES FROM (1609459200) TO (1640995199);
    
-- CREATE TABLE IF NOT EXISTS submissions_y2022 PARTITION OF submissions
--     FOR VALUES FROM (1640995200) TO (1672531199);

-- CREATE TABLE IF NOT EXISTS submissions_y2023 PARTITION OF submissions
--     FOR VALUES FROM (1672531200) TO (1703980800);