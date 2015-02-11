--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: authors; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authors_id_seq OWNED BY authors.id;


--
-- Name: authorships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE authorships (
    author_id integer NOT NULL,
    zine_id integer NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    zine_id integer,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: faves; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE faves (
    id integer NOT NULL,
    user_id integer,
    zine_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: faves_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE faves_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: faves_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE faves_id_seq OWNED BY faves.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255),
    user_id integer,
    zine_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: zines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE zines (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    subtitle character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    published boolean DEFAULT true,
    full_text text,
    excerpt text,
    cover_image character varying(255),
    download_url character varying(255),
    added_at timestamp without time zone,
    author_count integer DEFAULT 0 NOT NULL,
    pdf character varying(255),
    legacy_id integer
);


--
-- Name: zines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE zines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE zines_id_seq OWNED BY zines.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authors ALTER COLUMN id SET DEFAULT nextval('authors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY faves ALTER COLUMN id SET DEFAULT nextval('faves_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY zines ALTER COLUMN id SET DEFAULT nextval('zines_id_seq'::regclass);


--
-- Name: authors_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: faves_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY faves
    ADD CONSTRAINT faves_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: zines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY zines
    ADD CONSTRAINT zines_pkey PRIMARY KEY (id);


--
-- Name: index_authorships_on_author_id_and_zine_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_authorships_on_author_id_and_zine_id ON authorships USING btree (author_id, zine_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20120731194612');

INSERT INTO schema_migrations (version) VALUES ('20120807230856');

INSERT INTO schema_migrations (version) VALUES ('20120807235529');

INSERT INTO schema_migrations (version) VALUES ('20130712024012');

INSERT INTO schema_migrations (version) VALUES ('20130712024747');

INSERT INTO schema_migrations (version) VALUES ('20130807045026');

INSERT INTO schema_migrations (version) VALUES ('20130807045520');

INSERT INTO schema_migrations (version) VALUES ('20130807045721');

INSERT INTO schema_migrations (version) VALUES ('20130808184644');

INSERT INTO schema_migrations (version) VALUES ('20130808185018');

INSERT INTO schema_migrations (version) VALUES ('20130808185139');

INSERT INTO schema_migrations (version) VALUES ('20130808233630');

INSERT INTO schema_migrations (version) VALUES ('20130808234007');

INSERT INTO schema_migrations (version) VALUES ('20130818052302');

INSERT INTO schema_migrations (version) VALUES ('20131207055245');

INSERT INTO schema_migrations (version) VALUES ('20131208121036');

INSERT INTO schema_migrations (version) VALUES ('20131222060227');

INSERT INTO schema_migrations (version) VALUES ('20131222103406');

INSERT INTO schema_migrations (version) VALUES ('20131225044554');

INSERT INTO schema_migrations (version) VALUES ('20131225081502');

INSERT INTO schema_migrations (version) VALUES ('20140208125824');

INSERT INTO schema_migrations (version) VALUES ('20140330045329');

INSERT INTO schema_migrations (version) VALUES ('20140603041645');

INSERT INTO schema_migrations (version) VALUES ('20140622053608');

