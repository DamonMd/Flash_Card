DROP TABLE IF EXISTS decks;
DROP TABLE IF EXISTS cards;


CREATE TABLE decks(
  id                SERIAL PRIMARY KEY,
  category          TEXT NOT NULL
);


CREATE TABLE cards(
  id                SERIAL PRIMARY KEY,
  card_front        TEXT NOT NULL,
  card_back         TEXT NOT NULL,
  guess_right       BOOLEAN NOT NULL,
  attemtps          INTEGER NOT NULL,
  deck_id           INTEGER NOT NULL
);

-- CREATE TABLE decks(
--   id                SERIAL PRIMARY KEY,
--   name              TEXT NOT NULL,
--   category          TEXT NOT NULL,
--   user_id           INTEGER NOT NULL
-- );
--
--
-- CREATE TABLE cards(
--   id                SERIAL PRIMARY KEY,
--   front             TEXT NOT NULL,
--   back              TEXT NOT NULL,
--   correct_answer    BOOLEAN NOT NULL,
--   attemtps          INTEGER NOT NULL,
--   deck_id           INTEGER NOT NULL
-- );
--
-- CREATE TABLE users(
--   id                SERIAL PRIMARY KEY,
--   name              TEXT NOT NULL,
--   score             TEXT NOT NULL
-- )
