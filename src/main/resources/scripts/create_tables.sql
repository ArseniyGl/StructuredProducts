CREATE DATABASE structuredproducts OWNER postgres;

\c structuredproducts;

CREATE SCHEMA INSTRUMENT;

CREATE TABLE INSTRUMENT.PRODUCT_TYPE (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.TERM (
  id SERIAL PRIMARY KEY,
  min SMALLINT,
  max SMALLINT
);

CREATE TABLE INSTRUMENT.UNDERLAYING_TYPE (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.UNDERLAYING (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type INTEGER REFERENCES INSTRUMENT.UNDERLAYING_TYPE (id)
);

CREATE TABLE INSTRUMENT.INVESTMENT (
  id SERIAL PRIMARY KEY,
  min INTEGER,
  max INTEGER
);

CREATE TABLE INSTRUMENT.ISSUER (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.RETURN (
  id SERIAL PRIMARY KEY,
  count SMALLINT NOT NULL
);

CREATE TABLE INSTRUMENT.STRATEGY (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.LEGAL_TYPE (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.PAYOFF (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.RISKS (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.CURRENCY (
  id SERIAL PRIMARY KEY,
  name VARCHAR (3) NOT NULL
);

CREATE TABLE INSTRUMENT.PAYMENT_PERIODICITY (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.PRODUCT (
  id SERIAL PRIMARY KEY,
  productType INTEGER REFERENCES INSTRUMENT.PRODUCT_TYPE (id) NOT NULL ,
  term INTEGER REFERENCES INSTRUMENT.TERM (id) NOT NULL,
  underlaying INTEGER REFERENCES INSTRUMENT.UNDERLAYING (id) NOT NULL,
  investment INTEGER REFERENCES INSTRUMENT.INVESTMENT (id) NOT NULL,
  issuer INTEGER REFERENCES INSTRUMENT.ISSUER (id) NOT NULL,
  return INTEGER REFERENCES INSTRUMENT.RETURN (id) NOT NULL,
  strategy INTEGER REFERENCES INSTRUMENT.STRATEGY (id) NOT NULL,
  legalType INTEGER REFERENCES INSTRUMENT.LEGAL_TYPE (id) NOT NULL,
  payoff INTEGER REFERENCES INSTRUMENT.PAYOFF (id) NOT NULL,
  risks INTEGER REFERENCES INSTRUMENT.RISKS (id) NOT NULL,
  currency INTEGER REFERENCES INSTRUMENT.CURRENCY (id) NOT NULL,
  paymentPeriodicity INTEGER REFERENCES INSTRUMENT.PAYMENT_PERIODICITY (id) NOT NULL
);

ALTER TABLE INSTRUMENT.PRODUCT ADD COLUMN name TEXT;
ALTER TABLE INSTRUMENT.PRODUCT ADD COLUMN description TEXT;

CREATE TABLE INSTRUMENT.TOP_PRODUCT (
  id SERIAL PRIMARY KEY,
  product INTEGER REFERENCES INSTRUMENT.PRODUCT (id),
  time TEXT NOT NULL
);

CREATE TABLE INSTRUMENT.BROKER (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  logo TEXT
);

CREATE TABLE INSTRUMENT.INVEST_IDEA (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  addDate DATE,
  content TEXT NOT NULL,
  mainPage BOOLEAN NOT NULL,
  broker INTEGER REFERENCES INSTRUMENT.BROKER(id)
);

ALTER TABLE INSTRUMENT.PRODUCT DROP COLUMN description;
CREATE TABLE INSTRUMENT.PRODUCT_PARAMS(
  product INTEGER REFERENCES INSTRUMENT.PRODUCT(id) PRIMARY KEY,
  chart TEXT,
  img TEXT,
  description TEXT,
  forecast TEXT
);
