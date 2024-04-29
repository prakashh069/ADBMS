CREATE TABLE Match (
    match_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE Score (
    match_id INTEGER REFERENCES Match(match_id) ON DELETE CASCADE,
    team VARCHAR(50) NOT NULL,
    score INTEGER NOT NULL,
    PRIMARY KEY (match_id, team)
);

CREATE TABLE Player (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50) NOT NULL
);

CREATE TABLE Match_Player (
    match_id INTEGER REFERENCES Match(match_id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES Player(player_id) ON DELETE CASCADE,
    PRIMARY KEY (match_id, player_id)
);

CREATE TABLE Player_Stats (
    match_id INTEGER REFERENCES Match(match_id) ON DELETE CASCADE,
    player_id INTEGER REFERENCES Player(player_id) ON DELETE CASCADE,
    goals INTEGER DEFAULT 0,
    assists INTEGER DEFAULT 0,
    shots INTEGER DEFAULT 0,
    saves INTEGER DEFAULT 0,
    PRIMARY KEY (match_id, player_id)
);
