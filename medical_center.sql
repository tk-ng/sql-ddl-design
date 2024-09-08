DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    practice TEXT

);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    insurance TEXT,
    birthday DATE
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    disease TEXT NOT NULL,
    description TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors (id) ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients (id),
    date DATE
);


CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits (id),
    disease_id INTEGER REFERENCES diseases (id),
    notes TEXT
);