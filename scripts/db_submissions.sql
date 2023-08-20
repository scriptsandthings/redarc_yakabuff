CREATE TABLE IF NOT EXISTS submissions ( id TEXT PRIMARY KEY, subreddit TEXT NOT NULL, title TEXT NOT NULL, author TEXT NOT NULL, permalink TEXT NOT NULL, thumbnail TEXT, num_comments INT NOT NULL, URL TEXT NOT NULL, score INT NOT NULL, gilded INT, created_utc BIGINT NOT NULL, self_text TEXT, is_self bool NOT NULL, retrieved_utc BIGINT NOT NULL);
