DROP TABLE foreign_exchange;

CREATE TABLE foreign_exchange (
  id SERIAL PRIMARY KEY,
  country_name VARCHAR(255),
  currency VARCAHR(255),
  rate INT
);
