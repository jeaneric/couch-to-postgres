CREATE SCHEMA mobile_json
    AUTHORIZATION postgres;
CREATE TABLE mobile_json.since_checkpoints
(
  pgtable text NOT NULL,
  since numeric DEFAULT 0,
  enabled boolean DEFAULT false, --not used in the simple client example
  CONSTRAINT since_checkpoint_pkey PRIMARY KEY (pgtable)
);
grant select, update, delete, insert on table mobile_json.since_checkpoints to webuser;

CREATE USER mobilesync WITH
password 'uQUp9Btch3bp3F717qHR'
  LOGIN
  NOSUPERUSER
  INHERIT 
  in role webuser
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;
ALTER role mobilesync
    SET search_path TO mobile_json, public;
Grant all on schema mobile_json to mobilesync;
ALTER TABLE mobile_json.since_checkpoints
    alter column since TYPE text ;
ALTER TABLE mobile_json.since_checkpoints
    alter column since set DEFAULT '0';
    
    
-- ************** example:
INSERT INTO mobile_json.since_checkpoints(pgtable, enabled) VALUES ('form_cji3iw6ps00b3iatej4231l8d', true);