-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  name TEXT,
  galaxy_id INTEGER REFERENCES galaxies
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around INTEGER REFERENCES stars
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');


INSERT INTO stars
  (name, galaxy_id)
VALUES
  ('The Sun',1),
  ('Proxima Centauri',1),
  ('Gliese 876',1);


INSERT INTO planets
  (name, orbital_period_in_years, orbits_around)
VALUES
  ('Earth', 1.00, 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 1),
  ('Proxima Centauri b', 0.03, 2),
  ('Gliese 876 b', 0.23, 3);

INSERT INTO moons
  (name, planet_id)
VALUES
  ('The Moon', 1),
  ('Phobos', 2),
  ('Deimos', 2),
  ('Naiad', 4),
  ('Thalassa', 4),
  ('Despina', 4),
  ('Galatea', 4),
  ('Larissa', 4),
  ('S/2004 N 1', 4),
  ('Proteus', 4),
  ('Triton', 4),
  ('Nereid', 4),
  ('Halimede', 4),
  ('Sao', 4),
  ('Laomedeia', 4),
  ('Psamathe', 4),
  ('Neso', 4);

-- SELECT
--     p.id,
--     p.name,
--     p.orbital_period_in_years,
--     s.name AS orbits_around,
--     g.name AS galaxy,
--     CASE
--       WHEN COUNT(m.name) = 0 THEN NULL
--       ELSE ARRAY_AGG(m.name)
--     END AS moons
-- FROM
--     planets p
-- JOIN
--     stars s ON p.orbits_around = s.id
-- JOIN
--     galaxies g ON s.galaxy_id = g.id
-- LEFT JOIN
--     moons m ON m.planet_id = p.id
-- GROUP BY
--     p.id, p.name, p.orbital_period_in_years, s.name, g.name
-- ORDER BY
--     p.id;