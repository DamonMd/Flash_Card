DROP TABLE IF EXISTS decks;
DROP TABLE IF EXISTS cards;


CREATE TABLE decks(
  id                SERIAL PRIMARY KEY,
  name              TEXT NOT NULL
);


CREATE TABLE cards(
  id                SERIAL PRIMARY KEY,
  front             TEXT NOT NULL,
  back              TEXT NOT NULL,
  score             INTEGER NOT NULL,
  attempts          INTEGER NOT NULL,
  deck_id           INTEGER NOT NULL
);
