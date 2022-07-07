-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- object: "inventor++" | type: ROLE --
-- DROP ROLE IF EXISTS "inventor++";
CREATE ROLE "inventor++" WITH 
	CREATEDB
	INHERIT
	LOGIN
	REPLICATION
	ENCRYPTED PASSWORD '********';
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: registration_system | type: DATABASE --
-- DROP DATABASE IF EXISTS registration_system;
CREATE DATABASE registration_system
	ENCODING = 'UTF8'
	LC_COLLATE = 'English_Uganda.1252'
	LC_CTYPE = 'English_Uganda.1252'
	TABLESPACE = pg_default
	OWNER = postgres
	CONNECTION LIMIT = 10;
-- ddl-end --


-- object: public.administrators_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.administrators_id_seq CASCADE;
CREATE SEQUENCE public.administrators_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 32767
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.administrators_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.administrators | type: TABLE --
-- DROP TABLE IF EXISTS public.administrators CASCADE;
CREATE TABLE public.administrators (
	id smallint NOT NULL DEFAULT nextval('public.administrators_id_seq'::regclass),
	username character varying(50) NOT NULL,
	password character varying(25) NOT NULL,
	CONSTRAINT pk_administrators PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
);
-- ddl-end --
COMMENT ON TABLE public.administrators IS E'This table stores the administrators of the technology.';
-- ddl-end --
ALTER TABLE public.administrators OWNER TO postgres;
-- ddl-end --

-- object: public.users_id_seq | type: SEQUENCE --
-- DROP SEQUENCE IF EXISTS public.users_id_seq CASCADE;
CREATE SEQUENCE public.users_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 32767
	START WITH 1
	CACHE 1
	NO CYCLE
	OWNED BY NONE;

-- ddl-end --
ALTER SEQUENCE public.users_id_seq OWNER TO postgres;
-- ddl-end --

-- object: public.users | type: TABLE --
-- DROP TABLE IF EXISTS public.users CASCADE;
CREATE TABLE public.users (
	id smallint NOT NULL DEFAULT nextval('public.users_id_seq'::regclass),
	first_name character varying(50) NOT NULL,
	surname character varying(50) NOT NULL,
	email character varying(50) NOT NULL,
	id_administrators smallint,
	CONSTRAINT pk_users PRIMARY KEY (id)
	 WITH (FILLFACTOR = 100)
);
-- ddl-end --
COMMENT ON TABLE public.users IS E'This table stores the users of the technology.';
-- ddl-end --
ALTER TABLE public.users OWNER TO postgres;
-- ddl-end --

-- object: administrators_fk | type: CONSTRAINT --
-- ALTER TABLE public.users DROP CONSTRAINT IF EXISTS administrators_fk CASCADE;
ALTER TABLE public.users ADD CONSTRAINT administrators_fk FOREIGN KEY (id_administrators)
REFERENCES public.administrators (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "grant_CU_eb94f049ac" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO postgres;
-- ddl-end --

-- object: "grant_CU_cd8e46e7b6" | type: PERMISSION --
GRANT CREATE,USAGE
   ON SCHEMA public
   TO PUBLIC;
-- ddl-end --


