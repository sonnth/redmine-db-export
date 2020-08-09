--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3 (Debian 12.3-1.pgdg100+1)
-- Dumped by pg_dump version 12.3 (Debian 12.3-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attachments (
    id integer NOT NULL,
    container_id integer,
    container_type character varying(30),
    filename character varying DEFAULT ''::character varying NOT NULL,
    disk_filename character varying DEFAULT ''::character varying NOT NULL,
    filesize bigint DEFAULT 0 NOT NULL,
    content_type character varying DEFAULT ''::character varying,
    digest character varying(64) DEFAULT ''::character varying NOT NULL,
    downloads integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    description character varying,
    disk_directory character varying
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.attachments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.attachments_id_seq OWNED BY public.attachments.id;


--
-- Name: auth_sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_sources (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    host character varying(60),
    port integer,
    account character varying,
    account_password character varying DEFAULT ''::character varying,
    base_dn character varying(255),
    attr_login character varying(30),
    attr_firstname character varying(30),
    attr_lastname character varying(30),
    attr_mail character varying(30),
    onthefly_register boolean DEFAULT false NOT NULL,
    tls boolean DEFAULT false NOT NULL,
    filter text,
    timeout integer,
    verify_peer boolean DEFAULT true NOT NULL
);


ALTER TABLE public.auth_sources OWNER TO postgres;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_sources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_sources_id_seq OWNER TO postgres;

--
-- Name: auth_sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_sources_id_seq OWNED BY public.auth_sources.id;


--
-- Name: boards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boards (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying,
    "position" integer,
    topics_count integer DEFAULT 0 NOT NULL,
    messages_count integer DEFAULT 0 NOT NULL,
    last_message_id integer,
    parent_id integer
);


ALTER TABLE public.boards OWNER TO postgres;

--
-- Name: boards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.boards_id_seq OWNER TO postgres;

--
-- Name: boards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boards_id_seq OWNED BY public.boards.id;


--
-- Name: changes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changes (
    id integer NOT NULL,
    changeset_id integer NOT NULL,
    action character varying(1) DEFAULT ''::character varying NOT NULL,
    path text NOT NULL,
    from_path text,
    from_revision character varying,
    revision character varying,
    branch character varying
);


ALTER TABLE public.changes OWNER TO postgres;

--
-- Name: changes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changes_id_seq OWNER TO postgres;

--
-- Name: changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changes_id_seq OWNED BY public.changes.id;


--
-- Name: changeset_parents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changeset_parents (
    changeset_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.changeset_parents OWNER TO postgres;

--
-- Name: changesets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changesets (
    id integer NOT NULL,
    repository_id integer NOT NULL,
    revision character varying NOT NULL,
    committer character varying,
    committed_on timestamp without time zone NOT NULL,
    comments text,
    commit_date date,
    scmid character varying,
    user_id integer
);


ALTER TABLE public.changesets OWNER TO postgres;

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.changesets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.changesets_id_seq OWNER TO postgres;

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.changesets_id_seq OWNED BY public.changesets.id;


--
-- Name: changesets_issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.changesets_issues (
    changeset_id integer NOT NULL,
    issue_id integer NOT NULL
);


ALTER TABLE public.changesets_issues OWNER TO postgres;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    commented_type character varying(30) DEFAULT ''::character varying NOT NULL,
    commented_id integer DEFAULT 0 NOT NULL,
    author_id integer DEFAULT 0 NOT NULL,
    content text,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: custom_field_enumerations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_field_enumerations (
    id integer NOT NULL,
    custom_field_id integer NOT NULL,
    name character varying NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.custom_field_enumerations OWNER TO postgres;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_field_enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_field_enumerations_id_seq OWNER TO postgres;

--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_field_enumerations_id_seq OWNED BY public.custom_field_enumerations.id;


--
-- Name: custom_fields; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields (
    id integer NOT NULL,
    type character varying(30) DEFAULT ''::character varying NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    field_format character varying(30) DEFAULT ''::character varying NOT NULL,
    possible_values text,
    regexp character varying DEFAULT ''::character varying,
    min_length integer,
    max_length integer,
    is_required boolean DEFAULT false NOT NULL,
    is_for_all boolean DEFAULT false NOT NULL,
    is_filter boolean DEFAULT false NOT NULL,
    "position" integer,
    searchable boolean DEFAULT false,
    default_value text,
    editable boolean DEFAULT true,
    visible boolean DEFAULT true NOT NULL,
    multiple boolean DEFAULT false,
    format_store text,
    description text
);


ALTER TABLE public.custom_fields OWNER TO postgres;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_fields_id_seq OWNER TO postgres;

--
-- Name: custom_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_fields_id_seq OWNED BY public.custom_fields.id;


--
-- Name: custom_fields_projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_projects (
    custom_field_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_projects OWNER TO postgres;

--
-- Name: custom_fields_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_roles (
    custom_field_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.custom_fields_roles OWNER TO postgres;

--
-- Name: custom_fields_trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_fields_trackers (
    custom_field_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.custom_fields_trackers OWNER TO postgres;

--
-- Name: custom_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.custom_values (
    id integer NOT NULL,
    customized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    customized_id integer DEFAULT 0 NOT NULL,
    custom_field_id integer DEFAULT 0 NOT NULL,
    value text
);


ALTER TABLE public.custom_values OWNER TO postgres;

--
-- Name: custom_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.custom_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custom_values_id_seq OWNER TO postgres;

--
-- Name: custom_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.custom_values_id_seq OWNED BY public.custom_values.id;


--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    category_id integer DEFAULT 0 NOT NULL,
    title character varying DEFAULT ''::character varying NOT NULL,
    description text,
    created_on timestamp without time zone
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.documents_id_seq OWNER TO postgres;

--
-- Name: documents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;


--
-- Name: email_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_addresses (
    id integer NOT NULL,
    user_id integer NOT NULL,
    address character varying NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    notify boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL
);


ALTER TABLE public.email_addresses OWNER TO postgres;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.email_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_addresses_id_seq OWNER TO postgres;

--
-- Name: email_addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.email_addresses_id_seq OWNED BY public.email_addresses.id;


--
-- Name: enabled_modules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enabled_modules (
    id integer NOT NULL,
    project_id integer,
    name character varying NOT NULL
);


ALTER TABLE public.enabled_modules OWNER TO postgres;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enabled_modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enabled_modules_id_seq OWNER TO postgres;

--
-- Name: enabled_modules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enabled_modules_id_seq OWNED BY public.enabled_modules.id;


--
-- Name: enumerations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enumerations (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    is_default boolean DEFAULT false NOT NULL,
    type character varying,
    active boolean DEFAULT true NOT NULL,
    project_id integer,
    parent_id integer,
    position_name character varying(30)
);


ALTER TABLE public.enumerations OWNER TO postgres;

--
-- Name: enumerations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enumerations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enumerations_id_seq OWNER TO postgres;

--
-- Name: enumerations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enumerations_id_seq OWNED BY public.enumerations.id;


--
-- Name: groups_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_users (
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.groups_users OWNER TO postgres;

--
-- Name: import_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.import_items (
    id integer NOT NULL,
    import_id integer NOT NULL,
    "position" integer NOT NULL,
    obj_id integer,
    message text,
    unique_id character varying
);


ALTER TABLE public.import_items OWNER TO postgres;

--
-- Name: import_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.import_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.import_items_id_seq OWNER TO postgres;

--
-- Name: import_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.import_items_id_seq OWNED BY public.import_items.id;


--
-- Name: imports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imports (
    id integer NOT NULL,
    type character varying,
    user_id integer NOT NULL,
    filename character varying,
    settings text,
    total_items integer,
    finished boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.imports OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imports_id_seq OWNER TO postgres;

--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imports_id_seq OWNED BY public.imports.id;


--
-- Name: issue_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_categories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying(60) DEFAULT ''::character varying NOT NULL,
    assigned_to_id integer
);


ALTER TABLE public.issue_categories OWNER TO postgres;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_categories_id_seq OWNER TO postgres;

--
-- Name: issue_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_categories_id_seq OWNED BY public.issue_categories.id;


--
-- Name: issue_relations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_relations (
    id integer NOT NULL,
    issue_from_id integer NOT NULL,
    issue_to_id integer NOT NULL,
    relation_type character varying DEFAULT ''::character varying NOT NULL,
    delay integer
);


ALTER TABLE public.issue_relations OWNER TO postgres;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_relations_id_seq OWNER TO postgres;

--
-- Name: issue_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_relations_id_seq OWNED BY public.issue_relations.id;


--
-- Name: issue_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issue_statuses (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_closed boolean DEFAULT false NOT NULL,
    "position" integer,
    default_done_ratio integer
);


ALTER TABLE public.issue_statuses OWNER TO postgres;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issue_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issue_statuses_id_seq OWNER TO postgres;

--
-- Name: issue_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issue_statuses_id_seq OWNED BY public.issue_statuses.id;


--
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    id integer NOT NULL,
    tracker_id integer NOT NULL,
    project_id integer NOT NULL,
    subject character varying DEFAULT ''::character varying NOT NULL,
    description text,
    due_date date,
    category_id integer,
    status_id integer NOT NULL,
    assigned_to_id integer,
    priority_id integer NOT NULL,
    fixed_version_id integer,
    author_id integer NOT NULL,
    lock_version integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    start_date date,
    done_ratio integer DEFAULT 0 NOT NULL,
    estimated_hours double precision,
    parent_id integer,
    root_id integer,
    lft integer,
    rgt integer,
    is_private boolean DEFAULT false NOT NULL,
    closed_on timestamp without time zone
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.issues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.issues_id_seq OWNER TO postgres;

--
-- Name: issues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.issues_id_seq OWNED BY public.issues.id;


--
-- Name: journal_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journal_details (
    id integer NOT NULL,
    journal_id integer DEFAULT 0 NOT NULL,
    property character varying(30) DEFAULT ''::character varying NOT NULL,
    prop_key character varying(30) DEFAULT ''::character varying NOT NULL,
    old_value text,
    value text
);


ALTER TABLE public.journal_details OWNER TO postgres;

--
-- Name: journal_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journal_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journal_details_id_seq OWNER TO postgres;

--
-- Name: journal_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journal_details_id_seq OWNED BY public.journal_details.id;


--
-- Name: journals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.journals (
    id integer NOT NULL,
    journalized_id integer DEFAULT 0 NOT NULL,
    journalized_type character varying(30) DEFAULT ''::character varying NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    notes text,
    created_on timestamp without time zone NOT NULL,
    private_notes boolean DEFAULT false NOT NULL
);


ALTER TABLE public.journals OWNER TO postgres;

--
-- Name: journals_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.journals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journals_id_seq OWNER TO postgres;

--
-- Name: journals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.journals_id_seq OWNED BY public.journals.id;


--
-- Name: member_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member_roles (
    id integer NOT NULL,
    member_id integer NOT NULL,
    role_id integer NOT NULL,
    inherited_from integer
);


ALTER TABLE public.member_roles OWNER TO postgres;

--
-- Name: member_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.member_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.member_roles_id_seq OWNER TO postgres;

--
-- Name: member_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.member_roles_id_seq OWNED BY public.member_roles.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    mail_notification boolean DEFAULT false NOT NULL
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    board_id integer NOT NULL,
    parent_id integer,
    subject character varying DEFAULT ''::character varying NOT NULL,
    content text,
    author_id integer,
    replies_count integer DEFAULT 0 NOT NULL,
    last_reply_id integer,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    locked boolean DEFAULT false,
    sticky integer DEFAULT 0
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news (
    id integer NOT NULL,
    project_id integer,
    title character varying(60) DEFAULT ''::character varying NOT NULL,
    summary character varying(255) DEFAULT ''::character varying,
    description text,
    author_id integer DEFAULT 0 NOT NULL,
    created_on timestamp without time zone,
    comments_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.news OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.news_id_seq OWNER TO postgres;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: open_id_authentication_associations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.open_id_authentication_associations (
    id integer NOT NULL,
    issued integer,
    lifetime integer,
    handle character varying,
    assoc_type character varying,
    server_url bytea,
    secret bytea
);


ALTER TABLE public.open_id_authentication_associations OWNER TO postgres;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.open_id_authentication_associations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_associations_id_seq OWNER TO postgres;

--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.open_id_authentication_associations_id_seq OWNED BY public.open_id_authentication_associations.id;


--
-- Name: open_id_authentication_nonces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.open_id_authentication_nonces (
    id integer NOT NULL,
    "timestamp" integer NOT NULL,
    server_url character varying,
    salt character varying NOT NULL
);


ALTER TABLE public.open_id_authentication_nonces OWNER TO postgres;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.open_id_authentication_nonces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.open_id_authentication_nonces_id_seq OWNER TO postgres;

--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.open_id_authentication_nonces_id_seq OWNED BY public.open_id_authentication_nonces.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description text,
    homepage character varying DEFAULT ''::character varying,
    is_public boolean DEFAULT true NOT NULL,
    parent_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    identifier character varying,
    status integer DEFAULT 1 NOT NULL,
    lft integer,
    rgt integer,
    inherit_members boolean DEFAULT false NOT NULL,
    default_version_id integer,
    default_assigned_to_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: projects_trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects_trackers (
    project_id integer DEFAULT 0 NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.projects_trackers OWNER TO postgres;

--
-- Name: queries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.queries (
    id integer NOT NULL,
    project_id integer,
    name character varying DEFAULT ''::character varying NOT NULL,
    filters text,
    user_id integer DEFAULT 0 NOT NULL,
    column_names text,
    sort_criteria text,
    group_by character varying,
    type character varying,
    visibility integer DEFAULT 0,
    options text
);


ALTER TABLE public.queries OWNER TO postgres;

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.queries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.queries_id_seq OWNER TO postgres;

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.queries_id_seq OWNED BY public.queries.id;


--
-- Name: queries_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.queries_roles (
    query_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.queries_roles OWNER TO postgres;

--
-- Name: repositories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.repositories (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    url character varying DEFAULT ''::character varying NOT NULL,
    login character varying(60) DEFAULT ''::character varying,
    password character varying DEFAULT ''::character varying,
    root_url character varying(255) DEFAULT ''::character varying,
    type character varying,
    path_encoding character varying(64) DEFAULT NULL::character varying,
    log_encoding character varying(64) DEFAULT NULL::character varying,
    extra_info text,
    identifier character varying,
    is_default boolean DEFAULT false,
    created_on timestamp without time zone
);


ALTER TABLE public.repositories OWNER TO postgres;

--
-- Name: repositories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.repositories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repositories_id_seq OWNER TO postgres;

--
-- Name: repositories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.repositories_id_seq OWNED BY public.repositories.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    "position" integer,
    assignable boolean DEFAULT true,
    builtin integer DEFAULT 0 NOT NULL,
    permissions text,
    issues_visibility character varying(30) DEFAULT 'default'::character varying NOT NULL,
    users_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    time_entries_visibility character varying(30) DEFAULT 'all'::character varying NOT NULL,
    all_roles_managed boolean DEFAULT true NOT NULL,
    settings text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: roles_managed_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles_managed_roles (
    role_id integer NOT NULL,
    managed_role_id integer NOT NULL
);


ALTER TABLE public.roles_managed_roles OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    value text,
    updated_on timestamp without time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: time_entries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.time_entries (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    issue_id integer,
    hours double precision NOT NULL,
    comments character varying(1024),
    activity_id integer NOT NULL,
    spent_on date NOT NULL,
    tyear integer NOT NULL,
    tmonth integer NOT NULL,
    tweek integer NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone NOT NULL,
    author_id integer
);


ALTER TABLE public.time_entries OWNER TO postgres;

--
-- Name: time_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.time_entries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.time_entries_id_seq OWNER TO postgres;

--
-- Name: time_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.time_entries_id_seq OWNED BY public.time_entries.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    action character varying(30) DEFAULT ''::character varying NOT NULL,
    value character varying(40) DEFAULT ''::character varying NOT NULL,
    created_on timestamp without time zone NOT NULL,
    updated_on timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trackers (
    id integer NOT NULL,
    name character varying(30) DEFAULT ''::character varying NOT NULL,
    is_in_chlog boolean DEFAULT false NOT NULL,
    "position" integer,
    is_in_roadmap boolean DEFAULT true NOT NULL,
    fields_bits integer DEFAULT 0,
    default_status_id integer,
    description character varying
);


ALTER TABLE public.trackers OWNER TO postgres;

--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trackers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trackers_id_seq OWNER TO postgres;

--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- Name: user_preferences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_preferences (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    others text,
    hide_mail boolean DEFAULT true,
    time_zone character varying
);


ALTER TABLE public.user_preferences OWNER TO postgres;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_preferences_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preferences_id_seq OWNER TO postgres;

--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_preferences_id_seq OWNED BY public.user_preferences.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying DEFAULT ''::character varying NOT NULL,
    hashed_password character varying(40) DEFAULT ''::character varying NOT NULL,
    firstname character varying(30) DEFAULT ''::character varying NOT NULL,
    lastname character varying(255) DEFAULT ''::character varying NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    status integer DEFAULT 1 NOT NULL,
    last_login_on timestamp without time zone,
    language character varying(5) DEFAULT ''::character varying,
    auth_source_id integer,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    type character varying,
    identity_url character varying,
    mail_notification character varying DEFAULT ''::character varying NOT NULL,
    salt character varying(64),
    must_change_passwd boolean DEFAULT false NOT NULL,
    passwd_changed_on timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versions (
    id integer NOT NULL,
    project_id integer DEFAULT 0 NOT NULL,
    name character varying DEFAULT ''::character varying NOT NULL,
    description character varying DEFAULT ''::character varying,
    effective_date date,
    created_on timestamp without time zone,
    updated_on timestamp without time zone,
    wiki_page_title character varying,
    status character varying DEFAULT 'open'::character varying,
    sharing character varying DEFAULT 'none'::character varying NOT NULL
);


ALTER TABLE public.versions OWNER TO postgres;

--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versions_id_seq OWNER TO postgres;

--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: watchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    watchable_type character varying DEFAULT ''::character varying NOT NULL,
    watchable_id integer DEFAULT 0 NOT NULL,
    user_id integer
);


ALTER TABLE public.watchers OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.watchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.watchers_id_seq OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: wiki_content_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_content_versions (
    id integer NOT NULL,
    wiki_content_id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    data bytea,
    compression character varying(6) DEFAULT ''::character varying,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_content_versions OWNER TO postgres;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_content_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_content_versions_id_seq OWNER TO postgres;

--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_content_versions_id_seq OWNED BY public.wiki_content_versions.id;


--
-- Name: wiki_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_contents (
    id integer NOT NULL,
    page_id integer NOT NULL,
    author_id integer,
    text text,
    comments character varying(1024) DEFAULT ''::character varying,
    updated_on timestamp without time zone NOT NULL,
    version integer NOT NULL
);


ALTER TABLE public.wiki_contents OWNER TO postgres;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_contents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_contents_id_seq OWNER TO postgres;

--
-- Name: wiki_contents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_contents_id_seq OWNED BY public.wiki_contents.id;


--
-- Name: wiki_pages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_pages (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    protected boolean DEFAULT false NOT NULL,
    parent_id integer
);


ALTER TABLE public.wiki_pages OWNER TO postgres;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_pages_id_seq OWNER TO postgres;

--
-- Name: wiki_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_pages_id_seq OWNED BY public.wiki_pages.id;


--
-- Name: wiki_redirects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wiki_redirects (
    id integer NOT NULL,
    wiki_id integer NOT NULL,
    title character varying,
    redirects_to character varying,
    created_on timestamp without time zone NOT NULL,
    redirects_to_wiki_id integer NOT NULL
);


ALTER TABLE public.wiki_redirects OWNER TO postgres;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wiki_redirects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wiki_redirects_id_seq OWNER TO postgres;

--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wiki_redirects_id_seq OWNED BY public.wiki_redirects.id;


--
-- Name: wikis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.wikis (
    id integer NOT NULL,
    project_id integer NOT NULL,
    start_page character varying(255) NOT NULL,
    status integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.wikis OWNER TO postgres;

--
-- Name: wikis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.wikis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wikis_id_seq OWNER TO postgres;

--
-- Name: wikis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.wikis_id_seq OWNED BY public.wikis.id;


--
-- Name: workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workflows (
    id integer NOT NULL,
    tracker_id integer DEFAULT 0 NOT NULL,
    old_status_id integer DEFAULT 0 NOT NULL,
    new_status_id integer DEFAULT 0 NOT NULL,
    role_id integer DEFAULT 0 NOT NULL,
    assignee boolean DEFAULT false NOT NULL,
    author boolean DEFAULT false NOT NULL,
    type character varying(30),
    field_name character varying(30),
    rule character varying(30)
);


ALTER TABLE public.workflows OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO postgres;

--
-- Name: workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.workflows_id_seq OWNED BY public.workflows.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments ALTER COLUMN id SET DEFAULT nextval('public.attachments_id_seq'::regclass);


--
-- Name: auth_sources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_sources ALTER COLUMN id SET DEFAULT nextval('public.auth_sources_id_seq'::regclass);


--
-- Name: boards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards ALTER COLUMN id SET DEFAULT nextval('public.boards_id_seq'::regclass);


--
-- Name: changes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changes ALTER COLUMN id SET DEFAULT nextval('public.changes_id_seq'::regclass);


--
-- Name: changesets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changesets ALTER COLUMN id SET DEFAULT nextval('public.changesets_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: custom_field_enumerations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_field_enumerations ALTER COLUMN id SET DEFAULT nextval('public.custom_field_enumerations_id_seq'::regclass);


--
-- Name: custom_fields id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields ALTER COLUMN id SET DEFAULT nextval('public.custom_fields_id_seq'::regclass);


--
-- Name: custom_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_values ALTER COLUMN id SET DEFAULT nextval('public.custom_values_id_seq'::regclass);


--
-- Name: documents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);


--
-- Name: email_addresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_addresses ALTER COLUMN id SET DEFAULT nextval('public.email_addresses_id_seq'::regclass);


--
-- Name: enabled_modules id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enabled_modules ALTER COLUMN id SET DEFAULT nextval('public.enabled_modules_id_seq'::regclass);


--
-- Name: enumerations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enumerations ALTER COLUMN id SET DEFAULT nextval('public.enumerations_id_seq'::regclass);


--
-- Name: import_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_items ALTER COLUMN id SET DEFAULT nextval('public.import_items_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports ALTER COLUMN id SET DEFAULT nextval('public.imports_id_seq'::regclass);


--
-- Name: issue_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_categories ALTER COLUMN id SET DEFAULT nextval('public.issue_categories_id_seq'::regclass);


--
-- Name: issue_relations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_relations ALTER COLUMN id SET DEFAULT nextval('public.issue_relations_id_seq'::regclass);


--
-- Name: issue_statuses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses ALTER COLUMN id SET DEFAULT nextval('public.issue_statuses_id_seq'::regclass);


--
-- Name: issues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues ALTER COLUMN id SET DEFAULT nextval('public.issues_id_seq'::regclass);


--
-- Name: journal_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_details ALTER COLUMN id SET DEFAULT nextval('public.journal_details_id_seq'::regclass);


--
-- Name: journals id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals ALTER COLUMN id SET DEFAULT nextval('public.journals_id_seq'::regclass);


--
-- Name: member_roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_roles ALTER COLUMN id SET DEFAULT nextval('public.member_roles_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: open_id_authentication_associations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_associations ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_associations_id_seq'::regclass);


--
-- Name: open_id_authentication_nonces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_nonces ALTER COLUMN id SET DEFAULT nextval('public.open_id_authentication_nonces_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: queries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries ALTER COLUMN id SET DEFAULT nextval('public.queries_id_seq'::regclass);


--
-- Name: repositories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories ALTER COLUMN id SET DEFAULT nextval('public.repositories_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: time_entries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_entries ALTER COLUMN id SET DEFAULT nextval('public.time_entries_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences ALTER COLUMN id SET DEFAULT nextval('public.user_preferences_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: watchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: wiki_content_versions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_content_versions ALTER COLUMN id SET DEFAULT nextval('public.wiki_content_versions_id_seq'::regclass);


--
-- Name: wiki_contents id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_contents ALTER COLUMN id SET DEFAULT nextval('public.wiki_contents_id_seq'::regclass);


--
-- Name: wiki_pages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_pages ALTER COLUMN id SET DEFAULT nextval('public.wiki_pages_id_seq'::regclass);


--
-- Name: wiki_redirects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_redirects ALTER COLUMN id SET DEFAULT nextval('public.wiki_redirects_id_seq'::regclass);


--
-- Name: wikis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wikis ALTER COLUMN id SET DEFAULT nextval('public.wikis_id_seq'::regclass);


--
-- Name: workflows id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows ALTER COLUMN id SET DEFAULT nextval('public.workflows_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2020-06-17 08:59:40.74183	2020-06-17 08:59:40.74183
\.


--
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.attachments (id, container_id, container_type, filename, disk_filename, filesize, content_type, digest, downloads, author_id, created_on, description, disk_directory) FROM stdin;
\.


--
-- Data for Name: auth_sources; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_sources (id, type, name, host, port, account, account_password, base_dn, attr_login, attr_firstname, attr_lastname, attr_mail, onthefly_register, tls, filter, timeout, verify_peer) FROM stdin;
\.


--
-- Data for Name: boards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boards (id, project_id, name, description, "position", topics_count, messages_count, last_message_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changes (id, changeset_id, action, path, from_path, from_revision, revision, branch) FROM stdin;
\.


--
-- Data for Name: changeset_parents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changeset_parents (changeset_id, parent_id) FROM stdin;
\.


--
-- Data for Name: changesets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changesets (id, repository_id, revision, committer, committed_on, comments, commit_date, scmid, user_id) FROM stdin;
\.


--
-- Data for Name: changesets_issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.changesets_issues (changeset_id, issue_id) FROM stdin;
\.


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comments (id, commented_type, commented_id, author_id, content, created_on, updated_on) FROM stdin;
\.


--
-- Data for Name: custom_field_enumerations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_field_enumerations (id, custom_field_id, name, active, "position") FROM stdin;
\.


--
-- Data for Name: custom_fields; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields (id, type, name, field_format, possible_values, regexp, min_length, max_length, is_required, is_for_all, is_filter, "position", searchable, default_value, editable, visible, multiple, format_store, description) FROM stdin;
1	IssueCustomField	new-custom-field	string	\N		\N	\N	f	f	f	1	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	this is description custom field
3	IssueCustomField	Kana Pronouncing	text	\N		\N	\N	f	f	t	3	t	%%	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
2	IssueCustomField	Service	list	---\n- NOS\n- COLLABO de World\n- Concierge\n- ES\n- GCORE\n- GRMS\n- Hosting\n- Hosting ES\n- OFR\n- Optimal Mix\n- Secure de World\n- SecureLAN\n- Smart WAN\n- SpeedyRas\n- SS\n- USGIO R Series\n- XMAIL\n- "@WiFi"\n- Other\n		\N	\N	f	f	t	2	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
4	IssueCustomField	Customer Name	text	\N		\N	\N	f	f	t	4	t	%%	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
5	IssueCustomField	Account ID	string	\N		\N	\N	f	f	t	5	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
6	IssueCustomField	Location	text	\N		\N	\N	f	f	t	6	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
7	IssueCustomField	Call Category	list	---\n- 01-Service Admin\n- 02-EndUser\n- 03-Carrier\n- 04-Vendor\n- 05-Internal\n- 06-Internal(Escalation)\n- 07-Alert\n- 31-IIJ Service\n- 99-Other\n		\N	\N	f	f	f	7	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
8	IssueCustomField	Urgency	list	---\n- 01-Urgent\n- 02-ASAP\n- 03-Date/Time Designated\n		\N	\N	f	f	f	8	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
77	IssueCustomField	Notification on Work Day	date	\N		\N	\N	f	f	f	35	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
54	IssueCustomField	Inquiry End Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	52	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
75	IssueCustomField	Change Notification Category	list	---\n- 01-A\n- 02-B\n- 03-C\n- 04-D\n- 05-E\n- 99-N/A\n		\N	\N	f	f	f	33	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
51	IssueCustomField	Inquiry Start Date	date	\N		\N	\N	f	f	f	48	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
52	IssueCustomField	Inquiry Start Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	49	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
53	IssueCustomField	Inquiry End Date	date	\N		\N	\N	f	f	f	50	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
41	IssueCustomField	Work Planned End Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	39	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
74	IssueCustomField	Response to Inquiry	list	---\n- 01-Knowledge\n- 02-Document\n- 03-FAQ\n- 04-Escalation\n- 05-Handover\n- 99-Other\n		\N	\N	f	f	f	46	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
76	IssueCustomField	Notification of Work	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	34	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
24	IssueCustomField	Responsibility category	list	---\n- 01-Customer\n- 02-IIJ Global\n- 21-Vendor\n- 41-NTT Communications\n- 42-KDDI\n- 43-Soft Bank\n- 44-Colt Technology Services\n- 45-NTT East\n- 46-NTT West\n- 47-NTTPC Communications\n- 48-Kyushu Telecommunication Network (QTNet)\n- 49-Chubu Telecommunications (CTC)\n- 50-Energia Communications\n- 51-Tohoku Intelligent Telecommunication(TOHKnet)\n- 52-Hokkaido Telecommunicaiton Network (HOTnet)\n- 53-IIJ\n- 54-Marubeni Access Solutions\n- 55-K-Opticom\n- 56-USEN/UCOM\n- 57-TOKAI Communications\n- 58-AT&T\n- 59-ARTERIA Networks\n- 70-Multi-carrier\n- 71-International-carrier\n- 98-Multi-reason\n- 99-Other\n		\N	\N	f	f	f	28	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
89	IssueCustomField	Handover Category	list	---\n- 01-Announcement\n- 02-Take Over\n- 99-Other\n		\N	\N	f	f	f	74	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
42	IssueCustomField	Work Start Date	date	\N		\N	\N	f	f	f	40	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
9	IssueCustomField	Target Device	string	\N		\N	\N	f	f	f	10	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
44	IssueCustomField	Work End Date	date	\N		\N	\N	f	f	f	42	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
71	IssueCustomField	ヒヤリハット	list	---\n- 01-No\n- 02-対応不備\n- 03-資料難読・不備\n- 04-メール対応関連\n- 05-引き継ぎ誤り\n- 50-LCM対応\n- 99-その他\n		\N	\N	f	f	f	84	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
30	IssueCustomField	Sheetname	string	\N		\N	\N	f	f	f	86	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
64	IssueCustomField	Reason for outage	list	---\n- 01-Hardware\n- 02-Software\n- 03-Configuration\n- 04-Process\n- 05-Over utilization\n- 06-Human error\n- 07-Unexpected power outage\n- '08-Natural disaster'\n- '09-Virus'\n- 10-Maintenance\n- 11-Planned work\n- 12-Test OK\n- 13-Request canceled\n- 98-Unknown\n- 99-Other\n		\N	\N	f	f	f	15	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
81	IssueCustomField	Affected Components	text	\N		\N	\N	f	f	f	66	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
66	IssueCustomField	Restore Action	text	\N		\N	\N	f	f	f	61	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
78	IssueCustomField	Notification Status	list	---\n- 01-Occurrence\n- 02-Occurrence/Repaired\n- 03-Under Restoration\n- 04-Repaired\n- 05-Recurrence\n- 06-Called Customers\n- 07-Affected Customers\n- '08-Cancel'\n		\N	\N	f	f	f	63	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
80	IssueCustomField	Affected Location	text	\N		\N	\N	f	f	f	65	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
92	IssueCustomField	静観スケジュール	text	\N		\N	\N	f	f	f	91	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '1'\n	
93	IssueCustomField	静観対象	text	\N		\N	\N	f	f	f	92	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '1'\n	
72	IssueCustomField	ヒヤリハット内容	text	\N		\N	\N	f	f	f	85	f	[02-対応不備]\r\n\r\n\r\n[03-資料難読・不備]\r\n\r\n\r\n[04-メール対応関連]\r\n\r\n\r\n[05-引き継ぎ誤り]\r\n\r\n\r\n[50-LCM対応]\r\n\r\n\r\n[99-その他]\r\n	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
33	IssueCustomField	ArrowID	string	\N		\N	\N	f	f	f	89	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
65	IssueCustomField	Restore Category	list	---\n- 01-Replace/Repair\n- 02-Reroute\n- 03-Power Off/On\n- 04-Reset\n- 05-Configuration Changes\n- 06-Recover on its own\n- 07-Arrangement\n- '08-Guide'\n- 99-Other\n		\N	\N	f	f	f	17	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
34	IssueCustomField	Work Category	list	---\n- 01-PWRST\n- 02-Registration\n- 03-ConfigChange\n- 04-Restore/Repair\n- 05-Maintenance\n- 31-Document Maintenance\n- 32-Admission Application\n- 33-Survey Request\n- 34‐Planed Operation\n- 35‐Wait And See Request\n- 99-Other\n		\N	\N	f	f	f	29	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
35	IssueCustomField	Work Result	list	---\n- 01-Complete\n- 02-Fail\n- 03-Cancel\n- 04-Abort\n		\N	\N	f	f	f	30	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
37	IssueCustomField	Work Summary	text	\N		\N	\N	f	f	f	32	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
22	IssueCustomField	Ops End Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	26	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
23	IssueCustomField	Escalation	list	---\n- 01-NON\n- 02-Level1\n- 03-Level2\n- 04-Level3\n- 05-Level4\n		\N	\N	f	f	f	27	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
36	IssueCustomField	Statement of Work	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	31	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
28	IssueCustomField	Next Action Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	t	f	f	82	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
79	IssueCustomField	Affected Service	text	\N		\N	\N	f	f	f	64	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
55	IssueCustomField	問合せ内容	text	\N		\N	\N	f	f	f	56	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
56	IssueCustomField	回答内容	text	\N		\N	\N	f	f	f	57	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
82	IssueCustomField	Incident Occurred Date	date	\N		\N	\N	f	f	f	67	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
83	IssueCustomField	Incident Occurred Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	68	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
84	IssueCustomField	Incident Repaired Date	date	\N		\N	\N	f	f	f	69	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
85	IssueCustomField	Incident Repaired Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	70	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
86	IssueCustomField	Major Incident	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	71	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
87	IssueCustomField	Affected Customers	text	\N		\N	\N	f	f	f	72	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
88	IssueCustomField	Internal Notes	text	\N		\N	\N	f	f	f	73	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
91	IssueCustomField	Monitoring Service 	list	---\n- ALL\n- Ping\n- Log\n- IF-Status\n- SNMP-Trap\n- Section_Response\n		\N	\N	f	f	f	90	f		t	t	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
13	IssueCustomField	Damaged Segment	list	---\n- 01-DCE\n- 02-MDF,IDF,PDC\n- 03-Router\n- 04-Switch\n- 05-Network Equipments\n- 06-Cable\n- 07-PC\n- '08-Server'\n- '09-In-house Wiring'\n- 10-Access Circuit\n- 11-Interexchange\n- 12-Transmission Device\n- 13-Network\n- 14-Facilities Power Supply\n- 98-Unknown\n- 99-Other\n		\N	\N	f	f	f	12	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
69	IssueCustomField	Knowledge	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	79	f	02-No	t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
48	IssueCustomField	Client	string	\N		\N	\N	f	f	f	9	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
10	IssueCustomField	Malfunction	string	\N		\N	\N	f	f	f	11	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
60	IssueCustomField	Cust. Notification Date	date	\N		\N	\N	f	f	f	55	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
62	IssueCustomField	Negotiation	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	58	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
58	IssueCustomField	Reply to Notifier Date	date	\N		\N	\N	f	f	f	51	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
57	IssueCustomField	Notification Given Date	date	\N		\N	\N	f	f	f	53	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
67	IssueCustomField	Best-effort ServiceTypeCircuit	list	---\n- 01-Yes\n- 02-No\n		\N	\N	f	f	f	60	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
68	IssueCustomField	Periodic update	list	---\n- 'Yes'\n- 'No'\n- "-"\n		\N	\N	f	f	f	62	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
11	IssueCustomField	Impact(OSC)	list	---\n- 01-Service Disabled\n- 02-Service Partially Disabled\n- 33-Delay/Congestion\n- 34-Outage/Service Continuation\n		\N	\N	f	f	f	14	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
12	IssueCustomField	Reason for outage(OSC)	list	---\n- 31-PPP session down\n- 32-VPN session down\n- 33-power interruption\n- 34-Operation\n- 35-Operation time framce change\n- 36-Device trouble\n- 37-Carrier incident\n- 38-Carrier maintenance\n- 39-IIJ Service Incident\n- 40-IIJ Service maintenance\n- 41- Electric power outage\n- 42-Congestion\n- 43-Loop\n- 44-link down\n- 45-CPU/Memory high usage\n- 46-Security incident\n- 98-Unknown\n- 99-Other\n		\N	\N	f	f	f	16	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
14	IssueCustomField	Restore Category(OSC)	list	---\n- 01-Replace/Repair\n- 02-Reroute\n- 03-Power Off/On\n- 05-Configuration Changes\n- 06-Recover on its own\n- 31-Reboot Command\n- 32-Escalation\n- 33-Service Despatch\n- 34-Instruct Customer\n- 35‐Wait Customer's action\n- 36-Wait And See\n- 99-Other\n		\N	\N	f	f	f	18	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
16	IssueCustomField	Time of Occurrence	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	20	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
61	IssueCustomField	Before-After Announcement	list	---\n- 01-Non\n- 02-Before\n- 03-After\n- 04-BeforeandAfter\n		\N	\N	f	f	f	59	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
73	IssueCustomField	Inquiry Category	list	---\n- 01-Usage\n- 02-Config\n- 03-Procedure\n- 04-Agency\n- 05-Application\n- 06-Maintenance\n- 07-Opinion/Request\n- '08-Fee/Cost'\n- '09-Complaint'\n- 10-Report\n- 11-Brochure\n- 99-Other\n		\N	\N	f	f	f	44	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
40	IssueCustomField	Work Planned End Date	date	\N		\N	\N	f	f	f	38	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
31	IssueCustomField	ProcessID	string	\N		\N	\N	f	f	f	87	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
32	IssueCustomField	ProcessComment	string	\N		\N	\N	f	f	f	88	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
63	IssueCustomField	Impact	list	---\n- 01-Service Disabled\n- 02-Service Partially Disabled\n- 03-Usable with trouble\n		\N	\N	f	f	f	13	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
25	IssueCustomField	Trigger Category	list	---\n- "01.\\tTelephone"\n- "02.\\tAlert"\n- "03.\\tMail"\n- "04.\\tFax"\n- "05.\\tIRC"\n- "99.\\tOther"\n		\N	\N	f	f	t	75	t		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
27	IssueCustomField	Next Action Date	date	\N		\N	\N	t	f	f	81	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
26	IssueCustomField	Comments	text	\N		\N	\N	f	f	f	80	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nfull_width_layout: '0'\n	
49	IssueCustomField	Inquiry Category(OSC)	list	---\n- 31-function specifications\n- 32-Communication・utilization\n- 33‐Past Incident\n- 34‐fragility\n- 06-Maintenance\n- 07-Opinion/Request\n- '09-Complaint'\n- 11-Brochure\n- 99-Other\n		\N	\N	f	f	f	45	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
50	IssueCustomField	Response to Inquiry(OSC)	list	---\n- 01-Knowledge\n- 02-Document\n- 03-FAQ\n- 04-Escalation\n- 05-Handover\n- 31-OSC\n- 32-Carrier\n- 33-Vendor\n- 34-Service despatch\n- 99-Other\n		\N	\N	f	f	f	47	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
43	IssueCustomField	Work Start Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	41	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
45	IssueCustomField	Work End Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	43	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
29	IssueCustomField	Ignore	list	---\n- 'No'\n- 'Yes'\n		\N	\N	t	f	f	83	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\nedit_tag_style: ''\n	
47	IssueCustomField	Time e-mail received 	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	77	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
46	IssueCustomField	Date e-mail received 	date	\N		\N	\N	f	f	f	76	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
70	IssueCustomField	Last contact date to customer	date	\N		\N	\N	f	f	f	78	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
38	IssueCustomField	Work Planned Start Date	date	\N		\N	\N	f	f	f	36	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
39	IssueCustomField	Work Planned Start Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	37	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
15	IssueCustomField	Date of Occurrence	date	\N		\N	\N	f	f	t	19	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
17	IssueCustomField	Restored Date	date	\N		\N	\N	f	f	f	21	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
18	IssueCustomField	Restored Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	22	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
19	IssueCustomField	Ops Start Date	date	\N		\N	\N	f	f	f	23	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
20	IssueCustomField	Ops Start Time	string	\N	^([0-1][0-9]|[2][0-3]):[0-5][0-9]$	5	5	f	f	f	24	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\ntext_formatting: ''\nurl_pattern: ''\n	
21	IssueCustomField	Ops End Date	date	\N		\N	\N	f	f	t	25	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
59	IssueCustomField	Cust.Notifcation TaskStartDate	date	\N		\N	\N	f	f	f	54	f		t	t	f	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nurl_pattern: ''\n	
\.


--
-- Data for Name: custom_fields_projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_projects (custom_field_id, project_id) FROM stdin;
2	10
2	11
2	15
2	14
2	13
3	10
3	11
3	15
3	14
3	13
4	10
4	11
4	15
4	14
4	13
5	10
5	11
5	15
5	14
5	13
6	10
6	11
6	15
6	14
6	13
7	10
7	11
7	15
7	14
7	13
8	10
8	11
8	15
8	14
8	13
9	10
9	11
9	15
9	14
9	13
10	10
10	11
10	15
10	14
10	13
11	10
11	11
11	15
11	14
11	13
12	10
12	11
12	15
12	14
12	13
13	10
13	11
13	15
13	14
13	13
14	10
14	11
14	15
14	14
14	13
15	10
15	11
15	15
15	14
15	13
16	10
16	11
16	15
16	14
16	13
17	10
17	11
17	15
17	14
17	13
18	10
18	11
18	15
18	14
18	13
19	10
19	11
19	15
19	14
19	13
20	10
20	11
20	15
20	14
20	13
21	10
21	11
21	15
21	14
21	13
22	10
22	11
22	15
22	14
22	13
23	10
23	11
23	15
23	14
23	13
24	10
24	11
24	15
24	14
24	13
25	10
25	11
25	15
25	14
25	13
26	10
26	11
26	15
26	14
26	13
27	10
27	11
27	15
27	14
27	13
28	10
28	11
28	15
28	14
28	13
29	10
29	11
29	15
29	14
29	13
30	10
30	11
30	15
30	14
30	13
31	10
31	11
31	15
31	14
31	13
32	10
32	11
32	15
32	14
32	13
33	10
33	11
33	15
33	14
33	13
34	10
34	11
34	15
34	14
34	13
35	10
35	11
35	15
35	14
35	13
36	10
36	11
36	15
36	14
36	13
37	10
37	11
37	15
37	14
37	13
38	10
38	11
38	15
38	14
38	13
39	10
39	11
39	15
39	14
39	13
40	10
40	11
40	15
40	14
40	13
41	10
41	11
41	15
41	14
41	13
42	10
42	11
42	15
42	14
42	13
43	10
43	11
43	15
43	14
43	13
44	10
44	11
44	15
44	14
44	13
45	10
45	11
45	15
45	14
45	13
46	10
46	11
46	15
46	14
46	13
47	10
47	11
47	15
47	14
47	13
48	10
48	11
48	15
48	14
48	13
49	10
49	11
49	15
49	14
49	13
50	10
50	11
50	15
50	14
50	13
51	10
51	11
51	15
51	14
51	13
52	10
52	11
52	15
52	14
52	13
53	10
53	11
53	15
53	14
53	13
54	10
54	11
54	15
54	14
54	13
55	10
55	11
55	15
55	14
55	13
56	10
56	11
56	15
56	14
56	13
57	10
57	11
57	15
57	14
57	13
58	10
58	11
58	15
58	14
58	13
59	10
59	11
59	15
59	14
59	13
60	10
60	11
60	15
60	14
60	13
61	10
61	11
61	15
61	14
61	13
62	10
62	11
62	15
62	14
62	13
2	16
3	16
4	16
5	16
6	16
7	16
8	16
48	16
9	16
10	16
13	16
15	16
16	16
17	16
18	16
19	16
20	16
21	16
22	16
24	16
34	16
35	16
36	16
37	16
38	16
39	16
40	16
41	16
42	16
43	16
44	16
45	16
51	16
52	16
53	16
54	16
57	16
58	16
59	16
60	16
61	16
62	16
25	16
46	16
47	16
26	16
27	16
28	16
29	16
30	16
31	16
32	16
33	16
63	16
64	16
2	30
3	30
4	30
5	30
6	30
7	30
8	30
48	30
9	30
10	30
13	30
11	30
12	30
14	30
15	30
16	30
17	30
18	30
19	30
20	30
21	30
22	30
23	30
24	30
34	30
35	30
36	30
37	30
38	30
39	30
40	30
41	30
42	30
43	30
44	30
45	30
49	30
50	30
51	30
52	30
53	30
54	30
57	30
58	30
59	30
60	30
55	30
56	30
61	30
62	30
25	30
46	30
47	30
26	30
27	30
28	30
29	30
30	30
31	30
32	30
33	30
2	31
3	31
4	31
5	31
6	31
7	31
8	31
48	31
9	31
10	31
13	31
11	31
12	31
14	31
15	31
16	31
17	31
18	31
19	31
20	31
21	31
22	31
23	31
24	31
34	31
35	31
36	31
37	31
38	31
39	31
40	31
41	31
42	31
43	31
44	31
45	31
49	31
50	31
51	31
52	31
53	31
54	31
57	31
58	31
59	31
60	31
55	31
56	31
61	31
62	31
25	31
46	31
47	31
26	31
27	31
28	31
29	31
30	31
31	31
32	31
33	31
2	17
3	17
4	17
5	17
6	17
7	17
8	17
48	17
9	17
10	17
13	17
15	17
16	17
17	17
18	17
19	17
20	17
21	17
22	17
23	17
24	17
34	17
35	17
36	17
37	17
38	17
39	17
40	17
41	17
42	17
43	17
44	17
45	17
51	17
52	17
53	17
54	17
57	17
58	17
59	17
60	17
61	17
62	17
25	17
46	17
47	17
26	17
27	17
28	17
29	17
30	17
31	17
32	17
33	17
63	17
64	17
2	19
3	19
4	19
5	19
6	19
7	19
8	19
48	19
9	19
10	19
13	19
15	19
16	19
17	19
18	19
19	19
20	19
21	19
22	19
23	19
24	19
34	19
35	19
36	19
37	19
38	19
39	19
40	19
41	19
42	19
43	19
44	19
45	19
51	19
52	19
53	19
54	19
57	19
58	19
59	19
60	19
61	19
62	19
25	19
46	19
47	19
26	19
27	19
28	19
29	19
30	19
31	19
32	19
33	19
63	19
64	19
2	20
3	20
4	20
5	20
6	20
7	20
8	20
48	20
9	20
10	20
13	20
15	20
16	20
17	20
18	20
19	20
20	20
21	20
22	20
23	20
24	20
34	20
35	20
36	20
37	20
38	20
39	20
40	20
41	20
42	20
43	20
44	20
45	20
51	20
52	20
53	20
54	20
57	20
58	20
59	20
60	20
61	20
62	20
25	20
46	20
47	20
26	20
27	20
28	20
29	20
30	20
31	20
32	20
33	20
63	20
64	20
2	24
3	24
4	24
5	24
6	24
7	24
8	24
48	24
9	24
10	24
13	24
14	24
15	24
16	24
17	24
18	24
19	24
20	24
21	24
22	24
23	24
24	24
34	24
35	24
36	24
37	24
38	24
39	24
40	24
41	24
42	24
43	24
44	24
45	24
51	24
52	24
53	24
54	24
57	24
58	24
59	24
60	24
61	24
62	24
25	24
46	24
47	24
26	24
27	24
28	24
29	24
30	24
31	24
32	24
33	24
63	24
64	24
2	25
3	25
4	25
5	25
6	25
7	25
8	25
48	25
9	25
10	25
13	25
14	25
15	25
16	25
17	25
18	25
19	25
20	25
21	25
22	25
23	25
24	25
34	25
35	25
36	25
37	25
38	25
39	25
40	25
41	25
42	25
43	25
44	25
45	25
51	25
52	25
53	25
54	25
57	25
58	25
59	25
60	25
61	25
62	25
25	25
46	25
47	25
26	25
27	25
28	25
29	25
30	25
31	25
32	25
33	25
63	25
64	25
2	26
3	26
4	26
5	26
6	26
7	26
8	26
48	26
9	26
10	26
13	26
15	26
16	26
17	26
18	26
19	26
20	26
21	26
22	26
23	26
24	26
34	26
35	26
36	26
37	26
38	26
39	26
40	26
41	26
42	26
43	26
44	26
45	26
51	26
52	26
53	26
54	26
57	26
58	26
59	26
60	26
55	26
61	26
62	26
25	26
46	26
47	26
26	26
27	26
28	26
29	26
30	26
31	26
32	26
33	26
63	26
64	26
3	27
4	27
5	27
6	27
7	27
8	27
48	27
9	27
10	27
13	27
15	27
16	27
17	27
18	27
19	27
20	27
21	27
22	27
23	27
24	27
34	27
35	27
36	27
37	27
38	27
39	27
40	27
41	27
42	27
43	27
44	27
45	27
51	27
52	27
53	27
54	27
57	27
58	27
59	27
60	27
61	27
62	27
25	27
46	27
47	27
26	27
27	27
28	27
29	27
30	27
31	27
32	27
33	27
63	27
64	27
2	28
3	28
4	28
5	28
6	28
7	28
8	28
48	28
9	28
10	28
13	28
15	28
16	28
17	28
18	28
19	28
20	28
21	28
22	28
23	28
24	28
34	28
35	28
36	28
37	28
38	28
39	28
40	28
41	28
42	28
43	28
44	28
45	28
51	28
52	28
53	28
54	28
57	28
58	28
59	28
60	28
61	28
62	28
25	28
46	28
47	28
26	28
27	28
28	28
29	28
30	28
31	28
32	28
33	28
63	28
64	28
2	29
3	29
4	29
5	29
6	29
7	29
8	29
48	29
9	29
10	29
13	29
11	29
15	29
16	29
17	29
18	29
19	29
20	29
21	29
22	29
23	29
24	29
34	29
35	29
36	29
37	29
38	29
39	29
40	29
41	29
42	29
43	29
44	29
45	29
51	29
52	29
53	29
54	29
57	29
58	29
59	29
60	29
61	29
62	29
25	29
46	29
47	29
26	29
27	29
28	29
29	29
30	29
31	29
32	29
33	29
63	29
64	29
2	32
3	32
4	32
5	32
6	32
7	32
8	32
48	32
9	32
10	32
13	32
15	32
16	32
17	32
18	32
19	32
20	32
21	32
22	32
23	32
24	32
34	32
35	32
36	32
37	32
38	32
39	32
40	32
41	32
42	32
43	32
44	32
45	32
51	32
52	32
53	32
54	32
57	32
58	32
59	32
60	32
61	32
62	32
25	32
46	32
47	32
26	32
27	32
28	32
29	32
30	32
31	32
32	32
33	32
63	32
64	32
2	33
3	33
4	33
5	33
6	33
7	33
8	33
48	33
9	33
10	33
13	33
15	33
16	33
17	33
18	33
19	33
20	33
21	33
22	33
23	33
24	33
34	33
35	33
36	33
37	33
38	33
39	33
40	33
41	33
42	33
43	33
44	33
45	33
51	33
52	33
53	33
54	33
57	33
58	33
59	33
60	33
61	33
62	33
25	33
46	33
47	33
26	33
27	33
28	33
29	33
30	33
31	33
32	33
33	33
63	33
64	33
2	34
3	34
4	34
5	34
6	34
7	34
8	34
48	34
9	34
10	34
13	34
15	34
16	34
17	34
18	34
19	34
20	34
21	34
22	34
23	34
24	34
34	34
35	34
36	34
37	34
38	34
39	34
40	34
41	34
42	34
43	34
44	34
45	34
51	34
52	34
53	34
54	34
57	34
58	34
59	34
60	34
61	34
62	34
25	34
46	34
47	34
26	34
27	34
28	34
29	34
30	34
31	34
32	34
33	34
63	34
64	34
2	35
3	35
4	35
5	35
6	35
7	35
8	35
48	35
9	35
10	35
13	35
15	35
16	35
17	35
18	35
19	35
20	35
21	35
22	35
23	35
24	35
34	35
35	35
36	35
37	35
38	35
39	35
40	35
41	35
42	35
43	35
44	35
45	35
51	35
52	35
53	35
54	35
57	35
58	35
59	35
60	35
61	35
62	35
25	35
46	35
47	35
26	35
27	35
28	35
29	35
30	35
31	35
32	35
33	35
63	35
64	35
2	41
3	41
4	41
5	41
6	41
7	41
8	41
48	41
9	41
10	41
13	41
15	41
16	41
17	41
18	41
19	41
20	41
21	41
22	41
23	41
24	41
34	41
35	41
36	41
37	41
38	41
39	41
40	41
41	41
42	41
43	41
44	41
45	41
51	41
52	41
53	41
54	41
57	41
58	41
59	41
60	41
55	41
61	41
62	41
25	41
46	41
47	41
26	41
27	41
28	41
29	41
30	41
31	41
32	41
33	41
63	41
64	41
2	37
3	37
4	37
5	37
6	37
7	37
8	37
48	37
9	37
10	37
13	37
15	37
16	37
17	37
18	37
19	37
20	37
21	37
22	37
23	37
24	37
34	37
35	37
36	37
37	37
38	37
39	37
40	37
41	37
42	37
43	37
44	37
45	37
51	37
52	37
53	37
54	37
57	37
58	37
59	37
60	37
61	37
62	37
25	37
46	37
47	37
26	37
27	37
28	37
29	37
30	37
31	37
32	37
33	37
63	37
64	37
2	38
3	38
4	38
5	38
6	38
7	38
8	38
48	38
9	38
10	38
13	38
15	38
16	38
17	38
18	38
19	38
20	38
21	38
22	38
23	38
24	38
34	38
35	38
36	38
37	38
38	38
39	38
40	38
41	38
42	38
43	38
44	38
45	38
51	38
52	38
53	38
54	38
57	38
58	38
59	38
60	38
61	38
62	38
25	38
46	38
47	38
26	38
27	38
28	38
29	38
30	38
31	38
32	38
33	38
63	38
64	38
2	39
3	39
4	39
5	39
6	39
7	39
8	39
48	39
9	39
10	39
13	39
15	39
16	39
17	39
18	39
19	39
20	39
21	39
22	39
23	39
24	39
34	39
35	39
36	39
37	39
38	39
39	39
40	39
41	39
42	39
43	39
44	39
45	39
51	39
52	39
53	39
54	39
57	39
58	39
59	39
60	39
61	39
62	39
25	39
46	39
47	39
26	39
27	39
28	39
29	39
30	39
31	39
32	39
33	39
63	39
64	39
2	40
3	40
4	40
5	40
6	40
7	40
8	40
48	40
9	40
10	40
13	40
15	40
16	40
17	40
18	40
19	40
20	40
21	40
22	40
23	40
24	40
34	40
35	40
36	40
37	40
38	40
39	40
40	40
41	40
42	40
43	40
44	40
45	40
51	40
52	40
53	40
54	40
57	40
58	40
59	40
60	40
61	40
62	40
25	40
46	40
47	40
26	40
27	40
28	40
29	40
30	40
32	40
33	40
63	40
64	40
65	16
65	17
65	19
65	20
65	24
65	25
65	26
65	27
65	28
65	29
65	32
65	33
65	34
65	35
65	41
65	37
65	38
65	39
65	40
66	16
66	17
66	19
66	20
66	24
66	25
66	26
66	27
66	28
66	29
66	32
66	33
66	34
66	35
66	41
66	37
66	38
66	39
66	40
67	16
67	17
67	19
67	20
67	24
67	25
67	26
67	27
67	28
67	29
67	32
67	33
67	34
67	35
67	41
67	37
67	38
67	39
67	40
68	16
68	17
68	19
68	20
68	24
68	25
68	26
68	27
68	28
68	29
69	16
69	17
69	19
69	20
69	24
69	25
69	26
69	27
69	28
69	29
69	32
69	33
69	34
69	35
69	41
69	37
69	38
69	39
69	40
70	24
70	34
71	16
71	17
71	19
71	20
71	24
71	25
71	26
71	27
71	28
71	29
71	32
71	33
71	34
71	35
71	41
71	37
71	38
71	39
71	40
72	16
72	17
72	19
72	20
72	24
72	25
72	26
72	27
72	28
72	29
72	32
72	33
72	34
72	35
72	41
72	37
72	38
72	39
72	40
73	16
73	17
73	19
73	20
73	24
73	25
73	26
73	27
73	28
73	29
73	32
73	33
73	34
73	35
73	41
73	37
73	38
73	39
73	40
74	16
74	17
74	19
74	20
74	23
74	24
74	25
74	26
74	27
74	28
74	29
74	32
74	33
74	34
74	35
74	41
74	37
74	38
74	39
74	40
76	16
76	17
76	19
76	20
76	24
76	25
76	26
76	27
76	28
76	29
76	32
76	33
76	34
76	35
76	41
76	37
76	38
76	39
76	40
77	16
77	17
77	19
77	20
77	24
77	25
77	26
77	27
77	28
77	29
77	32
77	33
77	34
77	35
77	41
77	37
77	38
77	39
77	40
75	16
75	17
75	19
75	20
75	24
75	25
75	26
75	27
75	28
75	29
75	32
75	33
75	34
75	35
75	41
75	37
75	38
75	39
75	40
78	23
79	23
80	23
81	23
82	23
83	23
84	23
85	23
86	23
87	23
88	23
2	42
3	42
4	42
5	42
26	42
27	42
28	42
29	42
71	42
72	42
30	42
31	42
32	42
33	42
2	43
3	43
4	43
5	43
26	43
27	43
28	43
29	43
71	43
72	43
30	43
31	43
32	43
33	43
2	44
3	44
4	44
5	44
26	44
27	44
28	44
29	44
71	44
72	44
30	44
31	44
32	44
33	44
38	44
39	44
38	42
39	42
38	43
39	43
2	18
3	18
4	18
5	18
38	18
39	18
26	18
27	18
28	18
29	18
71	18
72	18
30	18
31	18
32	18
33	18
89	18
89	42
89	43
89	44
91	24
91	25
91	27
92	24
92	25
92	27
93	24
93	25
93	27
\.


--
-- Data for Name: custom_fields_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_roles (custom_field_id, role_id) FROM stdin;
\.


--
-- Data for Name: custom_fields_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_fields_trackers (custom_field_id, tracker_id) FROM stdin;
2	4
3	4
4	4
5	4
6	4
7	4
8	4
9	4
10	4
11	4
12	4
13	4
14	4
15	4
17	4
18	4
19	4
20	4
21	4
22	4
23	4
24	4
25	4
26	4
27	4
28	4
29	4
16	4
30	4
31	4
32	4
33	4
2	5
3	5
4	5
5	5
7	5
9	5
25	5
26	5
27	5
28	5
29	5
30	5
31	5
32	5
33	5
34	5
35	5
36	5
37	5
38	5
39	5
40	5
41	5
42	5
43	5
44	5
45	5
46	5
47	5
48	5
2	6
3	6
4	6
5	6
7	6
48	6
9	6
23	6
25	6
46	6
47	6
26	6
27	6
28	6
29	6
30	6
31	6
32	6
33	6
49	6
50	6
51	6
52	6
53	6
54	6
55	6
56	6
2	7
3	7
4	7
5	7
6	7
23	7
38	7
39	7
40	7
41	7
25	7
26	7
27	7
28	7
29	7
30	7
31	7
32	7
33	7
57	7
58	7
2	8
3	8
4	8
5	8
6	8
23	8
38	8
39	8
40	8
41	8
26	8
27	8
28	8
29	8
30	8
31	8
32	8
33	8
59	8
60	8
61	8
62	8
2	9
3	9
4	9
5	9
6	9
7	9
8	9
9	9
13	9
15	9
16	9
17	9
18	9
19	9
20	9
21	9
22	9
23	9
24	9
61	9
25	9
46	9
47	9
26	9
27	9
28	9
29	9
30	9
31	9
32	9
33	9
63	9
64	9
65	9
66	9
67	9
68	9
69	9
70	9
71	9
72	9
2	10
3	10
4	10
5	10
7	10
23	10
34	10
35	10
36	10
37	10
38	10
39	10
40	10
41	10
42	10
43	10
44	10
45	10
25	10
70	10
69	10
26	10
27	10
28	10
29	10
71	10
72	10
30	10
31	10
32	10
33	10
2	11
3	11
4	11
5	11
7	11
9	11
23	11
34	11
35	11
36	11
37	11
38	11
39	11
40	11
41	11
42	11
43	11
44	11
45	11
25	11
46	11
47	11
70	11
69	11
26	11
27	11
28	11
29	11
71	11
72	11
30	11
31	11
32	11
33	11
2	12
3	12
4	12
5	12
7	12
9	12
23	12
51	12
52	12
53	12
54	12
25	12
46	12
47	12
70	12
69	12
26	12
27	12
28	12
29	12
71	12
72	12
30	12
31	12
32	12
33	12
73	12
74	12
2	13
3	13
4	13
5	13
23	13
38	13
39	13
40	13
41	13
57	13
58	13
25	13
69	13
26	13
27	13
28	13
29	13
71	13
72	13
30	13
31	13
32	13
33	13
75	13
76	13
77	13
2	14
3	14
4	14
5	14
6	14
23	14
75	14
38	14
39	14
40	14
41	14
59	14
60	14
61	14
69	14
26	14
27	14
28	14
29	14
71	14
72	14
30	14
31	14
32	14
33	14
2	15
3	15
4	15
5	15
13	15
24	15
69	15
26	15
27	15
28	15
29	15
71	15
72	15
30	15
31	15
32	15
33	15
78	15
79	15
80	15
81	15
82	15
83	15
84	15
85	15
86	15
87	15
88	15
2	16
3	16
4	16
5	16
38	16
39	16
26	16
27	16
28	16
29	16
71	16
72	16
30	16
31	16
32	16
33	16
89	16
2	17
3	17
4	17
5	17
23	17
34	17
35	17
36	17
37	17
38	17
39	17
40	17
41	17
42	17
43	17
44	17
45	17
25	17
46	17
47	17
69	17
26	17
27	17
28	17
29	17
71	17
72	17
30	17
31	17
32	17
33	17
91	17
92	17
93	17
\.


--
-- Data for Name: custom_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.custom_values (id, customized_type, customized_id, custom_field_id, value) FROM stdin;
2	Issue	25	3	%%
3	Issue	25	4	%%
4	Issue	25	5	
5	Issue	25	7	
6	Issue	25	23	
7	Issue	25	34	
8	Issue	25	35	
9	Issue	25	36	
10	Issue	25	37	
11	Issue	25	38	
12	Issue	25	39	
13	Issue	25	40	
14	Issue	25	41	
15	Issue	25	42	
16	Issue	25	43	
17	Issue	25	44	
18	Issue	25	45	
19	Issue	25	25	
20	Issue	25	69	02-No
21	Issue	25	26	
25	Issue	25	71	
26	Issue	25	72	[02-対応不備]\r\n\r\n\r\n[03-資料難読・不備]\r\n\r\n\r\n[04-メール対応関連]\r\n\r\n\r\n[05-引き継ぎ誤り]\r\n\r\n\r\n[50-LCM対応]\r\n\r\n\r\n[99-その他]\r\n
27	Issue	25	30	
28	Issue	25	31	
29	Issue	25	32	
30	Issue	25	33	
1	Issue	25	2	Other
22	Issue	25	27	2020-07-31
23	Issue	25	28	16:00
24	Issue	25	29	No
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, project_id, category_id, title, description, created_on) FROM stdin;
\.


--
-- Data for Name: email_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_addresses (id, user_id, address, is_default, notify, created_on, updated_on) FROM stdin;
1	1	admin@example.net	t	t	2020-06-17 08:59:40.206295	2020-06-17 08:59:40.206295
2	5	kwmctest@nal.vn	t	t	2020-06-17 09:02:45.240586	2020-06-17 09:02:45.240586
3	6	onozawa-m@iij.ad.jp	t	t	2020-06-18 08:15:09.689822	2020-06-18 08:15:09.689822
4	11	maivt@nal.vn	t	t	2020-07-30 10:30:28.022887	2020-07-30 10:30:28.022887
\.


--
-- Data for Name: enabled_modules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enabled_modules (id, project_id, name) FROM stdin;
10	2	issue_tracking
11	2	wiki
12	2	calendar
13	3	issue_tracking
14	3	wiki
15	4	issue_tracking
16	4	wiki
18	5	wiki
30	10	issue_tracking
31	10	wiki
32	11	issue_tracking
33	11	wiki
35	12	wiki
36	13	issue_tracking
37	13	wiki
38	14	issue_tracking
39	14	wiki
40	15	issue_tracking
41	15	wiki
43	16	issue_tracking
44	16	wiki
45	17	issue_tracking
46	17	wiki
47	18	issue_tracking
48	18	wiki
49	19	issue_tracking
50	19	wiki
51	20	issue_tracking
52	20	wiki
57	23	issue_tracking
58	23	wiki
59	24	issue_tracking
60	24	wiki
61	25	issue_tracking
62	25	wiki
63	26	issue_tracking
64	26	wiki
65	27	issue_tracking
66	27	wiki
67	28	issue_tracking
68	28	wiki
69	29	issue_tracking
70	29	wiki
71	30	issue_tracking
72	30	wiki
73	31	issue_tracking
74	31	wiki
75	32	issue_tracking
76	32	wiki
77	33	issue_tracking
78	33	wiki
79	34	issue_tracking
80	34	wiki
81	35	issue_tracking
82	35	wiki
85	37	issue_tracking
86	37	wiki
87	38	issue_tracking
88	38	wiki
89	39	issue_tracking
90	39	wiki
91	40	issue_tracking
92	40	wiki
93	41	issue_tracking
94	41	wiki
95	42	issue_tracking
96	42	wiki
97	43	issue_tracking
98	43	wiki
99	44	issue_tracking
100	44	wiki
\.


--
-- Data for Name: enumerations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enumerations (id, name, "position", is_default, type, active, project_id, parent_id, position_name) FROM stdin;
1	NORMAL	1	t	IssuePriority	t	\N	\N	default
2	HIGH	2	f	IssuePriority	t	\N	\N	high2
3	LOW	3	f	IssuePriority	t	\N	\N	highest
\.


--
-- Data for Name: groups_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_users (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: import_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.import_items (id, import_id, "position", obj_id, message, unique_id) FROM stdin;
\.


--
-- Data for Name: imports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imports (id, type, user_id, filename, settings, total_items, finished, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: issue_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_categories (id, project_id, name, assigned_to_id) FROM stdin;
\.


--
-- Data for Name: issue_relations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_relations (id, issue_from_id, issue_to_id, relation_type, delay) FROM stdin;
\.


--
-- Data for Name: issue_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issue_statuses (id, name, is_closed, "position", default_done_ratio) FROM stdin;
1	NEW	f	1	\N
2	DONE	f	2	\N
3	PROCESSING	f	3	\N
4	Queued	f	4	\N
5	Auto Active	f	5	\N
6	Active	f	6	\N
7	Deferred (customer)	f	7	\N
8	Deferred (carrier/vendor)	f	8	\N
9	Deferred (escalation)	f	9	\N
10	Deferred (other)	f	10	\N
11	Restored	f	11	\N
13	Closed	t	13	\N
12	Ready To Close	t	12	\N
14	Summarized	t	14	\N
15	Cancel	t	15	\N
\.


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.issues (id, tracker_id, project_id, subject, description, due_date, category_id, status_id, assigned_to_id, priority_id, fixed_version_id, author_id, lock_version, created_on, updated_on, start_date, done_ratio, estimated_hours, parent_id, root_id, lft, rgt, is_private, closed_on) FROM stdin;
25	10	20	[Work Request] Check RM 1	Check RM 1	\N	\N	4	\N	1	\N	1	0	2020-07-30 10:38:56.154821	2020-07-30 10:38:56.154821	\N	0	\N	\N	25	1	2	f	\N
\.


--
-- Data for Name: journal_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journal_details (id, journal_id, property, prop_key, old_value, value) FROM stdin;
\.


--
-- Data for Name: journals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.journals (id, journalized_id, journalized_type, user_id, notes, created_on, private_notes) FROM stdin;
\.


--
-- Data for Name: member_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member_roles (id, member_id, role_id, inherited_from) FROM stdin;
2	2	3	\N
3	3	3	\N
4	4	3	\N
5	5	3	\N
6	6	3	\N
7	7	3	\N
8	8	3	\N
10	10	3	\N
11	11	3	\N
12	12	3	\N
13	13	3	\N
14	14	3	\N
15	15	3	\N
16	16	3	\N
17	17	3	\N
18	18	3	\N
19	19	3	\N
20	20	3	\N
21	21	3	\N
22	22	3	\N
23	23	3	\N
24	24	3	\N
25	25	3	\N
26	26	3	\N
27	27	3	\N
28	28	3	\N
29	29	3	\N
30	30	3	\N
31	31	3	\N
32	32	3	\N
33	33	3	\N
34	34	3	\N
35	35	3	\N
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, user_id, project_id, created_on, mail_notification) FROM stdin;
2	5	2	2020-06-26 09:05:19.201642	f
3	5	3	2020-06-26 09:05:19.22206	f
4	5	16	2020-06-26 09:05:19.246032	f
5	5	17	2020-06-26 09:05:19.26417	f
6	5	18	2020-06-26 09:05:19.27559	f
7	5	19	2020-06-26 09:05:19.285123	f
8	5	20	2020-06-26 09:05:19.293703	f
10	5	23	2020-06-26 09:05:19.308907	f
11	5	24	2020-06-26 09:05:19.316419	f
12	5	25	2020-06-26 09:05:19.323688	f
13	5	26	2020-06-26 09:05:19.331013	f
14	5	27	2020-06-26 09:05:19.338174	f
15	5	28	2020-06-26 09:05:19.354023	f
16	5	29	2020-06-26 09:05:19.366741	f
17	5	4	2020-06-26 09:05:19.379414	f
18	5	32	2020-06-26 09:05:19.389432	f
19	5	33	2020-06-26 09:05:19.397463	f
20	5	34	2020-06-26 09:05:19.411618	f
21	5	35	2020-06-26 09:05:19.422643	f
22	5	41	2020-06-26 09:05:19.434746	f
23	5	37	2020-06-26 09:05:19.444205	f
24	5	38	2020-06-26 09:05:19.452083	f
25	5	39	2020-06-26 09:05:19.458741	f
26	5	40	2020-06-26 09:05:19.469954	f
27	5	5	2020-06-26 09:05:19.479489	f
28	5	10	2020-06-26 09:05:19.487332	f
29	5	30	2020-06-26 09:05:19.494126	f
30	5	31	2020-06-26 09:05:19.500753	f
31	5	11	2020-06-26 09:05:19.5069	f
32	5	12	2020-06-26 09:05:19.51333	f
33	5	15	2020-06-26 09:05:19.528377	f
34	5	14	2020-06-26 09:05:19.54005	f
35	5	13	2020-06-26 09:05:19.548421	f
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, board_id, parent_id, subject, content, author_id, replies_count, last_reply_id, created_on, updated_on, locked, sticky) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news (id, project_id, title, summary, description, author_id, created_on, comments_count) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_associations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.open_id_authentication_associations (id, issued, lifetime, handle, assoc_type, server_url, secret) FROM stdin;
\.


--
-- Data for Name: open_id_authentication_nonces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.open_id_authentication_nonces (id, "timestamp", server_url, salt) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, description, homepage, is_public, parent_id, created_on, updated_on, identifier, status, lft, rgt, inherit_members, default_version_id, default_assigned_to_id) FROM stdin;
11	SS			f	5	2020-06-19 04:42:27.828855	2020-06-19 04:42:27.828855	network_support_center_ss	1	61	62	f	\N	\N
13	XMAIL			f	12	2020-06-19 05:08:06.436515	2020-06-19 05:08:30.623586	network_support_center_svc_xmail	1	68	69	f	\N	\N
44	Handover (SS)			f	5	2020-06-29 07:48:19.275138	2020-06-29 07:48:19.275138	network_support_center_ss_handover	1	59	60	f	\N	\N
34	GNOS			f	4	2020-06-24 06:40:34.766219	2020-06-24 06:40:34.766219	japan_global_helpdesk_gnos	1	33	36	f	\N	\N
35	GNOS (IIJ AM)			f	34	2020-06-24 06:41:55.384746	2020-06-24 06:41:55.384746	japan_global_helpdesk_gnos_iij	1	34	35	f	\N	\N
27	Other	※国内ヘルプデスクその他サービス		f	3	2020-06-24 02:42:19.736052	2020-06-24 02:42:19.736052	japan_domestic_helpdesk_other	1	21	22	f	\N	\N
19	IIJ Global's Solution			f	3	2020-06-24 02:23:59.319154	2020-06-24 02:23:59.319154	japan_domestic_helpdesk_iij_globals_solution	1	9	12	f	\N	\N
3	Customer Support Center			f	2	2020-06-18 09:04:00.433544	2020-06-18 09:05:56.794462	customer-support-center	1	2	27	f	\N	\N
26	NOS（GSC）			f	24	2020-06-24 02:35:34.912026	2020-06-24 02:35:34.912026	japan_domestic_helpdesk_nos-gsc	1	18	19	f	\N	\N
38	OFR			f	4	2020-06-24 06:45:32.237146	2020-06-24 06:45:32.237146	japan_global_helpdesk_ofr	1	43	44	f	\N	\N
39	Other	※国際ヘルプデスクその他サービス		f	4	2020-06-24 06:46:45.549918	2020-06-24 06:46:59.303341	japan_global_helpdesk_other	1	45	46	f	\N	\N
10	ES			f	5	2020-06-19 04:41:26.796196	2020-06-19 04:41:26.796196	network_support_center_es	1	51	56	f	\N	\N
37	IP-HC UK			f	4	2020-06-24 06:44:26.436046	2020-06-24 06:44:26.436046	japan_global_helpdesk_iphcuk	1	41	42	f	\N	\N
40	USGIO R Series			f	4	2020-06-24 06:48:23.161487	2020-06-24 06:48:23.161487	japan_global_helpdesk_usgio_r	1	47	48	f	\N	\N
4	Global Support Center			f	2	2020-06-18 09:05:43.686712	2020-06-18 09:05:43.686712	global-support-center	1	28	49	f	\N	\N
42	Handover			f	4	2020-06-29 06:54:38.441746	2020-06-29 06:54:38.441746	japan_global_helpdesk_handover	1	37	38	f	\N	\N
43	Handover (ES)			f	5	2020-06-29 06:56:04.864378	2020-06-29 06:56:04.864378	network_support_center_es_handover	1	57	58	f	\N	\N
5	Network Support Center			f	2	2020-06-18 09:06:58.517132	2020-06-18 09:06:58.517132	network-support-center	1	50	71	f	\N	\N
20	IIJ Global's Solution（GSC）			f	19	2020-06-24 02:24:51.114666	2020-06-24 02:30:07.358584	japan_domestic_helpdesk_iij_globals_solution-gsc	1	10	11	f	\N	\N
12	SVC			f	5	2020-06-19 05:05:58.011641	2020-06-19 05:06:10.757044	network_support_center_svc	1	63	70	f	\N	\N
14	SpeedyRas			f	12	2020-06-19 05:21:58.68977	2020-06-19 05:23:08.647091	network_support_center_svc_speedyras	1	66	67	f	\N	\N
15	GCORE			f	12	2020-06-19 05:23:45.78115	2020-06-19 05:24:01.10948	network_support_center_svc_gcore	1	64	65	f	\N	\N
2	Service Desk			f	\N	2020-06-18 08:17:52.217772	2020-06-18 08:17:52.217772	service-desk	1	1	72	f	\N	\N
24	NOS			f	3	2020-06-24 02:33:47.935717	2020-06-24 02:33:47.935717	japan_domestic_helpdesk_nos	1	15	20	f	\N	\N
25	NOS（Aiful）			f	24	2020-06-24 02:34:46.250619	2020-06-24 02:35:50.766961	japan_domestic_helpdesk_nos_aiful	1	16	17	f	\N	\N
28	SecureLAN Solution		japan_domestic_helpdesk_slan	f	3	2020-06-24 02:43:17.953778	2020-06-24 02:43:17.953778	securelan-solution	1	23	26	f	\N	\N
17	Concierge(GSC)			f	16	2020-06-24 02:20:53.707181	2020-06-24 02:20:53.707181	japan_domestic_helpdesk_concierge-gsc	1	4	5	f	\N	\N
16	Concierge			f	3	2020-06-24 01:43:49.649377	2020-06-24 01:43:49.649377	japan_domestic_helpdesk_concierge	1	3	6	f	\N	\N
18	Handover			f	3	2020-06-24 02:23:04.734998	2020-06-24 02:23:04.734998	japan_domestic_helpdesk_handover	1	7	8	f	\N	\N
29	SecureLAN Solution（IIJ）			f	28	2020-06-24 02:44:08.925559	2020-06-24 02:44:08.925559	japan_domestic_helpdesk_slan_iij	1	24	25	f	\N	\N
23	Major Incident			f	3	2020-06-24 02:29:36.709308	2020-06-24 02:29:51.984576	japan_domestic_helpdesk_major_incident	1	13	14	f	\N	\N
32	GIO EU			f	4	2020-06-24 06:34:35.552867	2020-06-24 06:34:47.51649	gsc_gioeu	1	29	30	f	\N	\N
33	GIO SG			f	4	2020-06-24 06:35:43.993466	2020-06-24 06:35:43.993466	japan_global_helpdesk_giosg	1	31	32	f	\N	\N
30	GIO TypeZ			f	10	2020-06-24 02:53:35.65648	2020-06-24 02:53:35.65648	network_support_center_es_giotypez	1	52	53	f	\N	\N
31	Hosting ES			f	10	2020-06-24 02:55:48.682727	2020-06-24 02:55:48.682727	network_support_center_es_hosting	1	54	55	f	\N	\N
41	Hosting			f	4	2020-06-25 02:34:47.140663	2020-06-25 02:50:36.413251	japan_global_helpdesk_hosting	1	39	40	f	\N	\N
\.


--
-- Data for Name: projects_trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects_trackers (project_id, tracker_id) FROM stdin;
41	9
16	11
17	11
19	11
20	11
24	11
25	11
26	11
27	11
28	11
29	11
32	11
33	11
34	11
35	11
41	11
37	11
38	11
39	11
40	11
16	13
17	13
19	13
20	13
24	13
25	13
26	13
27	13
28	13
29	13
32	13
33	13
34	13
35	13
10	4
11	4
15	4
14	4
13	4
10	5
11	5
15	5
14	5
13	5
10	6
11	6
15	6
14	6
13	6
2	7
10	7
11	7
15	7
14	7
13	7
10	8
11	8
15	8
14	8
13	8
41	13
37	13
38	13
39	13
40	13
23	15
43	16
44	16
16	9
17	9
19	9
20	9
24	9
25	9
26	9
27	9
28	9
29	9
30	4
30	5
30	6
30	7
30	8
31	4
31	5
31	6
31	7
31	8
32	9
33	9
34	9
35	9
37	9
38	9
39	9
40	9
16	10
17	10
19	10
20	10
24	10
25	10
26	10
27	10
28	10
29	10
32	10
33	10
34	10
35	10
41	10
37	10
38	10
39	10
40	10
16	12
17	12
19	12
20	12
24	12
25	12
26	12
27	12
28	12
29	12
32	12
33	12
34	12
35	12
41	12
37	12
38	12
39	12
40	12
16	14
17	14
19	14
20	14
24	14
25	14
26	14
27	14
28	14
29	14
32	14
33	14
34	14
35	14
41	14
37	14
38	14
39	14
40	14
18	16
42	16
24	17
25	17
\.


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.queries (id, project_id, name, filters, user_id, column_names, sort_criteria, group_by, type, visibility, options) FROM stdin;
\.


--
-- Data for Name: queries_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.queries_roles (query_id, role_id) FROM stdin;
\.


--
-- Data for Name: repositories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.repositories (id, project_id, url, login, password, root_url, type, path_encoding, log_encoding, extra_info, identifier, is_default, created_on) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, "position", assignable, builtin, permissions, issues_visibility, users_visibility, time_entries_visibility, all_roles_managed, settings) FROM stdin;
1	Non member	0	t	1	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
2	Anonymous	0	t	2	---\n- :view_issues\n- :view_news\n- :view_messages\n	default	all	all	t	\N
3	TEAM_LEADER	1	t	0	---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_queries\n- :save_queries\n- :view_messages\n- :add_messages\n- :edit_messages\n- :edit_own_messages\n- :delete_messages\n- :delete_own_messages\n- :manage_boards\n- :view_calendar\n- :view_documents\n- :add_documents\n- :edit_documents\n- :delete_documents\n- :view_files\n- :manage_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :set_own_issues_private\n- :add_issue_notes\n- :edit_issue_notes\n- :edit_own_issue_notes\n- :view_private_notes\n- :set_notes_private\n- :delete_issues\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :manage_categories\n- :view_news\n- :manage_news\n- :comment_news\n- :view_changesets\n- :browse_repository\n- :commit_access\n- :manage_related_issues\n- :manage_repository\n- :view_time_entries\n- :log_time\n- :edit_time_entries\n- :edit_own_time_entries\n- :manage_project_activities\n- :log_time_for_other_users\n- :import_time_entries\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
4	統括者	2	t	0	---\n- :save_queries\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
5	使用者	3	t	0	---\n- :view_issues\n- :add_issues\n- :edit_issues\n- :edit_own_issues\n- :copy_issues\n- :manage_issue_relations\n- :manage_subtasks\n- :set_issues_private\n- :view_issue_watchers\n- :add_issue_watchers\n- :delete_issue_watchers\n- :import_issues\n- :view_wiki_pages\n- :view_wiki_edits\n- :export_wiki_pages\n- :edit_wiki_pages\n- :rename_wiki_pages\n- :delete_wiki_pages\n- :delete_wiki_pages_attachments\n	default	all	all	t	--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\npermissions_all_trackers: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: '1'\n  add_issues: '1'\n  edit_issues: '1'\n  add_issue_notes: '1'\n  delete_issues: '1'\npermissions_tracker_ids: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  view_issues: []\n  add_issues: []\n  edit_issues: []\n  add_issue_notes: []\n  delete_issues: []\n
\.


--
-- Data for Name: roles_managed_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles_managed_roles (role_id, managed_role_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
20090214190337
20090312172426
20090312194159
20090318181151
20090323224724
20090401221305
20090401231134
20090403001910
20090406161854
20090425161243
20090503121501
20090503121505
20090503121510
20090614091200
20090704172350
20090704172355
20090704172358
20091010093521
20091017212227
20091017212457
20091017212644
20091017212938
20091017213027
20091017213113
20091017213151
20091017213228
20091017213257
20091017213332
20091017213444
20091017213536
20091017213642
20091017213716
20091017213757
20091017213835
20091017213910
20091017214015
20091017214107
20091017214136
20091017214236
20091017214308
20091017214336
20091017214406
20091017214440
20091017214519
20091017214611
20091017214644
20091017214720
20091017214750
20091025163651
20091108092559
20091114105931
20091123212029
20091205124427
20091220183509
20091220183727
20091220184736
20091225164732
20091227112908
20100129193402
20100129193813
20100221100219
20100313132032
20100313171051
20100705164950
20100819172912
20101104182107
20101107130441
20101114115114
20101114115359
20110220160626
20110223180944
20110223180953
20110224000000
20110226120112
20110226120132
20110227125750
20110228000000
20110228000100
20110401192910
20110408103312
20110412065600
20110511000000
20110902000000
20111201201315
20120115143024
20120115143100
20120115143126
20120127174243
20120205111326
20120223110929
20120301153455
20120422150750
20120705074331
20120707064544
20120714122000
20120714122100
20120714122200
20120731164049
20120930112914
20121026002032
20121026003537
20121209123234
20121209123358
20121213084931
20130110122628
20130201184705
20130202090625
20130207175206
20130207181455
20130215073721
20130215111127
20130215111141
20130217094251
20130602092539
20130710182539
20130713104233
20130713111657
20130729070143
20130911193200
20131004113137
20131005100610
20131124175346
20131210180802
20131214094309
20131215104612
20131218183023
20140228130325
20140903143914
20140920094058
20141029181752
20141029181824
20141109112308
20141122124142
20150113194759
20150113211532
20150113213922
20150113213955
20150208105930
20150510083747
20150525103953
20150526183158
20150528084820
20150528092912
20150528093249
20150725112753
20150730122707
20150730122735
20150921204850
20150921210243
20151020182334
20151020182731
20151021184614
20151021185456
20151021190616
20151024082034
20151025072118
20151031095005
20160404080304
20160416072926
20160529063352
20161001122012
20161002133421
20161010081301
20161010081528
20161010081600
20161126094932
20161220091118
20170207050700
20170302015225
20170309214320
20170320051650
20170418090031
20170419144536
20170723112801
20180501132547
20180913072918
20180923082945
20180923091603
20190315094151
20190315102101
20190510070108
20190620135549
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, name, value, updated_on) FROM stdin;
1	rest_api_enabled	1	2020-06-17 09:10:42.353163
2	jsonp_enabled	1	2020-06-17 09:10:42.36197
3	ui_theme		2020-06-19 04:10:24.331832
4	default_language	en	2020-06-19 04:10:24.335476
5	force_default_language_for_anonymous	0	2020-06-19 04:10:24.342557
6	force_default_language_for_loggedin	0	2020-06-19 04:10:24.351269
7	start_of_week		2020-06-19 04:10:24.359986
8	date_format		2020-06-19 04:10:24.368687
9	time_format		2020-06-19 04:10:24.37697
10	timespan_format	decimal	2020-06-19 04:10:24.385405
11	user_format	firstname_lastname	2020-06-19 04:10:24.393612
12	gravatar_enabled	0	2020-06-19 04:10:24.401621
13	thumbnails_enabled	1	2020-06-19 04:10:24.409795
14	thumbnails_size	100	2020-06-19 04:10:24.418202
15	new_item_menu_tab	1	2020-06-19 04:10:24.426598
16	default_projects_public	0	2020-06-25 04:26:29.50556
17	default_projects_modules	---\n- issue_tracking\n- wiki\n	2020-06-25 04:26:29.516341
18	default_projects_tracker_ids	--- []\n	2020-06-25 04:26:29.526882
19	sequential_project_identifiers	0	2020-06-25 04:26:29.535849
20	project_list_defaults	---\n:column_names:\n- name\n- identifier\n- short_description\n	2020-06-25 04:26:29.553814
21	app_title	Redmine	2020-06-25 04:27:19.013713
22	welcome_text		2020-06-25 04:27:19.018212
23	per_page_options	25,50,100	2020-06-25 04:27:19.022818
24	search_results_per_page	10	2020-06-25 04:27:19.027607
25	activity_days_default	30	2020-06-25 04:27:19.032841
26	host_name	localhost:3000	2020-06-25 04:27:19.038636
27	protocol	http	2020-06-25 04:27:19.045624
28	text_formatting	textile	2020-06-25 04:27:19.054368
29	cache_formatted_text	0	2020-06-25 04:27:19.062681
30	wiki_compression		2020-06-25 04:27:19.071734
31	feeds_limit	15	2020-06-25 04:27:19.080696
\.


--
-- Data for Name: time_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.time_entries (id, project_id, user_id, issue_id, hours, comments, activity_id, spent_on, tyear, tmonth, tweek, created_on, updated_on, author_id) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, user_id, action, value, created_on, updated_on) FROM stdin;
14	5	session	52dc3d18cbfd53d0a9e33878d2558fa2cfd07953	2020-06-17 10:22:51.778066	2020-06-19 06:14:13.409108
42	5	session	93fc0ec77c183d65aa708ef5ae6a12a42352af0f	2020-07-30 09:33:28.166763	2020-07-30 09:49:07.291204
23	1	session	b828a76fa4326db5db87b1c96edc107b0fb5c28a	2020-06-18 08:51:57.894158	2020-06-18 08:52:19.769759
18	1	api	74f90f3633147719cdf4b5c7dca20b7442cf2fd8	2020-06-18 06:47:43.330007	2020-06-18 06:47:43.330007
11	5	api	93143d56262f3c95025c6c12de6b563990dade26	2020-06-17 09:10:57.509968	2020-06-17 09:10:57.509968
40	6	session	aa02e277e80041775a6223e50f37197c8b0f3c4b	2020-06-30 01:45:15.492826	2020-06-30 04:30:06.136722
4	1	feeds	8228ed7a18a4d4288b283f0760ed9a92cb127508	2020-06-17 09:01:44.247772	2020-06-17 09:01:44.247772
27	6	session	835bd2b760d4e9a04052e312b4b66c763d6382ef	2020-06-22 08:54:34.845819	2020-06-22 09:20:41.205274
15	5	session	872138e9ffe05db055e5c6764f19dc5a1f8f3993	2020-06-17 10:35:36.181983	2020-06-17 10:36:51.909072
21	6	session	53a9d350e06535868668145acd89d35b9bfa9950	2020-06-18 08:15:51.011698	2020-06-18 09:17:16.746154
29	6	session	8c8c3fb894c656f1b2f1b35162dcd0a031261730	2020-06-24 01:42:57.029437	2020-06-24 08:55:16.466549
30	5	session	5841e8150cf72eefd42a01bb171e3cedaa2806ef	2020-06-24 06:13:18.913117	2020-06-24 06:13:18.942031
28	6	session	88898c32ca9deee6a8a39d9b332429d68dcb878a	2020-06-22 23:59:45.774093	2020-06-23 09:00:59.154682
16	5	session	a04394538848ee98bc04a65de2339457a3e0654c	2020-06-18 02:24:31.847994	2020-06-18 15:58:24.868444
12	5	session	3632e04743529888180929a5e956c4b828f4fe98	2020-06-17 09:22:51.083972	2020-06-17 09:57:26.151468
8	5	feeds	48fa84aa949edd3b1805a7322523872329a11cd2	2020-06-17 09:10:11.758707	2020-06-17 09:10:11.758707
46	1	session	7b3f947d77e6264998298190dbbfcac3012a5279	2020-07-30 10:31:18.156896	2020-07-30 10:40:25.279938
13	1	session	8b6c3e62f2b750c5f14e573634c06e81d4efe50c	2020-06-17 10:09:42.649723	2020-06-17 10:09:57.892194
22	6	feeds	5f0a77cbecf8726285c0ca348d38b125d548e9f4	2020-06-18 08:15:51.154914	2020-06-18 08:15:51.154914
41	6	session	2ef1f6ad26810cdf4f73f5c57ce775c5a565bae6	2020-07-09 06:04:26.362267	2020-07-09 06:04:28.135032
25	6	session	d0ef0f33d23ce0efb2c40cfdd59dd85010080041	2020-06-22 04:32:06.590917	2020-06-22 08:09:25.851547
45	11	feeds	0967533b8dd2b1af8c872737cf056cecab81dfcc	2020-07-30 10:30:56.836511	2020-07-30 10:30:56.836511
38	1	session	ce37ada46c17c7b79035a0a48ade391b31bb89cf	2020-06-26 09:32:37.091185	2020-06-26 09:48:41.043812
31	1	session	81d02ffec39881c08174c5c1eef4075eb0e8a84d	2020-06-24 06:40:22.753014	2020-07-09 07:01:15.523172
24	6	session	52e3123bb35dee88b3ea84e5e866f7344e2b28d1	2020-06-19 02:04:44.250975	2020-06-19 09:13:21.030426
33	1	session	26368e93916a3a6d31fd581fa9d1b038b45d3738	2020-06-25 10:04:00.185826	2020-07-31 06:21:42.744269
32	6	session	057a1f953508a29e52611ecbe30275656b658998	2020-06-25 00:12:05.391785	2020-06-25 07:30:31.193163
39	6	session	91706500f4ea6ca5dde7eb44f77680ccb8e7a596	2020-06-29 01:00:49.712373	2020-06-29 08:50:44.502508
34	1	session	0e45a2e7c9f6cbb41e15fd19e211e5579efc50fd	2020-06-26 06:59:55.442246	2020-06-26 07:06:02.404207
\.


--
-- Data for Name: trackers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trackers (id, name, is_in_chlog, "position", is_in_roadmap, fields_bits, default_status_id, description) FROM stdin;
1	sonnth	f	1	t	0	1	new issue
2	member1	f	2	t	0	2	
3	member2	f	3	t	0	3	
5	Work Assist(OSC)	f	5	t	246	4	
4	Incident(OSC)	f	4	t	246	4	
6	Inquiry(OSC)	f	6	t	246	4	
7	Maintenance(OSC)	f	7	t	246	4	
8	Maintenance Notification(OSC)	f	8	f	246	4	
9	Incident	f	9	t	246	4	
10	Work Request	f	10	t	246	4	
11	WorkAssist	f	11	t	246	4	
12	Inquiry	f	12	t	246	4	
13	Maintenance	f	13	t	246	4	
14	Maintenance Notification	f	14	t	502	4	
15	Notification	f	15	t	246	4	
16	Handover	f	16	f	246	4	
17	Suspension Request	f	17	t	246	4	
\.


--
-- Data for Name: user_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_preferences (id, user_id, others, hide_mail, time_zone) FROM stdin;
2	5	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: '2,1'\n	t	
4	11	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n	t	Hanoi
1	1	---\n:no_self_notified: '1'\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:recently_used_project_ids: '17,20,3'\n	t	Hanoi
3	6	---\n:no_self_notified: '1'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: '1'\n:textarea_font: ''\n:recently_used_projects: 3\n:history_default_tab: notes\n:my_page_layout:\n  left:\n  - issuesassignedtome\n  right:\n  - issuesreportedbyme\n:my_page_settings: {}\n:recently_used_project_ids: '21,18,5'\n	t	
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, login, hashed_password, firstname, lastname, admin, status, last_login_on, language, auth_source_id, created_on, updated_on, type, identity_url, mail_notification, salt, must_change_passwd, passwd_changed_on) FROM stdin;
2				Anonymous users	f	1	\N		\N	2020-06-17 08:59:40.154803	2020-06-17 08:59:40.154803	GroupAnonymous	\N		\N	f	\N
3				Non member users	f	1	\N		\N	2020-06-17 08:59:40.17473	2020-06-17 08:59:40.17473	GroupNonMember	\N		\N	f	\N
4				Anonymous	f	0	\N		\N	2020-06-17 08:59:43.454801	2020-06-17 08:59:43.454801	AnonymousUser	\N	only_my_events	\N	f	\N
6	onozawa-m	10be1a83568d2d8472d76c6e15b5402e9c721008	Maiko	Onozawa	t	1	2020-07-09 06:04:26.358586	ja	\N	2020-06-18 08:15:09.686374	2020-06-18 08:15:09.686374	User	\N	only_my_events	d11d00055b6b030ff97aa1bf12d1aed9	f	2020-06-18 08:15:09
5	kwmctest	7384bb3b1f3b8ee24ffb4937966e684555965c22	Team	Leader	f	1	2020-07-30 09:33:28.163028	en	\N	2020-06-17 09:02:45.237115	2020-06-17 09:02:45.237115	User	\N	only_my_events	e279f1fbd5f82041f4c01875ebe05aad	f	2020-06-17 09:02:45
11	maivt	00ae7e1e3cc6ad14fdd28cd41ddd3b09a249a6a8	Ruby	Vu	f	1	2020-07-30 10:30:56.782896	vi	\N	2020-07-30 10:30:28.019468	2020-07-30 10:30:28.019468	User	\N	only_my_events	7f337feceb46ef5ec2d9db56911df0e9	f	2020-07-30 10:30:28
1	admin	5283888515f12be73732872021f836e9d28a137e	Kwmc	Admin	t	1	2020-07-30 10:31:18.154029	en	\N	2020-06-17 08:59:36.429058	2020-06-17 09:01:27.771944	User	\N	all	f43370186d9cd1bc8026dee60c2a88a4	f	2020-06-17 09:00:54
7				JP_ES_L	f	1	\N		\N	2020-06-19 08:58:42.481239	2020-06-19 08:58:42.481239	Group	\N		\N	f	\N
8				JP_ES	f	1	\N		\N	2020-06-19 08:58:54.683977	2020-06-19 08:58:54.683977	Group	\N		\N	f	\N
9				JP_SS	f	1	\N		\N	2020-06-19 08:59:05.807398	2020-06-19 08:59:05.807398	Group	\N		\N	f	\N
10				JP_SS_L	f	1	\N		\N	2020-06-19 08:59:16.814646	2020-06-19 08:59:16.814646	Group	\N		\N	f	\N
\.


--
-- Data for Name: versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versions (id, project_id, name, description, effective_date, created_on, updated_on, wiki_page_title, status, sharing) FROM stdin;
\.


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.watchers (id, watchable_type, watchable_id, user_id) FROM stdin;
\.


--
-- Data for Name: wiki_content_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_content_versions (id, wiki_content_id, page_id, author_id, data, compression, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_contents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_contents (id, page_id, author_id, text, comments, updated_on, version) FROM stdin;
\.


--
-- Data for Name: wiki_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_pages (id, wiki_id, title, created_on, protected, parent_id) FROM stdin;
\.


--
-- Data for Name: wiki_redirects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wiki_redirects (id, wiki_id, title, redirects_to, created_on, redirects_to_wiki_id) FROM stdin;
\.


--
-- Data for Name: wikis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.wikis (id, project_id, start_page, status) FROM stdin;
1	2	Wiki	1
2	3	Wiki	1
3	4	Wiki	1
4	5	Wiki	1
9	10	Wiki	1
10	11	Wiki	1
11	12	Wiki	1
12	13	Wiki	1
13	14	Wiki	1
14	15	Wiki	1
15	16	Wiki	1
16	17	Wiki	1
17	18	Wiki	1
18	19	Wiki	1
19	20	Wiki	1
22	23	Wiki	1
23	24	Wiki	1
24	25	Wiki	1
25	26	Wiki	1
26	27	Wiki	1
27	28	Wiki	1
28	29	Wiki	1
29	30	Wiki	1
30	31	Wiki	1
31	32	Wiki	1
32	33	Wiki	1
33	34	Wiki	1
34	35	Wiki	1
36	37	Wiki	1
37	38	Wiki	1
38	39	Wiki	1
39	40	Wiki	1
40	41	Wiki	1
41	42	Wiki	1
42	43	Wiki	1
43	44	Wiki	1
\.


--
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.workflows (id, tracker_id, old_status_id, new_status_id, role_id, assignee, author, type, field_name, rule) FROM stdin;
942	5	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
943	5	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
944	5	12	0	4	f	f	WorkflowPermission	2	required
945	5	12	0	4	f	f	WorkflowPermission	3	required
946	5	12	0	4	f	f	WorkflowPermission	4	required
947	5	12	0	4	f	f	WorkflowPermission	5	required
948	5	12	0	4	f	f	WorkflowPermission	7	required
8	4	12	4	4	f	f	WorkflowTransition	\N	\N
9	4	13	4	4	f	f	WorkflowTransition	\N	\N
10	4	14	4	4	f	f	WorkflowTransition	\N	\N
11	4	15	4	4	f	f	WorkflowTransition	\N	\N
12	4	4	5	4	f	f	WorkflowTransition	\N	\N
13	4	4	6	4	f	f	WorkflowTransition	\N	\N
14	4	4	14	4	f	f	WorkflowTransition	\N	\N
15	4	4	15	4	f	f	WorkflowTransition	\N	\N
16	4	5	6	4	f	f	WorkflowTransition	\N	\N
17	4	5	14	4	f	f	WorkflowTransition	\N	\N
18	4	5	15	4	f	f	WorkflowTransition	\N	\N
19	4	6	7	4	f	f	WorkflowTransition	\N	\N
20	4	6	8	4	f	f	WorkflowTransition	\N	\N
21	4	6	9	4	f	f	WorkflowTransition	\N	\N
22	4	6	10	4	f	f	WorkflowTransition	\N	\N
23	4	6	11	4	f	f	WorkflowTransition	\N	\N
24	4	6	12	4	f	f	WorkflowTransition	\N	\N
25	4	6	13	4	f	f	WorkflowTransition	\N	\N
26	4	6	14	4	f	f	WorkflowTransition	\N	\N
27	4	6	15	4	f	f	WorkflowTransition	\N	\N
28	4	7	14	4	f	f	WorkflowTransition	\N	\N
29	4	7	15	4	f	f	WorkflowTransition	\N	\N
30	4	8	14	4	f	f	WorkflowTransition	\N	\N
31	4	8	15	4	f	f	WorkflowTransition	\N	\N
32	4	9	14	4	f	f	WorkflowTransition	\N	\N
33	4	9	15	4	f	f	WorkflowTransition	\N	\N
34	4	10	14	4	f	f	WorkflowTransition	\N	\N
35	4	10	15	4	f	f	WorkflowTransition	\N	\N
36	4	11	14	4	f	f	WorkflowTransition	\N	\N
37	4	11	15	4	f	f	WorkflowTransition	\N	\N
2689	6	6	4	4	f	f	WorkflowTransition	\N	\N
39	4	12	14	4	f	f	WorkflowTransition	\N	\N
40	4	12	15	4	f	f	WorkflowTransition	\N	\N
41	4	13	6	4	f	f	WorkflowTransition	\N	\N
42	4	13	14	4	f	f	WorkflowTransition	\N	\N
43	4	13	15	4	f	f	WorkflowTransition	\N	\N
44	4	14	6	4	f	f	WorkflowTransition	\N	\N
45	4	14	15	4	f	f	WorkflowTransition	\N	\N
46	4	15	6	4	f	f	WorkflowTransition	\N	\N
47	4	6	5	4	f	f	WorkflowTransition	\N	\N
48	4	7	8	4	f	f	WorkflowTransition	\N	\N
49	4	7	9	4	f	f	WorkflowTransition	\N	\N
50	4	7	10	4	f	f	WorkflowTransition	\N	\N
51	4	7	11	4	f	f	WorkflowTransition	\N	\N
52	4	7	12	4	f	f	WorkflowTransition	\N	\N
53	4	7	13	4	f	f	WorkflowTransition	\N	\N
54	4	8	9	4	f	f	WorkflowTransition	\N	\N
55	4	8	10	4	f	f	WorkflowTransition	\N	\N
56	4	8	11	4	f	f	WorkflowTransition	\N	\N
57	4	8	12	4	f	f	WorkflowTransition	\N	\N
58	4	8	13	4	f	f	WorkflowTransition	\N	\N
59	4	9	10	4	f	f	WorkflowTransition	\N	\N
60	4	9	11	4	f	f	WorkflowTransition	\N	\N
61	4	9	12	4	f	f	WorkflowTransition	\N	\N
62	4	9	13	4	f	f	WorkflowTransition	\N	\N
63	4	10	11	4	f	f	WorkflowTransition	\N	\N
64	4	10	12	4	f	f	WorkflowTransition	\N	\N
65	4	10	13	4	f	f	WorkflowTransition	\N	\N
66	4	11	12	4	f	f	WorkflowTransition	\N	\N
67	4	11	13	4	f	f	WorkflowTransition	\N	\N
68	4	12	13	4	f	f	WorkflowTransition	\N	\N
69	4	11	6	4	f	f	WorkflowTransition	\N	\N
70	5	12	4	4	f	f	WorkflowTransition	\N	\N
71	5	13	4	4	f	f	WorkflowTransition	\N	\N
2690	6	7	6	4	f	f	WorkflowTransition	\N	\N
73	5	15	4	4	f	f	WorkflowTransition	\N	\N
2691	6	8	6	4	f	f	WorkflowTransition	\N	\N
75	5	4	6	4	f	f	WorkflowTransition	\N	\N
2692	6	8	7	4	f	f	WorkflowTransition	\N	\N
77	5	4	15	4	f	f	WorkflowTransition	\N	\N
2693	6	9	6	4	f	f	WorkflowTransition	\N	\N
2694	6	9	7	4	f	f	WorkflowTransition	\N	\N
2695	6	9	8	4	f	f	WorkflowTransition	\N	\N
81	5	6	7	4	f	f	WorkflowTransition	\N	\N
82	5	6	8	4	f	f	WorkflowTransition	\N	\N
83	5	6	9	4	f	f	WorkflowTransition	\N	\N
84	5	6	10	4	f	f	WorkflowTransition	\N	\N
85	5	6	11	4	f	f	WorkflowTransition	\N	\N
86	5	6	12	4	f	f	WorkflowTransition	\N	\N
87	5	6	13	4	f	f	WorkflowTransition	\N	\N
2696	6	10	6	4	f	f	WorkflowTransition	\N	\N
89	5	6	15	4	f	f	WorkflowTransition	\N	\N
2697	6	10	7	4	f	f	WorkflowTransition	\N	\N
91	5	7	15	4	f	f	WorkflowTransition	\N	\N
2698	6	10	8	4	f	f	WorkflowTransition	\N	\N
93	5	8	15	4	f	f	WorkflowTransition	\N	\N
2699	6	10	9	4	f	f	WorkflowTransition	\N	\N
95	5	9	15	4	f	f	WorkflowTransition	\N	\N
97	5	10	15	4	f	f	WorkflowTransition	\N	\N
2700	6	11	7	4	f	f	WorkflowTransition	\N	\N
99	5	11	15	4	f	f	WorkflowTransition	\N	\N
2701	6	11	8	4	f	f	WorkflowTransition	\N	\N
101	5	12	15	4	f	f	WorkflowTransition	\N	\N
102	5	13	6	4	f	f	WorkflowTransition	\N	\N
2702	6	11	9	4	f	f	WorkflowTransition	\N	\N
104	5	13	15	4	f	f	WorkflowTransition	\N	\N
2703	6	11	10	4	f	f	WorkflowTransition	\N	\N
2704	7	4	6	5	f	f	WorkflowTransition	\N	\N
107	5	15	6	4	f	f	WorkflowTransition	\N	\N
2705	7	4	15	5	f	f	WorkflowTransition	\N	\N
109	5	7	8	4	f	f	WorkflowTransition	\N	\N
110	5	7	9	4	f	f	WorkflowTransition	\N	\N
111	5	7	10	4	f	f	WorkflowTransition	\N	\N
112	5	7	11	4	f	f	WorkflowTransition	\N	\N
113	5	7	12	4	f	f	WorkflowTransition	\N	\N
114	5	7	13	4	f	f	WorkflowTransition	\N	\N
115	5	8	9	4	f	f	WorkflowTransition	\N	\N
116	5	8	10	4	f	f	WorkflowTransition	\N	\N
117	5	8	11	4	f	f	WorkflowTransition	\N	\N
118	5	8	12	4	f	f	WorkflowTransition	\N	\N
119	5	8	13	4	f	f	WorkflowTransition	\N	\N
120	5	9	10	4	f	f	WorkflowTransition	\N	\N
121	5	9	11	4	f	f	WorkflowTransition	\N	\N
122	5	9	12	4	f	f	WorkflowTransition	\N	\N
123	5	9	13	4	f	f	WorkflowTransition	\N	\N
124	5	10	11	4	f	f	WorkflowTransition	\N	\N
125	5	10	12	4	f	f	WorkflowTransition	\N	\N
126	5	10	13	4	f	f	WorkflowTransition	\N	\N
127	5	11	12	4	f	f	WorkflowTransition	\N	\N
128	5	11	13	4	f	f	WorkflowTransition	\N	\N
129	5	12	13	4	f	f	WorkflowTransition	\N	\N
130	5	11	6	4	f	f	WorkflowTransition	\N	\N
133	4	14	4	5	f	f	WorkflowTransition	\N	\N
134	4	15	4	5	f	f	WorkflowTransition	\N	\N
135	4	4	5	5	f	f	WorkflowTransition	\N	\N
136	4	4	6	5	f	f	WorkflowTransition	\N	\N
137	4	4	14	5	f	f	WorkflowTransition	\N	\N
138	4	4	15	5	f	f	WorkflowTransition	\N	\N
139	4	5	6	5	f	f	WorkflowTransition	\N	\N
140	4	5	14	5	f	f	WorkflowTransition	\N	\N
141	4	5	15	5	f	f	WorkflowTransition	\N	\N
142	4	6	7	5	f	f	WorkflowTransition	\N	\N
143	4	6	8	5	f	f	WorkflowTransition	\N	\N
144	4	6	9	5	f	f	WorkflowTransition	\N	\N
145	4	6	10	5	f	f	WorkflowTransition	\N	\N
146	4	6	11	5	f	f	WorkflowTransition	\N	\N
147	4	6	12	5	f	f	WorkflowTransition	\N	\N
149	4	6	14	5	f	f	WorkflowTransition	\N	\N
150	4	6	15	5	f	f	WorkflowTransition	\N	\N
151	4	7	14	5	f	f	WorkflowTransition	\N	\N
152	4	7	15	5	f	f	WorkflowTransition	\N	\N
153	4	8	14	5	f	f	WorkflowTransition	\N	\N
154	4	8	15	5	f	f	WorkflowTransition	\N	\N
155	4	9	14	5	f	f	WorkflowTransition	\N	\N
156	4	9	15	5	f	f	WorkflowTransition	\N	\N
157	4	10	14	5	f	f	WorkflowTransition	\N	\N
158	4	10	15	5	f	f	WorkflowTransition	\N	\N
159	4	11	14	5	f	f	WorkflowTransition	\N	\N
160	4	11	15	5	f	f	WorkflowTransition	\N	\N
161	4	12	14	5	f	f	WorkflowTransition	\N	\N
162	4	12	15	5	f	f	WorkflowTransition	\N	\N
166	4	14	6	5	f	f	WorkflowTransition	\N	\N
167	4	14	15	5	f	f	WorkflowTransition	\N	\N
168	4	15	6	5	f	f	WorkflowTransition	\N	\N
169	4	6	5	5	f	f	WorkflowTransition	\N	\N
170	4	7	8	5	f	f	WorkflowTransition	\N	\N
171	4	7	9	5	f	f	WorkflowTransition	\N	\N
172	4	7	10	5	f	f	WorkflowTransition	\N	\N
173	4	7	11	5	f	f	WorkflowTransition	\N	\N
174	4	7	12	5	f	f	WorkflowTransition	\N	\N
176	4	8	9	5	f	f	WorkflowTransition	\N	\N
177	4	8	10	5	f	f	WorkflowTransition	\N	\N
178	4	8	11	5	f	f	WorkflowTransition	\N	\N
179	4	8	12	5	f	f	WorkflowTransition	\N	\N
181	4	9	10	5	f	f	WorkflowTransition	\N	\N
182	4	9	11	5	f	f	WorkflowTransition	\N	\N
183	4	9	12	5	f	f	WorkflowTransition	\N	\N
185	4	10	11	5	f	f	WorkflowTransition	\N	\N
186	4	10	12	5	f	f	WorkflowTransition	\N	\N
188	4	11	12	5	f	f	WorkflowTransition	\N	\N
191	4	11	6	5	f	f	WorkflowTransition	\N	\N
192	4	7	6	5	f	f	WorkflowTransition	\N	\N
193	4	8	6	5	f	f	WorkflowTransition	\N	\N
194	4	9	6	5	f	f	WorkflowTransition	\N	\N
195	4	9	7	5	f	f	WorkflowTransition	\N	\N
196	4	9	8	5	f	f	WorkflowTransition	\N	\N
197	4	10	6	5	f	f	WorkflowTransition	\N	\N
198	4	10	7	5	f	f	WorkflowTransition	\N	\N
199	4	10	8	5	f	f	WorkflowTransition	\N	\N
200	4	10	9	5	f	f	WorkflowTransition	\N	\N
201	4	11	7	5	f	f	WorkflowTransition	\N	\N
202	4	11	8	5	f	f	WorkflowTransition	\N	\N
203	4	11	9	5	f	f	WorkflowTransition	\N	\N
204	4	11	10	5	f	f	WorkflowTransition	\N	\N
205	4	8	7	5	f	f	WorkflowTransition	\N	\N
206	4	7	6	4	f	f	WorkflowTransition	\N	\N
207	4	8	6	4	f	f	WorkflowTransition	\N	\N
208	4	8	7	4	f	f	WorkflowTransition	\N	\N
209	4	9	6	4	f	f	WorkflowTransition	\N	\N
210	4	9	7	4	f	f	WorkflowTransition	\N	\N
211	4	9	8	4	f	f	WorkflowTransition	\N	\N
212	4	10	6	4	f	f	WorkflowTransition	\N	\N
213	4	10	7	4	f	f	WorkflowTransition	\N	\N
214	4	10	8	4	f	f	WorkflowTransition	\N	\N
215	4	10	9	4	f	f	WorkflowTransition	\N	\N
216	4	11	7	4	f	f	WorkflowTransition	\N	\N
217	4	11	8	4	f	f	WorkflowTransition	\N	\N
218	4	11	9	4	f	f	WorkflowTransition	\N	\N
219	4	11	10	4	f	f	WorkflowTransition	\N	\N
949	5	12	0	4	f	f	WorkflowPermission	48	required
950	5	12	0	4	f	f	WorkflowPermission	9	required
951	5	12	0	4	f	f	WorkflowPermission	34	required
952	5	12	0	4	f	f	WorkflowPermission	35	required
953	5	12	0	4	f	f	WorkflowPermission	36	required
954	5	12	0	4	f	f	WorkflowPermission	37	readonly
955	5	12	0	4	f	f	WorkflowPermission	42	required
956	5	12	0	4	f	f	WorkflowPermission	43	required
957	5	12	0	4	f	f	WorkflowPermission	44	required
958	5	12	0	4	f	f	WorkflowPermission	45	required
959	5	12	0	4	f	f	WorkflowPermission	25	required
960	5	12	0	4	f	f	WorkflowPermission	46	required
961	5	12	0	4	f	f	WorkflowPermission	47	required
962	5	13	0	4	f	f	WorkflowPermission	project_id	readonly
963	5	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
964	5	13	0	4	f	f	WorkflowPermission	subject	readonly
965	5	13	0	4	f	f	WorkflowPermission	priority_id	readonly
966	5	13	0	4	f	f	WorkflowPermission	is_private	readonly
967	5	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
968	5	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
969	5	13	0	4	f	f	WorkflowPermission	description	readonly
970	5	13	0	4	f	f	WorkflowPermission	2	readonly
971	5	13	0	4	f	f	WorkflowPermission	3	readonly
972	5	13	0	4	f	f	WorkflowPermission	4	readonly
973	5	13	0	4	f	f	WorkflowPermission	5	readonly
974	5	13	0	4	f	f	WorkflowPermission	7	readonly
975	5	13	0	4	f	f	WorkflowPermission	48	readonly
976	5	13	0	4	f	f	WorkflowPermission	9	readonly
977	5	13	0	4	f	f	WorkflowPermission	34	readonly
978	5	13	0	4	f	f	WorkflowPermission	35	readonly
979	5	13	0	4	f	f	WorkflowPermission	36	readonly
980	5	13	0	4	f	f	WorkflowPermission	37	readonly
981	5	13	0	4	f	f	WorkflowPermission	38	readonly
982	5	13	0	4	f	f	WorkflowPermission	39	readonly
983	5	13	0	4	f	f	WorkflowPermission	40	readonly
984	5	13	0	4	f	f	WorkflowPermission	41	readonly
985	5	13	0	4	f	f	WorkflowPermission	42	readonly
986	5	13	0	4	f	f	WorkflowPermission	43	readonly
987	5	13	0	4	f	f	WorkflowPermission	44	readonly
988	5	13	0	4	f	f	WorkflowPermission	45	readonly
989	5	13	0	4	f	f	WorkflowPermission	25	readonly
990	5	13	0	4	f	f	WorkflowPermission	46	readonly
991	5	13	0	4	f	f	WorkflowPermission	47	readonly
992	5	13	0	4	f	f	WorkflowPermission	26	readonly
993	5	13	0	4	f	f	WorkflowPermission	27	readonly
994	5	13	0	4	f	f	WorkflowPermission	28	readonly
995	5	13	0	4	f	f	WorkflowPermission	29	readonly
996	5	14	0	4	f	f	WorkflowPermission	project_id	readonly
997	5	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
998	5	14	0	4	f	f	WorkflowPermission	subject	readonly
999	5	14	0	4	f	f	WorkflowPermission	priority_id	readonly
1000	5	14	0	4	f	f	WorkflowPermission	is_private	readonly
1001	5	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1002	5	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1003	5	14	0	4	f	f	WorkflowPermission	description	readonly
1004	5	14	0	4	f	f	WorkflowPermission	2	readonly
1005	5	14	0	4	f	f	WorkflowPermission	3	readonly
1006	5	14	0	4	f	f	WorkflowPermission	4	readonly
1007	5	14	0	4	f	f	WorkflowPermission	5	readonly
1008	5	14	0	4	f	f	WorkflowPermission	7	readonly
1009	5	14	0	4	f	f	WorkflowPermission	48	readonly
1010	5	14	0	4	f	f	WorkflowPermission	9	readonly
1011	5	14	0	4	f	f	WorkflowPermission	34	readonly
1012	5	14	0	4	f	f	WorkflowPermission	35	readonly
1013	5	14	0	4	f	f	WorkflowPermission	36	readonly
1014	5	14	0	4	f	f	WorkflowPermission	37	readonly
1015	5	14	0	4	f	f	WorkflowPermission	38	readonly
1016	5	14	0	4	f	f	WorkflowPermission	39	readonly
1017	5	14	0	4	f	f	WorkflowPermission	40	readonly
1018	5	14	0	4	f	f	WorkflowPermission	41	readonly
1019	5	14	0	4	f	f	WorkflowPermission	42	readonly
1020	5	14	0	4	f	f	WorkflowPermission	43	readonly
1021	5	14	0	4	f	f	WorkflowPermission	44	readonly
1022	5	14	0	4	f	f	WorkflowPermission	45	readonly
1023	5	14	0	4	f	f	WorkflowPermission	25	readonly
1024	5	14	0	4	f	f	WorkflowPermission	46	readonly
1025	5	14	0	4	f	f	WorkflowPermission	47	readonly
1026	5	14	0	4	f	f	WorkflowPermission	26	readonly
1027	5	14	0	4	f	f	WorkflowPermission	27	readonly
1028	5	14	0	4	f	f	WorkflowPermission	28	readonly
1029	5	14	0	4	f	f	WorkflowPermission	29	readonly
1030	5	15	0	4	f	f	WorkflowPermission	project_id	readonly
2706	7	6	4	5	f	f	WorkflowTransition	\N	\N
2707	7	6	7	5	f	f	WorkflowTransition	\N	\N
2708	7	6	8	5	f	f	WorkflowTransition	\N	\N
2709	7	6	9	5	f	f	WorkflowTransition	\N	\N
2710	7	6	10	5	f	f	WorkflowTransition	\N	\N
2711	7	6	11	5	f	f	WorkflowTransition	\N	\N
2712	7	6	12	5	f	f	WorkflowTransition	\N	\N
2713	7	6	15	5	f	f	WorkflowTransition	\N	\N
2714	7	7	6	5	f	f	WorkflowTransition	\N	\N
2715	7	7	8	5	f	f	WorkflowTransition	\N	\N
2716	7	7	9	5	f	f	WorkflowTransition	\N	\N
2717	7	7	10	5	f	f	WorkflowTransition	\N	\N
2718	7	7	11	5	f	f	WorkflowTransition	\N	\N
2719	7	7	12	5	f	f	WorkflowTransition	\N	\N
2720	7	7	15	5	f	f	WorkflowTransition	\N	\N
2721	7	8	6	5	f	f	WorkflowTransition	\N	\N
2722	7	8	7	5	f	f	WorkflowTransition	\N	\N
2723	7	8	9	5	f	f	WorkflowTransition	\N	\N
2724	7	8	10	5	f	f	WorkflowTransition	\N	\N
2725	7	8	11	5	f	f	WorkflowTransition	\N	\N
2726	7	8	12	5	f	f	WorkflowTransition	\N	\N
2727	7	8	15	5	f	f	WorkflowTransition	\N	\N
2728	7	9	6	5	f	f	WorkflowTransition	\N	\N
2729	7	9	7	5	f	f	WorkflowTransition	\N	\N
2730	7	9	8	5	f	f	WorkflowTransition	\N	\N
2731	7	9	10	5	f	f	WorkflowTransition	\N	\N
2732	7	9	11	5	f	f	WorkflowTransition	\N	\N
2733	7	9	12	5	f	f	WorkflowTransition	\N	\N
2734	7	9	15	5	f	f	WorkflowTransition	\N	\N
2735	7	10	6	5	f	f	WorkflowTransition	\N	\N
2736	7	10	7	5	f	f	WorkflowTransition	\N	\N
2737	7	10	8	5	f	f	WorkflowTransition	\N	\N
2738	7	10	9	5	f	f	WorkflowTransition	\N	\N
2739	7	10	11	5	f	f	WorkflowTransition	\N	\N
2740	7	10	12	5	f	f	WorkflowTransition	\N	\N
2741	7	10	15	5	f	f	WorkflowTransition	\N	\N
2742	7	11	6	5	f	f	WorkflowTransition	\N	\N
2743	7	11	7	5	f	f	WorkflowTransition	\N	\N
2744	7	11	8	5	f	f	WorkflowTransition	\N	\N
2745	7	11	9	5	f	f	WorkflowTransition	\N	\N
2746	7	11	10	5	f	f	WorkflowTransition	\N	\N
2747	7	11	12	5	f	f	WorkflowTransition	\N	\N
2748	7	11	15	5	f	f	WorkflowTransition	\N	\N
2749	7	7	6	4	f	f	WorkflowTransition	\N	\N
2750	7	8	6	4	f	f	WorkflowTransition	\N	\N
2751	7	8	7	4	f	f	WorkflowTransition	\N	\N
2752	7	9	6	4	f	f	WorkflowTransition	\N	\N
2753	7	9	7	4	f	f	WorkflowTransition	\N	\N
2754	7	9	8	4	f	f	WorkflowTransition	\N	\N
2755	7	10	6	4	f	f	WorkflowTransition	\N	\N
2756	7	10	7	4	f	f	WorkflowTransition	\N	\N
2757	7	10	8	4	f	f	WorkflowTransition	\N	\N
2758	7	10	9	4	f	f	WorkflowTransition	\N	\N
2759	7	11	7	4	f	f	WorkflowTransition	\N	\N
2760	7	11	8	4	f	f	WorkflowTransition	\N	\N
2761	7	11	9	4	f	f	WorkflowTransition	\N	\N
2762	7	11	10	4	f	f	WorkflowTransition	\N	\N
4714	11	12	4	4	f	f	WorkflowTransition	\N	\N
4715	11	13	4	4	f	f	WorkflowTransition	\N	\N
4716	11	15	4	4	f	f	WorkflowTransition	\N	\N
4717	11	4	6	4	f	f	WorkflowTransition	\N	\N
3043	8	15	0	5	f	f	WorkflowPermission	7	readonly
3044	8	15	0	5	f	f	WorkflowPermission	48	readonly
3045	8	15	0	5	f	f	WorkflowPermission	9	readonly
3046	8	15	0	5	f	f	WorkflowPermission	34	readonly
3047	8	15	0	5	f	f	WorkflowPermission	35	readonly
3048	8	15	0	5	f	f	WorkflowPermission	36	readonly
3049	8	15	0	5	f	f	WorkflowPermission	37	readonly
4718	11	4	15	4	f	f	WorkflowTransition	\N	\N
4719	11	6	7	4	f	f	WorkflowTransition	\N	\N
4720	11	6	8	4	f	f	WorkflowTransition	\N	\N
4721	11	6	9	4	f	f	WorkflowTransition	\N	\N
3054	8	15	0	5	f	f	WorkflowPermission	42	readonly
3055	8	15	0	5	f	f	WorkflowPermission	43	readonly
3056	8	15	0	5	f	f	WorkflowPermission	44	readonly
3057	8	15	0	5	f	f	WorkflowPermission	45	readonly
3058	8	15	0	5	f	f	WorkflowPermission	25	readonly
3059	8	15	0	5	f	f	WorkflowPermission	46	readonly
3060	8	15	0	5	f	f	WorkflowPermission	47	readonly
4722	11	6	10	4	f	f	WorkflowTransition	\N	\N
4723	11	6	11	4	f	f	WorkflowTransition	\N	\N
4724	11	6	12	4	f	f	WorkflowTransition	\N	\N
4725	11	6	13	4	f	f	WorkflowTransition	\N	\N
3065	8	4	6	5	f	f	WorkflowTransition	\N	\N
3066	8	6	4	5	f	f	WorkflowTransition	\N	\N
3067	8	6	7	5	f	f	WorkflowTransition	\N	\N
3068	8	6	8	5	f	f	WorkflowTransition	\N	\N
3069	8	6	9	5	f	f	WorkflowTransition	\N	\N
3070	8	6	10	5	f	f	WorkflowTransition	\N	\N
3071	8	6	11	5	f	f	WorkflowTransition	\N	\N
3072	8	6	12	5	f	f	WorkflowTransition	\N	\N
3073	8	6	15	5	f	f	WorkflowTransition	\N	\N
3074	8	7	6	5	f	f	WorkflowTransition	\N	\N
3075	8	7	8	5	f	f	WorkflowTransition	\N	\N
3076	8	7	9	5	f	f	WorkflowTransition	\N	\N
3077	8	7	10	5	f	f	WorkflowTransition	\N	\N
4726	11	6	15	4	f	f	WorkflowTransition	\N	\N
4727	11	7	15	4	f	f	WorkflowTransition	\N	\N
4728	11	8	15	4	f	f	WorkflowTransition	\N	\N
4729	11	9	15	4	f	f	WorkflowTransition	\N	\N
4730	11	10	15	4	f	f	WorkflowTransition	\N	\N
4731	11	11	15	4	f	f	WorkflowTransition	\N	\N
2769	8	12	0	4	f	f	WorkflowPermission	7	required
2770	8	12	4	4	f	f	WorkflowTransition	\N	\N
2771	8	13	4	4	f	f	WorkflowTransition	\N	\N
2772	8	15	4	4	f	f	WorkflowTransition	\N	\N
2773	8	4	6	4	f	f	WorkflowTransition	\N	\N
2774	8	4	15	4	f	f	WorkflowTransition	\N	\N
2775	8	6	7	4	f	f	WorkflowTransition	\N	\N
2776	8	6	8	4	f	f	WorkflowTransition	\N	\N
2777	8	6	9	4	f	f	WorkflowTransition	\N	\N
1442	4	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
1443	4	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
1444	4	12	0	4	f	f	WorkflowPermission	2	required
1445	4	12	0	4	f	f	WorkflowPermission	3	required
1446	4	12	0	4	f	f	WorkflowPermission	4	required
1447	4	12	0	4	f	f	WorkflowPermission	5	required
1448	4	12	0	4	f	f	WorkflowPermission	6	required
1449	4	12	0	4	f	f	WorkflowPermission	7	required
1450	4	12	0	4	f	f	WorkflowPermission	8	required
1451	4	12	0	4	f	f	WorkflowPermission	9	required
1452	4	12	0	4	f	f	WorkflowPermission	10	required
1453	4	12	0	4	f	f	WorkflowPermission	13	required
1454	4	12	0	4	f	f	WorkflowPermission	11	required
1455	4	12	0	4	f	f	WorkflowPermission	12	required
1456	4	12	0	4	f	f	WorkflowPermission	14	required
1457	4	12	0	4	f	f	WorkflowPermission	15	required
1458	4	12	0	4	f	f	WorkflowPermission	16	required
1459	4	12	0	4	f	f	WorkflowPermission	17	required
1460	4	12	0	4	f	f	WorkflowPermission	18	required
1461	4	12	0	4	f	f	WorkflowPermission	19	required
1462	4	12	0	4	f	f	WorkflowPermission	20	required
1463	4	12	0	4	f	f	WorkflowPermission	21	required
1464	4	12	0	4	f	f	WorkflowPermission	22	required
1465	4	12	0	4	f	f	WorkflowPermission	23	required
1466	4	12	0	4	f	f	WorkflowPermission	24	required
1467	4	12	0	4	f	f	WorkflowPermission	25	required
1468	4	13	0	4	f	f	WorkflowPermission	project_id	readonly
1469	4	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
1470	4	13	0	4	f	f	WorkflowPermission	subject	readonly
1471	4	13	0	4	f	f	WorkflowPermission	priority_id	readonly
1472	4	13	0	4	f	f	WorkflowPermission	is_private	readonly
1473	4	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1474	4	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1475	4	13	0	4	f	f	WorkflowPermission	description	readonly
1476	4	13	0	4	f	f	WorkflowPermission	2	readonly
1477	4	13	0	4	f	f	WorkflowPermission	3	readonly
1478	4	13	0	4	f	f	WorkflowPermission	4	readonly
1479	4	13	0	4	f	f	WorkflowPermission	5	readonly
1480	4	13	0	4	f	f	WorkflowPermission	6	readonly
1481	4	13	0	4	f	f	WorkflowPermission	7	readonly
1482	4	13	0	4	f	f	WorkflowPermission	8	readonly
1483	4	13	0	4	f	f	WorkflowPermission	9	readonly
1484	4	13	0	4	f	f	WorkflowPermission	10	readonly
1485	4	13	0	4	f	f	WorkflowPermission	13	readonly
1486	4	13	0	4	f	f	WorkflowPermission	11	readonly
1487	4	13	0	4	f	f	WorkflowPermission	12	readonly
1488	4	13	0	4	f	f	WorkflowPermission	14	readonly
1489	4	13	0	4	f	f	WorkflowPermission	15	readonly
1490	4	13	0	4	f	f	WorkflowPermission	16	readonly
1491	4	13	0	4	f	f	WorkflowPermission	17	readonly
1492	4	13	0	4	f	f	WorkflowPermission	18	readonly
1493	4	13	0	4	f	f	WorkflowPermission	19	readonly
1494	4	13	0	4	f	f	WorkflowPermission	20	readonly
1495	4	13	0	4	f	f	WorkflowPermission	21	readonly
1496	4	13	0	4	f	f	WorkflowPermission	22	readonly
1497	4	13	0	4	f	f	WorkflowPermission	23	readonly
1498	4	13	0	4	f	f	WorkflowPermission	24	readonly
1499	4	13	0	4	f	f	WorkflowPermission	25	readonly
1500	4	13	0	4	f	f	WorkflowPermission	26	readonly
1501	4	13	0	4	f	f	WorkflowPermission	27	readonly
1502	4	13	0	4	f	f	WorkflowPermission	28	readonly
1503	4	13	0	4	f	f	WorkflowPermission	29	readonly
1504	4	14	0	4	f	f	WorkflowPermission	project_id	readonly
1505	4	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
1506	4	14	0	4	f	f	WorkflowPermission	subject	readonly
1507	4	14	0	4	f	f	WorkflowPermission	priority_id	readonly
1508	4	14	0	4	f	f	WorkflowPermission	is_private	readonly
1509	4	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1510	4	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1511	4	14	0	4	f	f	WorkflowPermission	description	readonly
1512	4	14	0	4	f	f	WorkflowPermission	2	readonly
1513	4	14	0	4	f	f	WorkflowPermission	3	readonly
1514	4	14	0	4	f	f	WorkflowPermission	4	readonly
1515	4	14	0	4	f	f	WorkflowPermission	5	readonly
1516	4	14	0	4	f	f	WorkflowPermission	6	readonly
1517	4	14	0	4	f	f	WorkflowPermission	7	readonly
1518	4	14	0	4	f	f	WorkflowPermission	8	readonly
1519	4	14	0	4	f	f	WorkflowPermission	9	readonly
1520	4	14	0	4	f	f	WorkflowPermission	10	readonly
1521	4	14	0	4	f	f	WorkflowPermission	13	readonly
1522	4	14	0	4	f	f	WorkflowPermission	11	readonly
1523	4	14	0	4	f	f	WorkflowPermission	12	readonly
1524	4	14	0	4	f	f	WorkflowPermission	14	readonly
1525	4	14	0	4	f	f	WorkflowPermission	15	readonly
1526	4	14	0	4	f	f	WorkflowPermission	16	readonly
1527	4	14	0	4	f	f	WorkflowPermission	17	readonly
1528	4	14	0	4	f	f	WorkflowPermission	18	readonly
1529	4	14	0	4	f	f	WorkflowPermission	19	readonly
1530	4	14	0	4	f	f	WorkflowPermission	20	readonly
1531	4	14	0	4	f	f	WorkflowPermission	21	readonly
1532	4	14	0	4	f	f	WorkflowPermission	22	readonly
1533	4	14	0	4	f	f	WorkflowPermission	23	readonly
1534	4	14	0	4	f	f	WorkflowPermission	24	readonly
1535	4	14	0	4	f	f	WorkflowPermission	25	readonly
1536	4	14	0	4	f	f	WorkflowPermission	26	readonly
1537	4	14	0	4	f	f	WorkflowPermission	27	readonly
1538	4	14	0	4	f	f	WorkflowPermission	28	readonly
1539	4	14	0	4	f	f	WorkflowPermission	29	readonly
1540	4	15	0	4	f	f	WorkflowPermission	project_id	readonly
1541	4	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
1542	4	15	0	4	f	f	WorkflowPermission	subject	readonly
1543	4	15	0	4	f	f	WorkflowPermission	priority_id	readonly
1544	4	15	0	4	f	f	WorkflowPermission	is_private	readonly
1545	4	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1546	4	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1547	4	15	0	4	f	f	WorkflowPermission	description	readonly
1548	4	15	0	4	f	f	WorkflowPermission	2	readonly
1549	4	15	0	4	f	f	WorkflowPermission	3	readonly
1550	4	15	0	4	f	f	WorkflowPermission	4	readonly
1551	4	15	0	4	f	f	WorkflowPermission	5	readonly
1552	4	15	0	4	f	f	WorkflowPermission	6	readonly
1553	4	15	0	4	f	f	WorkflowPermission	7	readonly
1554	4	15	0	4	f	f	WorkflowPermission	8	readonly
1555	4	15	0	4	f	f	WorkflowPermission	9	readonly
1556	4	15	0	4	f	f	WorkflowPermission	10	readonly
1557	4	15	0	4	f	f	WorkflowPermission	13	readonly
1558	4	15	0	4	f	f	WorkflowPermission	11	readonly
1559	4	15	0	4	f	f	WorkflowPermission	12	readonly
1560	4	15	0	4	f	f	WorkflowPermission	14	readonly
1561	4	15	0	4	f	f	WorkflowPermission	15	readonly
1562	4	15	0	4	f	f	WorkflowPermission	16	readonly
1563	4	15	0	4	f	f	WorkflowPermission	17	readonly
1564	4	15	0	4	f	f	WorkflowPermission	18	readonly
1565	4	15	0	4	f	f	WorkflowPermission	19	readonly
1566	4	15	0	4	f	f	WorkflowPermission	20	readonly
1567	4	15	0	4	f	f	WorkflowPermission	21	readonly
1568	4	15	0	4	f	f	WorkflowPermission	22	readonly
1569	4	15	0	4	f	f	WorkflowPermission	23	readonly
1570	4	15	0	4	f	f	WorkflowPermission	24	readonly
1571	4	15	0	4	f	f	WorkflowPermission	25	readonly
1572	4	15	0	4	f	f	WorkflowPermission	26	readonly
1573	4	15	0	4	f	f	WorkflowPermission	27	readonly
1574	4	15	0	4	f	f	WorkflowPermission	28	readonly
1575	4	15	0	4	f	f	WorkflowPermission	29	readonly
1697	6	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
1698	6	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
1699	6	12	0	4	f	f	WorkflowPermission	2	required
1700	6	12	0	4	f	f	WorkflowPermission	3	required
1701	6	12	0	4	f	f	WorkflowPermission	4	required
1702	6	12	0	4	f	f	WorkflowPermission	5	required
1703	6	12	0	4	f	f	WorkflowPermission	7	required
1704	6	12	0	4	f	f	WorkflowPermission	48	required
1705	6	12	0	4	f	f	WorkflowPermission	9	required
2778	8	6	10	4	f	f	WorkflowTransition	\N	\N
556	6	12	4	4	f	f	WorkflowTransition	\N	\N
557	6	13	4	4	f	f	WorkflowTransition	\N	\N
2779	8	6	11	4	f	f	WorkflowTransition	\N	\N
559	6	15	4	4	f	f	WorkflowTransition	\N	\N
2780	8	6	12	4	f	f	WorkflowTransition	\N	\N
561	6	4	6	4	f	f	WorkflowTransition	\N	\N
2781	8	6	13	4	f	f	WorkflowTransition	\N	\N
563	6	4	15	4	f	f	WorkflowTransition	\N	\N
2782	8	6	15	4	f	f	WorkflowTransition	\N	\N
2783	8	7	15	4	f	f	WorkflowTransition	\N	\N
2784	8	8	15	4	f	f	WorkflowTransition	\N	\N
567	6	6	7	4	f	f	WorkflowTransition	\N	\N
568	6	6	8	4	f	f	WorkflowTransition	\N	\N
569	6	6	9	4	f	f	WorkflowTransition	\N	\N
570	6	6	10	4	f	f	WorkflowTransition	\N	\N
571	6	6	11	4	f	f	WorkflowTransition	\N	\N
572	6	6	12	4	f	f	WorkflowTransition	\N	\N
573	6	6	13	4	f	f	WorkflowTransition	\N	\N
2785	8	9	15	4	f	f	WorkflowTransition	\N	\N
575	6	6	15	4	f	f	WorkflowTransition	\N	\N
2786	8	10	15	4	f	f	WorkflowTransition	\N	\N
577	6	7	15	4	f	f	WorkflowTransition	\N	\N
2787	8	11	15	4	f	f	WorkflowTransition	\N	\N
579	6	8	15	4	f	f	WorkflowTransition	\N	\N
2788	8	12	15	4	f	f	WorkflowTransition	\N	\N
581	6	9	15	4	f	f	WorkflowTransition	\N	\N
2789	8	13	6	4	f	f	WorkflowTransition	\N	\N
583	6	10	15	4	f	f	WorkflowTransition	\N	\N
2790	8	13	15	4	f	f	WorkflowTransition	\N	\N
585	6	11	15	4	f	f	WorkflowTransition	\N	\N
587	6	12	15	4	f	f	WorkflowTransition	\N	\N
588	6	13	6	4	f	f	WorkflowTransition	\N	\N
2791	8	15	6	4	f	f	WorkflowTransition	\N	\N
590	6	13	15	4	f	f	WorkflowTransition	\N	\N
2792	8	7	8	4	f	f	WorkflowTransition	\N	\N
2793	8	7	9	4	f	f	WorkflowTransition	\N	\N
593	6	15	6	4	f	f	WorkflowTransition	\N	\N
2794	8	7	10	4	f	f	WorkflowTransition	\N	\N
595	6	7	8	4	f	f	WorkflowTransition	\N	\N
596	6	7	9	4	f	f	WorkflowTransition	\N	\N
597	6	7	10	4	f	f	WorkflowTransition	\N	\N
598	6	7	11	4	f	f	WorkflowTransition	\N	\N
599	6	7	12	4	f	f	WorkflowTransition	\N	\N
600	6	7	13	4	f	f	WorkflowTransition	\N	\N
601	6	8	9	4	f	f	WorkflowTransition	\N	\N
602	6	8	10	4	f	f	WorkflowTransition	\N	\N
603	6	8	11	4	f	f	WorkflowTransition	\N	\N
604	6	8	12	4	f	f	WorkflowTransition	\N	\N
605	6	8	13	4	f	f	WorkflowTransition	\N	\N
606	6	9	10	4	f	f	WorkflowTransition	\N	\N
607	6	9	11	4	f	f	WorkflowTransition	\N	\N
608	6	9	12	4	f	f	WorkflowTransition	\N	\N
609	6	9	13	4	f	f	WorkflowTransition	\N	\N
610	6	10	11	4	f	f	WorkflowTransition	\N	\N
611	6	10	12	4	f	f	WorkflowTransition	\N	\N
612	6	10	13	4	f	f	WorkflowTransition	\N	\N
613	6	11	12	4	f	f	WorkflowTransition	\N	\N
614	6	11	13	4	f	f	WorkflowTransition	\N	\N
615	6	12	13	4	f	f	WorkflowTransition	\N	\N
616	6	11	6	4	f	f	WorkflowTransition	\N	\N
1186	5	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
1187	5	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
1188	5	12	0	5	f	f	WorkflowPermission	2	required
1189	5	12	0	5	f	f	WorkflowPermission	3	required
1190	5	12	0	5	f	f	WorkflowPermission	4	required
1191	5	12	0	5	f	f	WorkflowPermission	5	required
1192	5	12	0	5	f	f	WorkflowPermission	7	required
1193	5	12	0	5	f	f	WorkflowPermission	48	required
1194	5	12	0	5	f	f	WorkflowPermission	9	required
1195	5	12	0	5	f	f	WorkflowPermission	34	required
1196	5	12	0	5	f	f	WorkflowPermission	35	required
1197	5	12	0	5	f	f	WorkflowPermission	36	required
1198	5	12	0	5	f	f	WorkflowPermission	37	required
1199	5	12	0	5	f	f	WorkflowPermission	42	required
1200	5	12	0	5	f	f	WorkflowPermission	43	required
1201	5	12	0	5	f	f	WorkflowPermission	44	required
1202	5	12	0	5	f	f	WorkflowPermission	45	required
1203	5	12	0	5	f	f	WorkflowPermission	25	required
1204	5	12	0	5	f	f	WorkflowPermission	46	required
1205	5	12	0	5	f	f	WorkflowPermission	47	required
1206	5	13	0	5	f	f	WorkflowPermission	project_id	readonly
1207	5	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
1208	5	13	0	5	f	f	WorkflowPermission	subject	readonly
1209	5	13	0	5	f	f	WorkflowPermission	priority_id	readonly
1210	5	13	0	5	f	f	WorkflowPermission	is_private	readonly
1211	5	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1212	5	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1213	5	13	0	5	f	f	WorkflowPermission	description	readonly
1214	5	13	0	5	f	f	WorkflowPermission	2	readonly
1215	5	13	0	5	f	f	WorkflowPermission	3	readonly
1216	5	13	0	5	f	f	WorkflowPermission	4	readonly
1217	5	13	0	5	f	f	WorkflowPermission	5	readonly
1218	5	13	0	5	f	f	WorkflowPermission	7	readonly
1219	5	13	0	5	f	f	WorkflowPermission	48	readonly
1220	5	13	0	5	f	f	WorkflowPermission	9	readonly
1221	5	13	0	5	f	f	WorkflowPermission	34	readonly
1222	5	13	0	5	f	f	WorkflowPermission	35	readonly
1223	5	13	0	5	f	f	WorkflowPermission	36	readonly
1224	5	13	0	5	f	f	WorkflowPermission	37	readonly
1225	5	13	0	5	f	f	WorkflowPermission	38	readonly
1226	5	13	0	5	f	f	WorkflowPermission	39	readonly
1227	5	13	0	5	f	f	WorkflowPermission	40	readonly
1228	5	13	0	5	f	f	WorkflowPermission	41	readonly
1229	5	13	0	5	f	f	WorkflowPermission	42	readonly
1230	5	13	0	5	f	f	WorkflowPermission	43	readonly
1231	5	13	0	5	f	f	WorkflowPermission	44	readonly
1232	5	13	0	5	f	f	WorkflowPermission	45	readonly
1233	5	13	0	5	f	f	WorkflowPermission	25	readonly
1234	5	13	0	5	f	f	WorkflowPermission	46	readonly
1235	5	13	0	5	f	f	WorkflowPermission	47	readonly
1236	5	13	0	5	f	f	WorkflowPermission	26	readonly
1237	5	13	0	5	f	f	WorkflowPermission	27	readonly
1238	5	13	0	5	f	f	WorkflowPermission	28	readonly
1239	5	13	0	5	f	f	WorkflowPermission	29	readonly
1240	5	14	0	5	f	f	WorkflowPermission	project_id	readonly
1241	5	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
1242	5	14	0	5	f	f	WorkflowPermission	subject	readonly
1243	5	14	0	5	f	f	WorkflowPermission	priority_id	readonly
1244	5	14	0	5	f	f	WorkflowPermission	is_private	readonly
1245	5	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1246	5	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1247	5	14	0	5	f	f	WorkflowPermission	description	readonly
1248	5	14	0	5	f	f	WorkflowPermission	2	readonly
1249	5	14	0	5	f	f	WorkflowPermission	3	readonly
2795	8	7	11	4	f	f	WorkflowTransition	\N	\N
2796	8	7	12	4	f	f	WorkflowTransition	\N	\N
2797	8	7	13	4	f	f	WorkflowTransition	\N	\N
2798	8	8	9	4	f	f	WorkflowTransition	\N	\N
2799	8	8	10	4	f	f	WorkflowTransition	\N	\N
2800	8	8	11	4	f	f	WorkflowTransition	\N	\N
2801	8	8	12	4	f	f	WorkflowTransition	\N	\N
2802	8	8	13	4	f	f	WorkflowTransition	\N	\N
2803	8	9	10	4	f	f	WorkflowTransition	\N	\N
2804	8	9	11	4	f	f	WorkflowTransition	\N	\N
4732	11	12	15	4	f	f	WorkflowTransition	\N	\N
4733	11	13	6	4	f	f	WorkflowTransition	\N	\N
2012	6	14	0	5	f	f	WorkflowPermission	27	readonly
2013	6	14	0	5	f	f	WorkflowPermission	28	readonly
2014	6	14	0	5	f	f	WorkflowPermission	29	readonly
2015	6	15	0	5	f	f	WorkflowPermission	project_id	readonly
2016	6	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
2017	6	15	0	5	f	f	WorkflowPermission	subject	readonly
2018	6	15	0	5	f	f	WorkflowPermission	priority_id	readonly
2019	6	15	0	5	f	f	WorkflowPermission	is_private	readonly
2020	6	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
2021	6	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
2022	6	15	0	5	f	f	WorkflowPermission	description	readonly
2023	6	15	0	5	f	f	WorkflowPermission	2	readonly
2024	6	15	0	5	f	f	WorkflowPermission	3	readonly
2025	6	15	0	5	f	f	WorkflowPermission	4	readonly
2026	6	15	0	5	f	f	WorkflowPermission	5	readonly
2027	6	15	0	5	f	f	WorkflowPermission	7	readonly
2028	6	15	0	5	f	f	WorkflowPermission	48	readonly
2029	6	15	0	5	f	f	WorkflowPermission	9	readonly
2030	6	15	0	5	f	f	WorkflowPermission	23	readonly
2031	6	15	0	5	f	f	WorkflowPermission	49	readonly
1031	5	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
1032	5	15	0	4	f	f	WorkflowPermission	subject	readonly
1033	5	15	0	4	f	f	WorkflowPermission	priority_id	readonly
1034	5	15	0	4	f	f	WorkflowPermission	is_private	readonly
1035	5	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1036	5	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1037	5	15	0	4	f	f	WorkflowPermission	description	readonly
1038	5	15	0	4	f	f	WorkflowPermission	2	readonly
1039	5	15	0	4	f	f	WorkflowPermission	3	readonly
1040	5	15	0	4	f	f	WorkflowPermission	4	readonly
1041	5	15	0	4	f	f	WorkflowPermission	5	readonly
1042	5	15	0	4	f	f	WorkflowPermission	7	readonly
1043	5	15	0	4	f	f	WorkflowPermission	48	readonly
1044	5	15	0	4	f	f	WorkflowPermission	9	readonly
1045	5	15	0	4	f	f	WorkflowPermission	34	readonly
1046	5	15	0	4	f	f	WorkflowPermission	35	readonly
1047	5	15	0	4	f	f	WorkflowPermission	36	readonly
1048	5	15	0	4	f	f	WorkflowPermission	37	readonly
1049	5	15	0	4	f	f	WorkflowPermission	38	readonly
1050	5	15	0	4	f	f	WorkflowPermission	39	readonly
1051	5	15	0	4	f	f	WorkflowPermission	40	readonly
1052	5	15	0	4	f	f	WorkflowPermission	41	readonly
1053	5	15	0	4	f	f	WorkflowPermission	42	readonly
1054	5	15	0	4	f	f	WorkflowPermission	43	readonly
1055	5	15	0	4	f	f	WorkflowPermission	44	readonly
1056	5	15	0	4	f	f	WorkflowPermission	45	readonly
1057	5	15	0	4	f	f	WorkflowPermission	25	readonly
1058	5	15	0	4	f	f	WorkflowPermission	46	readonly
1059	5	15	0	4	f	f	WorkflowPermission	47	readonly
1060	5	15	0	4	f	f	WorkflowPermission	26	readonly
1061	5	15	0	4	f	f	WorkflowPermission	27	readonly
1062	5	15	0	4	f	f	WorkflowPermission	28	readonly
1063	5	15	0	4	f	f	WorkflowPermission	29	readonly
2032	6	15	0	5	f	f	WorkflowPermission	50	readonly
2033	6	15	0	5	f	f	WorkflowPermission	51	readonly
2034	6	15	0	5	f	f	WorkflowPermission	52	readonly
2035	6	15	0	5	f	f	WorkflowPermission	53	readonly
2036	6	15	0	5	f	f	WorkflowPermission	54	readonly
2037	6	15	0	5	f	f	WorkflowPermission	55	readonly
2038	6	15	0	5	f	f	WorkflowPermission	56	readonly
2039	6	15	0	5	f	f	WorkflowPermission	25	readonly
2040	6	15	0	5	f	f	WorkflowPermission	46	readonly
2041	6	15	0	5	f	f	WorkflowPermission	47	readonly
2042	6	15	0	5	f	f	WorkflowPermission	26	readonly
2043	6	15	0	5	f	f	WorkflowPermission	27	readonly
2044	6	15	0	5	f	f	WorkflowPermission	28	readonly
2045	6	15	0	5	f	f	WorkflowPermission	29	readonly
2052	7	12	0	4	f	f	WorkflowPermission	7	required
2053	7	12	0	4	f	f	WorkflowPermission	48	required
2054	7	12	0	4	f	f	WorkflowPermission	9	required
2055	7	12	4	4	f	f	WorkflowTransition	\N	\N
2056	7	13	4	4	f	f	WorkflowTransition	\N	\N
2058	7	15	4	4	f	f	WorkflowTransition	\N	\N
2060	7	4	6	4	f	f	WorkflowTransition	\N	\N
2062	7	4	15	4	f	f	WorkflowTransition	\N	\N
2066	7	6	7	4	f	f	WorkflowTransition	\N	\N
2067	7	6	8	4	f	f	WorkflowTransition	\N	\N
2068	7	6	9	4	f	f	WorkflowTransition	\N	\N
2069	7	6	10	4	f	f	WorkflowTransition	\N	\N
2070	7	6	11	4	f	f	WorkflowTransition	\N	\N
2071	7	6	12	4	f	f	WorkflowTransition	\N	\N
1932	6	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
1933	6	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
1934	6	12	0	5	f	f	WorkflowPermission	2	required
1935	6	12	0	5	f	f	WorkflowPermission	3	required
1936	6	12	0	5	f	f	WorkflowPermission	4	required
1937	6	12	0	5	f	f	WorkflowPermission	5	required
1938	6	12	0	5	f	f	WorkflowPermission	7	required
1939	6	12	0	5	f	f	WorkflowPermission	48	required
1940	6	12	0	5	f	f	WorkflowPermission	9	required
1941	6	12	0	5	f	f	WorkflowPermission	23	required
1942	6	12	0	5	f	f	WorkflowPermission	49	required
1943	6	12	0	5	f	f	WorkflowPermission	50	required
1944	6	12	0	5	f	f	WorkflowPermission	51	required
1945	6	12	0	5	f	f	WorkflowPermission	52	required
1946	6	12	0	5	f	f	WorkflowPermission	53	required
1947	6	12	0	5	f	f	WorkflowPermission	54	required
1948	6	12	0	5	f	f	WorkflowPermission	55	required
1949	6	12	0	5	f	f	WorkflowPermission	56	required
1950	6	12	0	5	f	f	WorkflowPermission	25	required
1951	6	12	0	5	f	f	WorkflowPermission	46	required
1952	6	12	0	5	f	f	WorkflowPermission	47	required
1953	6	13	0	5	f	f	WorkflowPermission	project_id	readonly
1954	6	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
1955	6	13	0	5	f	f	WorkflowPermission	subject	readonly
1956	6	13	0	5	f	f	WorkflowPermission	priority_id	readonly
1957	6	13	0	5	f	f	WorkflowPermission	is_private	readonly
1958	6	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1959	6	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1960	6	13	0	5	f	f	WorkflowPermission	description	readonly
1961	6	13	0	5	f	f	WorkflowPermission	2	readonly
1962	6	13	0	5	f	f	WorkflowPermission	3	readonly
1963	6	13	0	5	f	f	WorkflowPermission	4	readonly
1964	6	13	0	5	f	f	WorkflowPermission	5	readonly
1965	6	13	0	5	f	f	WorkflowPermission	7	readonly
1966	6	13	0	5	f	f	WorkflowPermission	48	readonly
1967	6	13	0	5	f	f	WorkflowPermission	9	readonly
1968	6	13	0	5	f	f	WorkflowPermission	23	readonly
1969	6	13	0	5	f	f	WorkflowPermission	49	readonly
1970	6	13	0	5	f	f	WorkflowPermission	50	readonly
1971	6	13	0	5	f	f	WorkflowPermission	51	readonly
1972	6	13	0	5	f	f	WorkflowPermission	52	readonly
1973	6	13	0	5	f	f	WorkflowPermission	53	readonly
1974	6	13	0	5	f	f	WorkflowPermission	54	readonly
1975	6	13	0	5	f	f	WorkflowPermission	55	readonly
1976	6	13	0	5	f	f	WorkflowPermission	56	readonly
1977	6	13	0	5	f	f	WorkflowPermission	25	readonly
1978	6	13	0	5	f	f	WorkflowPermission	46	readonly
1250	5	14	0	5	f	f	WorkflowPermission	4	readonly
1251	5	14	0	5	f	f	WorkflowPermission	5	readonly
1252	5	14	0	5	f	f	WorkflowPermission	7	readonly
1253	5	14	0	5	f	f	WorkflowPermission	48	readonly
1254	5	14	0	5	f	f	WorkflowPermission	9	readonly
1255	5	14	0	5	f	f	WorkflowPermission	34	readonly
1256	5	14	0	5	f	f	WorkflowPermission	35	readonly
1257	5	14	0	5	f	f	WorkflowPermission	36	readonly
1258	5	14	0	5	f	f	WorkflowPermission	37	readonly
1259	5	14	0	5	f	f	WorkflowPermission	38	readonly
1260	5	14	0	5	f	f	WorkflowPermission	39	readonly
1261	5	14	0	5	f	f	WorkflowPermission	40	readonly
1262	5	14	0	5	f	f	WorkflowPermission	41	readonly
1263	5	14	0	5	f	f	WorkflowPermission	42	readonly
1264	5	14	0	5	f	f	WorkflowPermission	43	readonly
1265	5	14	0	5	f	f	WorkflowPermission	44	readonly
1266	5	14	0	5	f	f	WorkflowPermission	45	readonly
1267	5	14	0	5	f	f	WorkflowPermission	25	readonly
1268	5	14	0	5	f	f	WorkflowPermission	46	readonly
1269	5	14	0	5	f	f	WorkflowPermission	47	readonly
1270	5	14	0	5	f	f	WorkflowPermission	26	readonly
1271	5	14	0	5	f	f	WorkflowPermission	27	readonly
1272	5	14	0	5	f	f	WorkflowPermission	28	readonly
1273	5	14	0	5	f	f	WorkflowPermission	29	readonly
1274	5	15	0	5	f	f	WorkflowPermission	project_id	readonly
1275	5	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
1276	5	15	0	5	f	f	WorkflowPermission	subject	readonly
1277	5	15	0	5	f	f	WorkflowPermission	priority_id	readonly
1278	5	15	0	5	f	f	WorkflowPermission	is_private	readonly
1279	5	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1280	5	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1281	5	15	0	5	f	f	WorkflowPermission	description	readonly
1282	5	15	0	5	f	f	WorkflowPermission	2	readonly
1283	5	15	0	5	f	f	WorkflowPermission	3	readonly
1284	5	15	0	5	f	f	WorkflowPermission	4	readonly
1285	5	15	0	5	f	f	WorkflowPermission	5	readonly
1286	5	15	0	5	f	f	WorkflowPermission	7	readonly
1287	5	15	0	5	f	f	WorkflowPermission	48	readonly
1288	5	15	0	5	f	f	WorkflowPermission	9	readonly
1289	5	15	0	5	f	f	WorkflowPermission	34	readonly
1290	5	15	0	5	f	f	WorkflowPermission	35	readonly
1291	5	15	0	5	f	f	WorkflowPermission	36	readonly
1292	5	15	0	5	f	f	WorkflowPermission	37	readonly
1293	5	15	0	5	f	f	WorkflowPermission	38	readonly
1294	5	15	0	5	f	f	WorkflowPermission	39	readonly
1295	5	15	0	5	f	f	WorkflowPermission	40	readonly
1296	5	15	0	5	f	f	WorkflowPermission	41	readonly
1297	5	15	0	5	f	f	WorkflowPermission	42	readonly
1298	5	15	0	5	f	f	WorkflowPermission	43	readonly
1299	5	15	0	5	f	f	WorkflowPermission	44	readonly
1300	5	15	0	5	f	f	WorkflowPermission	45	readonly
1301	5	15	0	5	f	f	WorkflowPermission	25	readonly
1302	5	15	0	5	f	f	WorkflowPermission	46	readonly
1303	5	15	0	5	f	f	WorkflowPermission	47	readonly
1304	5	15	0	5	f	f	WorkflowPermission	26	readonly
1305	5	15	0	5	f	f	WorkflowPermission	27	readonly
1306	5	15	0	5	f	f	WorkflowPermission	28	readonly
1307	5	15	0	5	f	f	WorkflowPermission	29	readonly
1308	4	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
1309	4	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
1310	4	12	0	5	f	f	WorkflowPermission	2	required
1311	4	12	0	5	f	f	WorkflowPermission	3	required
1312	4	12	0	5	f	f	WorkflowPermission	4	required
1313	4	12	0	5	f	f	WorkflowPermission	5	required
1314	4	12	0	5	f	f	WorkflowPermission	6	required
1315	4	12	0	5	f	f	WorkflowPermission	7	required
1316	4	12	0	5	f	f	WorkflowPermission	8	required
1317	4	12	0	5	f	f	WorkflowPermission	9	required
1318	4	12	0	5	f	f	WorkflowPermission	10	required
1319	4	12	0	5	f	f	WorkflowPermission	13	required
1320	4	12	0	5	f	f	WorkflowPermission	11	required
1321	4	12	0	5	f	f	WorkflowPermission	12	required
1322	4	12	0	5	f	f	WorkflowPermission	14	required
1323	4	12	0	5	f	f	WorkflowPermission	15	required
1324	4	12	0	5	f	f	WorkflowPermission	16	required
1325	4	12	0	5	f	f	WorkflowPermission	17	required
1326	4	12	0	5	f	f	WorkflowPermission	18	required
1327	4	12	0	5	f	f	WorkflowPermission	19	required
1328	4	12	0	5	f	f	WorkflowPermission	20	required
1329	4	12	0	5	f	f	WorkflowPermission	21	required
1330	4	12	0	5	f	f	WorkflowPermission	22	required
1331	4	12	0	5	f	f	WorkflowPermission	23	required
1332	4	12	0	5	f	f	WorkflowPermission	24	required
1333	4	12	0	5	f	f	WorkflowPermission	25	required
1334	4	13	0	5	f	f	WorkflowPermission	project_id	readonly
1335	4	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
1336	4	13	0	5	f	f	WorkflowPermission	subject	readonly
1337	4	13	0	5	f	f	WorkflowPermission	priority_id	readonly
1338	4	13	0	5	f	f	WorkflowPermission	is_private	readonly
1339	4	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1340	4	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1341	4	13	0	5	f	f	WorkflowPermission	description	readonly
1342	4	13	0	5	f	f	WorkflowPermission	2	readonly
1343	4	13	0	5	f	f	WorkflowPermission	3	readonly
1344	4	13	0	5	f	f	WorkflowPermission	4	readonly
1345	4	13	0	5	f	f	WorkflowPermission	5	readonly
1346	4	13	0	5	f	f	WorkflowPermission	6	readonly
1347	4	13	0	5	f	f	WorkflowPermission	7	readonly
1348	4	13	0	5	f	f	WorkflowPermission	8	readonly
1349	4	13	0	5	f	f	WorkflowPermission	9	readonly
1350	4	13	0	5	f	f	WorkflowPermission	10	readonly
1351	4	13	0	5	f	f	WorkflowPermission	13	readonly
1352	4	13	0	5	f	f	WorkflowPermission	11	readonly
1353	4	13	0	5	f	f	WorkflowPermission	12	readonly
1354	4	13	0	5	f	f	WorkflowPermission	14	readonly
1355	4	13	0	5	f	f	WorkflowPermission	15	readonly
1356	4	13	0	5	f	f	WorkflowPermission	16	readonly
1357	4	13	0	5	f	f	WorkflowPermission	17	readonly
1358	4	13	0	5	f	f	WorkflowPermission	18	readonly
1359	4	13	0	5	f	f	WorkflowPermission	19	readonly
1360	4	13	0	5	f	f	WorkflowPermission	20	readonly
1361	4	13	0	5	f	f	WorkflowPermission	21	readonly
1362	4	13	0	5	f	f	WorkflowPermission	22	readonly
1363	4	13	0	5	f	f	WorkflowPermission	23	readonly
1364	4	13	0	5	f	f	WorkflowPermission	24	readonly
1365	4	13	0	5	f	f	WorkflowPermission	25	readonly
1366	4	13	0	5	f	f	WorkflowPermission	26	readonly
1367	4	13	0	5	f	f	WorkflowPermission	27	readonly
1368	4	13	0	5	f	f	WorkflowPermission	28	readonly
1369	4	13	0	5	f	f	WorkflowPermission	29	readonly
1370	4	14	0	5	f	f	WorkflowPermission	project_id	readonly
1371	4	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
1372	4	14	0	5	f	f	WorkflowPermission	subject	readonly
1373	4	14	0	5	f	f	WorkflowPermission	priority_id	readonly
1374	4	14	0	5	f	f	WorkflowPermission	is_private	readonly
1375	4	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1376	4	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1377	4	14	0	5	f	f	WorkflowPermission	description	readonly
1378	4	14	0	5	f	f	WorkflowPermission	2	readonly
1379	4	14	0	5	f	f	WorkflowPermission	3	readonly
1380	4	14	0	5	f	f	WorkflowPermission	4	readonly
1381	4	14	0	5	f	f	WorkflowPermission	5	readonly
1382	4	14	0	5	f	f	WorkflowPermission	6	readonly
1383	4	14	0	5	f	f	WorkflowPermission	7	readonly
1384	4	14	0	5	f	f	WorkflowPermission	8	readonly
1385	4	14	0	5	f	f	WorkflowPermission	9	readonly
1386	4	14	0	5	f	f	WorkflowPermission	10	readonly
1387	4	14	0	5	f	f	WorkflowPermission	13	readonly
1388	4	14	0	5	f	f	WorkflowPermission	11	readonly
1389	4	14	0	5	f	f	WorkflowPermission	12	readonly
1390	4	14	0	5	f	f	WorkflowPermission	14	readonly
1391	4	14	0	5	f	f	WorkflowPermission	15	readonly
1392	4	14	0	5	f	f	WorkflowPermission	16	readonly
1393	4	14	0	5	f	f	WorkflowPermission	17	readonly
1394	4	14	0	5	f	f	WorkflowPermission	18	readonly
1395	4	14	0	5	f	f	WorkflowPermission	19	readonly
1396	4	14	0	5	f	f	WorkflowPermission	20	readonly
1397	4	14	0	5	f	f	WorkflowPermission	21	readonly
1398	4	14	0	5	f	f	WorkflowPermission	22	readonly
1399	4	14	0	5	f	f	WorkflowPermission	23	readonly
1400	4	14	0	5	f	f	WorkflowPermission	24	readonly
1401	4	14	0	5	f	f	WorkflowPermission	25	readonly
1402	4	14	0	5	f	f	WorkflowPermission	26	readonly
1403	4	14	0	5	f	f	WorkflowPermission	27	readonly
1404	4	14	0	5	f	f	WorkflowPermission	28	readonly
1405	4	14	0	5	f	f	WorkflowPermission	29	readonly
1406	4	15	0	5	f	f	WorkflowPermission	project_id	readonly
1407	4	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
1408	4	15	0	5	f	f	WorkflowPermission	subject	readonly
1409	4	15	0	5	f	f	WorkflowPermission	priority_id	readonly
1410	4	15	0	5	f	f	WorkflowPermission	is_private	readonly
1411	4	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1412	4	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1413	4	15	0	5	f	f	WorkflowPermission	description	readonly
1414	4	15	0	5	f	f	WorkflowPermission	2	readonly
1415	4	15	0	5	f	f	WorkflowPermission	3	readonly
1416	4	15	0	5	f	f	WorkflowPermission	4	readonly
1417	4	15	0	5	f	f	WorkflowPermission	5	readonly
1418	4	15	0	5	f	f	WorkflowPermission	6	readonly
1419	4	15	0	5	f	f	WorkflowPermission	7	readonly
1420	4	15	0	5	f	f	WorkflowPermission	8	readonly
1421	4	15	0	5	f	f	WorkflowPermission	9	readonly
1422	4	15	0	5	f	f	WorkflowPermission	10	readonly
1423	4	15	0	5	f	f	WorkflowPermission	13	readonly
1424	4	15	0	5	f	f	WorkflowPermission	11	readonly
1425	4	15	0	5	f	f	WorkflowPermission	12	readonly
1426	4	15	0	5	f	f	WorkflowPermission	14	readonly
1427	4	15	0	5	f	f	WorkflowPermission	15	readonly
1428	4	15	0	5	f	f	WorkflowPermission	16	readonly
1429	4	15	0	5	f	f	WorkflowPermission	17	readonly
1430	4	15	0	5	f	f	WorkflowPermission	18	readonly
1431	4	15	0	5	f	f	WorkflowPermission	19	readonly
1432	4	15	0	5	f	f	WorkflowPermission	20	readonly
1433	4	15	0	5	f	f	WorkflowPermission	21	readonly
1434	4	15	0	5	f	f	WorkflowPermission	22	readonly
1435	4	15	0	5	f	f	WorkflowPermission	23	readonly
1436	4	15	0	5	f	f	WorkflowPermission	24	readonly
1437	4	15	0	5	f	f	WorkflowPermission	25	readonly
1438	4	15	0	5	f	f	WorkflowPermission	26	readonly
1439	4	15	0	5	f	f	WorkflowPermission	27	readonly
1440	4	15	0	5	f	f	WorkflowPermission	28	readonly
1441	4	15	0	5	f	f	WorkflowPermission	29	readonly
1979	6	13	0	5	f	f	WorkflowPermission	47	readonly
1980	6	13	0	5	f	f	WorkflowPermission	26	readonly
1981	6	13	0	5	f	f	WorkflowPermission	27	readonly
1982	6	13	0	5	f	f	WorkflowPermission	28	readonly
1983	6	13	0	5	f	f	WorkflowPermission	29	readonly
1984	6	14	0	5	f	f	WorkflowPermission	project_id	readonly
1985	6	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
1986	6	14	0	5	f	f	WorkflowPermission	subject	readonly
1987	6	14	0	5	f	f	WorkflowPermission	priority_id	readonly
1988	6	14	0	5	f	f	WorkflowPermission	is_private	readonly
1989	6	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
1990	6	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
1991	6	14	0	5	f	f	WorkflowPermission	description	readonly
1992	6	14	0	5	f	f	WorkflowPermission	2	readonly
1993	6	14	0	5	f	f	WorkflowPermission	3	readonly
1994	6	14	0	5	f	f	WorkflowPermission	4	readonly
1995	6	14	0	5	f	f	WorkflowPermission	5	readonly
1706	6	12	0	4	f	f	WorkflowPermission	23	required
1707	6	12	0	4	f	f	WorkflowPermission	49	required
1708	6	12	0	4	f	f	WorkflowPermission	50	required
1709	6	12	0	4	f	f	WorkflowPermission	51	required
1710	6	12	0	4	f	f	WorkflowPermission	52	required
1711	6	12	0	4	f	f	WorkflowPermission	53	required
1712	6	12	0	4	f	f	WorkflowPermission	54	required
1713	6	12	0	4	f	f	WorkflowPermission	55	required
1714	6	12	0	4	f	f	WorkflowPermission	56	required
1715	6	12	0	4	f	f	WorkflowPermission	25	required
1716	6	12	0	4	f	f	WorkflowPermission	46	required
1717	6	12	0	4	f	f	WorkflowPermission	47	required
1718	6	13	0	4	f	f	WorkflowPermission	project_id	readonly
1719	6	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
1720	6	13	0	4	f	f	WorkflowPermission	subject	readonly
1721	6	13	0	4	f	f	WorkflowPermission	priority_id	readonly
1722	6	13	0	4	f	f	WorkflowPermission	is_private	readonly
1723	6	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1724	6	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1725	6	13	0	4	f	f	WorkflowPermission	description	readonly
1726	6	13	0	4	f	f	WorkflowPermission	2	readonly
1727	6	13	0	4	f	f	WorkflowPermission	3	readonly
1728	6	13	0	4	f	f	WorkflowPermission	4	readonly
1729	6	13	0	4	f	f	WorkflowPermission	5	readonly
1730	6	13	0	4	f	f	WorkflowPermission	7	readonly
1731	6	13	0	4	f	f	WorkflowPermission	48	readonly
1732	6	13	0	4	f	f	WorkflowPermission	9	readonly
1733	6	13	0	4	f	f	WorkflowPermission	23	readonly
1734	6	13	0	4	f	f	WorkflowPermission	49	readonly
1735	6	13	0	4	f	f	WorkflowPermission	50	readonly
1736	6	13	0	4	f	f	WorkflowPermission	51	readonly
1737	6	13	0	4	f	f	WorkflowPermission	52	readonly
1738	6	13	0	4	f	f	WorkflowPermission	53	readonly
1739	6	13	0	4	f	f	WorkflowPermission	54	readonly
1740	6	13	0	4	f	f	WorkflowPermission	55	readonly
1741	6	13	0	4	f	f	WorkflowPermission	56	readonly
1742	6	13	0	4	f	f	WorkflowPermission	25	readonly
1743	6	13	0	4	f	f	WorkflowPermission	46	readonly
1744	6	13	0	4	f	f	WorkflowPermission	47	readonly
1745	6	13	0	4	f	f	WorkflowPermission	26	readonly
1746	6	13	0	4	f	f	WorkflowPermission	27	readonly
1747	6	13	0	4	f	f	WorkflowPermission	28	readonly
1748	6	13	0	4	f	f	WorkflowPermission	29	readonly
1749	6	14	0	4	f	f	WorkflowPermission	project_id	readonly
1750	6	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
1751	6	14	0	4	f	f	WorkflowPermission	subject	readonly
1752	6	14	0	4	f	f	WorkflowPermission	priority_id	readonly
1753	6	14	0	4	f	f	WorkflowPermission	is_private	readonly
1754	6	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1755	6	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1756	6	14	0	4	f	f	WorkflowPermission	description	readonly
1757	6	14	0	4	f	f	WorkflowPermission	2	readonly
1758	6	14	0	4	f	f	WorkflowPermission	3	readonly
1759	6	14	0	4	f	f	WorkflowPermission	4	readonly
1760	6	14	0	4	f	f	WorkflowPermission	5	readonly
1761	6	14	0	4	f	f	WorkflowPermission	7	readonly
1762	6	14	0	4	f	f	WorkflowPermission	48	readonly
1763	6	14	0	4	f	f	WorkflowPermission	9	readonly
1764	6	14	0	4	f	f	WorkflowPermission	23	readonly
1765	6	14	0	4	f	f	WorkflowPermission	49	readonly
1766	6	14	0	4	f	f	WorkflowPermission	50	readonly
1767	6	14	0	4	f	f	WorkflowPermission	51	readonly
1768	6	14	0	4	f	f	WorkflowPermission	52	readonly
1769	6	14	0	4	f	f	WorkflowPermission	53	readonly
1770	6	14	0	4	f	f	WorkflowPermission	54	readonly
1771	6	14	0	4	f	f	WorkflowPermission	55	readonly
1772	6	14	0	4	f	f	WorkflowPermission	56	readonly
1773	6	14	0	4	f	f	WorkflowPermission	25	readonly
1774	6	14	0	4	f	f	WorkflowPermission	46	readonly
1775	6	14	0	4	f	f	WorkflowPermission	47	readonly
1776	6	14	0	4	f	f	WorkflowPermission	26	readonly
1777	6	14	0	4	f	f	WorkflowPermission	27	readonly
1778	6	14	0	4	f	f	WorkflowPermission	28	readonly
1779	6	14	0	4	f	f	WorkflowPermission	29	readonly
1780	6	15	0	4	f	f	WorkflowPermission	project_id	readonly
1781	6	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
1782	6	15	0	4	f	f	WorkflowPermission	subject	readonly
1783	6	15	0	4	f	f	WorkflowPermission	priority_id	readonly
1784	6	15	0	4	f	f	WorkflowPermission	is_private	readonly
1785	6	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
1786	6	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
1787	6	15	0	4	f	f	WorkflowPermission	description	readonly
1788	6	15	0	4	f	f	WorkflowPermission	2	readonly
1789	6	15	0	4	f	f	WorkflowPermission	3	readonly
1790	6	15	0	4	f	f	WorkflowPermission	4	readonly
1791	6	15	0	4	f	f	WorkflowPermission	5	readonly
1792	6	15	0	4	f	f	WorkflowPermission	7	readonly
1793	6	15	0	4	f	f	WorkflowPermission	48	readonly
1794	6	15	0	4	f	f	WorkflowPermission	9	readonly
1795	6	15	0	4	f	f	WorkflowPermission	23	readonly
1796	6	15	0	4	f	f	WorkflowPermission	49	readonly
1797	6	15	0	4	f	f	WorkflowPermission	50	readonly
1798	6	15	0	4	f	f	WorkflowPermission	51	readonly
1799	6	15	0	4	f	f	WorkflowPermission	52	readonly
1800	6	15	0	4	f	f	WorkflowPermission	53	readonly
1801	6	15	0	4	f	f	WorkflowPermission	54	readonly
1802	6	15	0	4	f	f	WorkflowPermission	55	readonly
1803	6	15	0	4	f	f	WorkflowPermission	56	readonly
1804	6	15	0	4	f	f	WorkflowPermission	25	readonly
1805	6	15	0	4	f	f	WorkflowPermission	46	readonly
1806	6	15	0	4	f	f	WorkflowPermission	47	readonly
1807	6	15	0	4	f	f	WorkflowPermission	26	readonly
1808	6	15	0	4	f	f	WorkflowPermission	27	readonly
1809	6	15	0	4	f	f	WorkflowPermission	28	readonly
1810	6	15	0	4	f	f	WorkflowPermission	29	readonly
1996	6	14	0	5	f	f	WorkflowPermission	7	readonly
1997	6	14	0	5	f	f	WorkflowPermission	48	readonly
1998	6	14	0	5	f	f	WorkflowPermission	9	readonly
1999	6	14	0	5	f	f	WorkflowPermission	23	readonly
2000	6	14	0	5	f	f	WorkflowPermission	49	readonly
2001	6	14	0	5	f	f	WorkflowPermission	50	readonly
2002	6	14	0	5	f	f	WorkflowPermission	51	readonly
2003	6	14	0	5	f	f	WorkflowPermission	52	readonly
2004	6	14	0	5	f	f	WorkflowPermission	53	readonly
2005	6	14	0	5	f	f	WorkflowPermission	54	readonly
2006	6	14	0	5	f	f	WorkflowPermission	55	readonly
2007	6	14	0	5	f	f	WorkflowPermission	56	readonly
2008	6	14	0	5	f	f	WorkflowPermission	25	readonly
2009	6	14	0	5	f	f	WorkflowPermission	46	readonly
2010	6	14	0	5	f	f	WorkflowPermission	47	readonly
2011	6	14	0	5	f	f	WorkflowPermission	26	readonly
2072	7	6	13	4	f	f	WorkflowTransition	\N	\N
4734	11	13	15	4	f	f	WorkflowTransition	\N	\N
2074	7	6	15	4	f	f	WorkflowTransition	\N	\N
4735	11	15	6	4	f	f	WorkflowTransition	\N	\N
2076	7	7	15	4	f	f	WorkflowTransition	\N	\N
4736	11	7	8	4	f	f	WorkflowTransition	\N	\N
2078	7	8	15	4	f	f	WorkflowTransition	\N	\N
4737	11	7	9	4	f	f	WorkflowTransition	\N	\N
2080	7	9	15	4	f	f	WorkflowTransition	\N	\N
4738	11	7	10	4	f	f	WorkflowTransition	\N	\N
2082	7	10	15	4	f	f	WorkflowTransition	\N	\N
4739	11	7	11	4	f	f	WorkflowTransition	\N	\N
2084	7	11	15	4	f	f	WorkflowTransition	\N	\N
4740	11	7	12	4	f	f	WorkflowTransition	\N	\N
2086	7	12	15	4	f	f	WorkflowTransition	\N	\N
2087	7	13	6	4	f	f	WorkflowTransition	\N	\N
4741	11	7	13	4	f	f	WorkflowTransition	\N	\N
2089	7	13	15	4	f	f	WorkflowTransition	\N	\N
4742	11	8	9	4	f	f	WorkflowTransition	\N	\N
4743	11	8	10	4	f	f	WorkflowTransition	\N	\N
2092	7	15	6	4	f	f	WorkflowTransition	\N	\N
4744	11	8	11	4	f	f	WorkflowTransition	\N	\N
2094	7	7	8	4	f	f	WorkflowTransition	\N	\N
2095	7	7	9	4	f	f	WorkflowTransition	\N	\N
2096	7	7	10	4	f	f	WorkflowTransition	\N	\N
2097	7	7	11	4	f	f	WorkflowTransition	\N	\N
2098	7	7	12	4	f	f	WorkflowTransition	\N	\N
2099	7	7	13	4	f	f	WorkflowTransition	\N	\N
2100	7	8	9	4	f	f	WorkflowTransition	\N	\N
2101	7	8	10	4	f	f	WorkflowTransition	\N	\N
2102	7	8	11	4	f	f	WorkflowTransition	\N	\N
2103	7	8	12	4	f	f	WorkflowTransition	\N	\N
2104	7	8	13	4	f	f	WorkflowTransition	\N	\N
2105	7	9	10	4	f	f	WorkflowTransition	\N	\N
2106	7	9	11	4	f	f	WorkflowTransition	\N	\N
2107	7	9	12	4	f	f	WorkflowTransition	\N	\N
2108	7	9	13	4	f	f	WorkflowTransition	\N	\N
2109	7	10	11	4	f	f	WorkflowTransition	\N	\N
2110	7	10	12	4	f	f	WorkflowTransition	\N	\N
2111	7	10	13	4	f	f	WorkflowTransition	\N	\N
2112	7	11	12	4	f	f	WorkflowTransition	\N	\N
2113	7	11	13	4	f	f	WorkflowTransition	\N	\N
2114	7	12	13	4	f	f	WorkflowTransition	\N	\N
2115	7	11	6	4	f	f	WorkflowTransition	\N	\N
2805	8	9	12	4	f	f	WorkflowTransition	\N	\N
2117	7	12	0	4	f	f	WorkflowPermission	49	required
2118	7	12	0	4	f	f	WorkflowPermission	50	required
2119	7	12	0	4	f	f	WorkflowPermission	51	required
2120	7	12	0	4	f	f	WorkflowPermission	52	required
2121	7	12	0	4	f	f	WorkflowPermission	53	required
2122	7	12	0	4	f	f	WorkflowPermission	54	required
2123	7	12	0	4	f	f	WorkflowPermission	55	required
2124	7	12	0	4	f	f	WorkflowPermission	56	required
2806	8	9	13	4	f	f	WorkflowTransition	\N	\N
2126	7	12	0	4	f	f	WorkflowPermission	46	required
2127	7	12	0	4	f	f	WorkflowPermission	47	required
2807	8	10	11	4	f	f	WorkflowTransition	\N	\N
2808	8	10	12	4	f	f	WorkflowTransition	\N	\N
2809	8	10	13	4	f	f	WorkflowTransition	\N	\N
2810	8	11	12	4	f	f	WorkflowTransition	\N	\N
2811	8	11	13	4	f	f	WorkflowTransition	\N	\N
2812	8	12	13	4	f	f	WorkflowTransition	\N	\N
2813	8	11	6	4	f	f	WorkflowTransition	\N	\N
2814	8	12	0	4	f	f	WorkflowPermission	48	required
2815	8	12	0	4	f	f	WorkflowPermission	9	required
2816	8	12	0	4	f	f	WorkflowPermission	34	required
2817	8	12	0	4	f	f	WorkflowPermission	35	required
2818	8	12	0	4	f	f	WorkflowPermission	36	required
2140	7	13	0	4	f	f	WorkflowPermission	7	readonly
2141	7	13	0	4	f	f	WorkflowPermission	48	readonly
2142	7	13	0	4	f	f	WorkflowPermission	9	readonly
2819	8	12	0	4	f	f	WorkflowPermission	37	readonly
2144	7	13	0	4	f	f	WorkflowPermission	49	readonly
2145	7	13	0	4	f	f	WorkflowPermission	50	readonly
2146	7	13	0	4	f	f	WorkflowPermission	51	readonly
2147	7	13	0	4	f	f	WorkflowPermission	52	readonly
2148	7	13	0	4	f	f	WorkflowPermission	53	readonly
2149	7	13	0	4	f	f	WorkflowPermission	54	readonly
2150	7	13	0	4	f	f	WorkflowPermission	55	readonly
2151	7	13	0	4	f	f	WorkflowPermission	56	readonly
2820	8	12	0	4	f	f	WorkflowPermission	42	required
2153	7	13	0	4	f	f	WorkflowPermission	46	readonly
2154	7	13	0	4	f	f	WorkflowPermission	47	readonly
2821	8	12	0	4	f	f	WorkflowPermission	43	required
2822	8	12	0	4	f	f	WorkflowPermission	44	required
2823	8	12	0	4	f	f	WorkflowPermission	45	required
2824	8	12	0	4	f	f	WorkflowPermission	25	required
2825	8	12	0	4	f	f	WorkflowPermission	46	required
2826	8	12	0	4	f	f	WorkflowPermission	47	required
4745	11	8	12	4	f	f	WorkflowTransition	\N	\N
4746	11	8	13	4	f	f	WorkflowTransition	\N	\N
4747	11	9	10	4	f	f	WorkflowTransition	\N	\N
4748	11	9	11	4	f	f	WorkflowTransition	\N	\N
4749	11	9	12	4	f	f	WorkflowTransition	\N	\N
4750	11	9	13	4	f	f	WorkflowTransition	\N	\N
4751	11	10	11	4	f	f	WorkflowTransition	\N	\N
4752	11	10	12	4	f	f	WorkflowTransition	\N	\N
4753	11	10	13	4	f	f	WorkflowTransition	\N	\N
4754	11	11	12	4	f	f	WorkflowTransition	\N	\N
4755	11	11	13	4	f	f	WorkflowTransition	\N	\N
4756	11	12	13	4	f	f	WorkflowTransition	\N	\N
2171	7	14	0	4	f	f	WorkflowPermission	7	readonly
2172	7	14	0	4	f	f	WorkflowPermission	48	readonly
2173	7	14	0	4	f	f	WorkflowPermission	9	readonly
4757	11	11	6	4	f	f	WorkflowTransition	\N	\N
2175	7	14	0	4	f	f	WorkflowPermission	49	readonly
2176	7	14	0	4	f	f	WorkflowPermission	50	readonly
2177	7	14	0	4	f	f	WorkflowPermission	51	readonly
2178	7	14	0	4	f	f	WorkflowPermission	52	readonly
2179	7	14	0	4	f	f	WorkflowPermission	53	readonly
2180	7	14	0	4	f	f	WorkflowPermission	54	readonly
2181	7	14	0	4	f	f	WorkflowPermission	55	readonly
2182	7	14	0	4	f	f	WorkflowPermission	56	readonly
2839	8	13	0	4	f	f	WorkflowPermission	7	readonly
2184	7	14	0	4	f	f	WorkflowPermission	46	readonly
2185	7	14	0	4	f	f	WorkflowPermission	47	readonly
2840	8	13	0	4	f	f	WorkflowPermission	48	readonly
2841	8	13	0	4	f	f	WorkflowPermission	9	readonly
2842	8	13	0	4	f	f	WorkflowPermission	34	readonly
2843	8	13	0	4	f	f	WorkflowPermission	35	readonly
2844	8	13	0	4	f	f	WorkflowPermission	36	readonly
2845	8	13	0	4	f	f	WorkflowPermission	37	readonly
4758	11	12	0	4	f	f	WorkflowPermission	48	required
2850	8	13	0	4	f	f	WorkflowPermission	42	readonly
2851	8	13	0	4	f	f	WorkflowPermission	43	readonly
2852	8	13	0	4	f	f	WorkflowPermission	44	readonly
2853	8	13	0	4	f	f	WorkflowPermission	45	readonly
2854	8	13	0	4	f	f	WorkflowPermission	25	readonly
2855	8	13	0	4	f	f	WorkflowPermission	46	readonly
2202	7	15	0	4	f	f	WorkflowPermission	7	readonly
2203	7	15	0	4	f	f	WorkflowPermission	48	readonly
2204	7	15	0	4	f	f	WorkflowPermission	9	readonly
2856	8	13	0	4	f	f	WorkflowPermission	47	readonly
2206	7	15	0	4	f	f	WorkflowPermission	49	readonly
2207	7	15	0	4	f	f	WorkflowPermission	50	readonly
2208	7	15	0	4	f	f	WorkflowPermission	51	readonly
2209	7	15	0	4	f	f	WorkflowPermission	52	readonly
2210	7	15	0	4	f	f	WorkflowPermission	53	readonly
2211	7	15	0	4	f	f	WorkflowPermission	54	readonly
2212	7	15	0	4	f	f	WorkflowPermission	55	readonly
2213	7	15	0	4	f	f	WorkflowPermission	56	readonly
4762	11	13	0	4	f	f	WorkflowPermission	48	readonly
2215	7	15	0	4	f	f	WorkflowPermission	46	readonly
2216	7	15	0	4	f	f	WorkflowPermission	47	readonly
2861	8	14	0	4	f	f	WorkflowPermission	project_id	readonly
2862	8	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
2863	8	14	0	4	f	f	WorkflowPermission	subject	readonly
2864	8	14	0	4	f	f	WorkflowPermission	priority_id	readonly
2865	8	14	0	4	f	f	WorkflowPermission	is_private	readonly
2866	8	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
2867	8	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
2868	8	14	0	4	f	f	WorkflowPermission	description	readonly
2869	8	14	0	4	f	f	WorkflowPermission	2	readonly
2870	8	14	0	4	f	f	WorkflowPermission	3	readonly
2871	8	14	0	4	f	f	WorkflowPermission	4	readonly
2872	8	14	0	4	f	f	WorkflowPermission	5	readonly
2873	8	14	0	4	f	f	WorkflowPermission	7	readonly
2874	8	14	0	4	f	f	WorkflowPermission	48	readonly
2875	8	14	0	4	f	f	WorkflowPermission	9	readonly
2876	8	14	0	4	f	f	WorkflowPermission	34	readonly
2236	7	15	0	5	f	f	WorkflowPermission	7	readonly
2237	7	15	0	5	f	f	WorkflowPermission	48	readonly
2238	7	15	0	5	f	f	WorkflowPermission	9	readonly
2877	8	14	0	4	f	f	WorkflowPermission	35	readonly
2240	7	15	0	5	f	f	WorkflowPermission	49	readonly
2241	7	15	0	5	f	f	WorkflowPermission	50	readonly
2242	7	15	0	5	f	f	WorkflowPermission	51	readonly
2243	7	15	0	5	f	f	WorkflowPermission	52	readonly
2244	7	15	0	5	f	f	WorkflowPermission	53	readonly
2245	7	15	0	5	f	f	WorkflowPermission	54	readonly
2246	7	15	0	5	f	f	WorkflowPermission	55	readonly
2247	7	15	0	5	f	f	WorkflowPermission	56	readonly
2878	8	14	0	4	f	f	WorkflowPermission	36	readonly
2249	7	15	0	5	f	f	WorkflowPermission	46	readonly
2250	7	15	0	5	f	f	WorkflowPermission	47	readonly
2879	8	14	0	4	f	f	WorkflowPermission	37	readonly
2880	8	14	0	4	f	f	WorkflowPermission	38	readonly
2881	8	14	0	4	f	f	WorkflowPermission	39	readonly
2882	8	14	0	4	f	f	WorkflowPermission	40	readonly
2883	8	14	0	4	f	f	WorkflowPermission	41	readonly
2884	8	14	0	4	f	f	WorkflowPermission	42	readonly
2885	8	14	0	4	f	f	WorkflowPermission	43	readonly
2886	8	14	0	4	f	f	WorkflowPermission	44	readonly
2887	8	14	0	4	f	f	WorkflowPermission	45	readonly
2888	8	14	0	4	f	f	WorkflowPermission	25	readonly
2889	8	14	0	4	f	f	WorkflowPermission	46	readonly
2890	8	14	0	4	f	f	WorkflowPermission	47	readonly
2261	7	12	0	5	f	f	WorkflowPermission	7	required
2262	7	12	0	5	f	f	WorkflowPermission	48	required
2263	7	12	0	5	f	f	WorkflowPermission	9	required
2891	8	14	0	4	f	f	WorkflowPermission	26	readonly
2265	7	12	0	5	f	f	WorkflowPermission	49	required
2266	7	12	0	5	f	f	WorkflowPermission	50	required
2267	7	12	0	5	f	f	WorkflowPermission	51	required
2268	7	12	0	5	f	f	WorkflowPermission	52	required
2269	7	12	0	5	f	f	WorkflowPermission	53	required
2270	7	12	0	5	f	f	WorkflowPermission	54	required
2271	7	12	0	5	f	f	WorkflowPermission	55	required
2272	7	12	0	5	f	f	WorkflowPermission	56	required
2892	8	14	0	4	f	f	WorkflowPermission	27	readonly
2274	7	12	0	5	f	f	WorkflowPermission	46	required
2275	7	12	0	5	f	f	WorkflowPermission	47	required
2893	8	14	0	4	f	f	WorkflowPermission	28	readonly
2894	8	14	0	4	f	f	WorkflowPermission	29	readonly
4766	11	14	0	4	f	f	WorkflowPermission	project_id	readonly
4767	11	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
4768	11	14	0	4	f	f	WorkflowPermission	subject	readonly
4769	11	14	0	4	f	f	WorkflowPermission	priority_id	readonly
4770	11	14	0	4	f	f	WorkflowPermission	is_private	readonly
4771	11	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
4772	11	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
4773	11	14	0	4	f	f	WorkflowPermission	description	readonly
4774	11	14	0	4	f	f	WorkflowPermission	2	readonly
4775	11	14	0	4	f	f	WorkflowPermission	3	readonly
2288	7	13	0	5	f	f	WorkflowPermission	7	readonly
2289	7	13	0	5	f	f	WorkflowPermission	48	readonly
2290	7	13	0	5	f	f	WorkflowPermission	9	readonly
4776	11	14	0	4	f	f	WorkflowPermission	4	readonly
2292	7	13	0	5	f	f	WorkflowPermission	49	readonly
2293	7	13	0	5	f	f	WorkflowPermission	50	readonly
2294	7	13	0	5	f	f	WorkflowPermission	51	readonly
2295	7	13	0	5	f	f	WorkflowPermission	52	readonly
2296	7	13	0	5	f	f	WorkflowPermission	53	readonly
2297	7	13	0	5	f	f	WorkflowPermission	54	readonly
2298	7	13	0	5	f	f	WorkflowPermission	55	readonly
2299	7	13	0	5	f	f	WorkflowPermission	56	readonly
4777	11	14	0	4	f	f	WorkflowPermission	5	readonly
2301	7	13	0	5	f	f	WorkflowPermission	46	readonly
2302	7	13	0	5	f	f	WorkflowPermission	47	readonly
2907	8	15	0	4	f	f	WorkflowPermission	7	readonly
2908	8	15	0	4	f	f	WorkflowPermission	48	readonly
2909	8	15	0	4	f	f	WorkflowPermission	9	readonly
2910	8	15	0	4	f	f	WorkflowPermission	34	readonly
2911	8	15	0	4	f	f	WorkflowPermission	35	readonly
2912	8	15	0	4	f	f	WorkflowPermission	36	readonly
2913	8	15	0	4	f	f	WorkflowPermission	37	readonly
4778	11	14	0	4	f	f	WorkflowPermission	7	readonly
4779	11	14	0	4	f	f	WorkflowPermission	48	readonly
4780	11	14	0	4	f	f	WorkflowPermission	9	readonly
4781	11	14	0	4	f	f	WorkflowPermission	34	readonly
2918	8	15	0	4	f	f	WorkflowPermission	42	readonly
2919	8	15	0	4	f	f	WorkflowPermission	43	readonly
2920	8	15	0	4	f	f	WorkflowPermission	44	readonly
2921	8	15	0	4	f	f	WorkflowPermission	45	readonly
2922	8	15	0	4	f	f	WorkflowPermission	25	readonly
2319	7	14	0	5	f	f	WorkflowPermission	7	readonly
2320	7	14	0	5	f	f	WorkflowPermission	48	readonly
2321	7	14	0	5	f	f	WorkflowPermission	9	readonly
2923	8	15	0	4	f	f	WorkflowPermission	46	readonly
2323	7	14	0	5	f	f	WorkflowPermission	49	readonly
2324	7	14	0	5	f	f	WorkflowPermission	50	readonly
2325	7	14	0	5	f	f	WorkflowPermission	51	readonly
2326	7	14	0	5	f	f	WorkflowPermission	52	readonly
2327	7	14	0	5	f	f	WorkflowPermission	53	readonly
2328	7	14	0	5	f	f	WorkflowPermission	54	readonly
2329	7	14	0	5	f	f	WorkflowPermission	55	readonly
2330	7	14	0	5	f	f	WorkflowPermission	56	readonly
2924	8	15	0	4	f	f	WorkflowPermission	47	readonly
2332	7	14	0	5	f	f	WorkflowPermission	46	readonly
2333	7	14	0	5	f	f	WorkflowPermission	47	readonly
4782	11	14	0	4	f	f	WorkflowPermission	35	readonly
2335	7	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
2336	7	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
2337	7	12	0	4	f	f	WorkflowPermission	2	required
2338	7	12	0	4	f	f	WorkflowPermission	3	required
2339	7	12	0	4	f	f	WorkflowPermission	4	required
2340	7	12	0	4	f	f	WorkflowPermission	5	required
2341	7	12	0	4	f	f	WorkflowPermission	6	required
2342	7	12	0	4	f	f	WorkflowPermission	23	required
2343	7	12	0	4	f	f	WorkflowPermission	38	required
2344	7	12	0	4	f	f	WorkflowPermission	39	required
2345	7	12	0	4	f	f	WorkflowPermission	40	required
2346	7	12	0	4	f	f	WorkflowPermission	41	required
2347	7	12	0	4	f	f	WorkflowPermission	57	required
2348	7	12	0	4	f	f	WorkflowPermission	58	required
2349	7	12	0	4	f	f	WorkflowPermission	25	required
2350	7	13	0	4	f	f	WorkflowPermission	project_id	readonly
2351	7	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
2352	7	13	0	4	f	f	WorkflowPermission	subject	readonly
2353	7	13	0	4	f	f	WorkflowPermission	priority_id	readonly
2354	7	13	0	4	f	f	WorkflowPermission	is_private	readonly
4783	11	14	0	4	f	f	WorkflowPermission	36	readonly
2355	7	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
2356	7	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
2357	7	13	0	4	f	f	WorkflowPermission	description	readonly
2358	7	13	0	4	f	f	WorkflowPermission	2	readonly
2359	7	13	0	4	f	f	WorkflowPermission	3	readonly
2360	7	13	0	4	f	f	WorkflowPermission	4	readonly
2361	7	13	0	4	f	f	WorkflowPermission	5	readonly
2362	7	13	0	4	f	f	WorkflowPermission	6	readonly
2363	7	13	0	4	f	f	WorkflowPermission	23	readonly
2364	7	13	0	4	f	f	WorkflowPermission	38	readonly
2365	7	13	0	4	f	f	WorkflowPermission	39	readonly
2366	7	13	0	4	f	f	WorkflowPermission	40	readonly
2367	7	13	0	4	f	f	WorkflowPermission	41	readonly
2368	7	13	0	4	f	f	WorkflowPermission	57	readonly
2369	7	13	0	4	f	f	WorkflowPermission	58	readonly
2370	7	13	0	4	f	f	WorkflowPermission	25	readonly
2371	7	13	0	4	f	f	WorkflowPermission	26	readonly
2372	7	13	0	4	f	f	WorkflowPermission	27	readonly
2373	7	13	0	4	f	f	WorkflowPermission	28	readonly
2374	7	13	0	4	f	f	WorkflowPermission	29	readonly
2375	7	14	0	4	f	f	WorkflowPermission	project_id	readonly
2376	7	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
2377	7	14	0	4	f	f	WorkflowPermission	subject	readonly
2378	7	14	0	4	f	f	WorkflowPermission	priority_id	readonly
2379	7	14	0	4	f	f	WorkflowPermission	is_private	readonly
2380	7	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
2381	7	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
2382	7	14	0	4	f	f	WorkflowPermission	description	readonly
2383	7	14	0	4	f	f	WorkflowPermission	2	readonly
2384	7	14	0	4	f	f	WorkflowPermission	3	readonly
2385	7	14	0	4	f	f	WorkflowPermission	4	readonly
2386	7	14	0	4	f	f	WorkflowPermission	5	readonly
2387	7	14	0	4	f	f	WorkflowPermission	6	readonly
2388	7	14	0	4	f	f	WorkflowPermission	23	readonly
2389	7	14	0	4	f	f	WorkflowPermission	38	readonly
2390	7	14	0	4	f	f	WorkflowPermission	39	readonly
2391	7	14	0	4	f	f	WorkflowPermission	40	readonly
2392	7	14	0	4	f	f	WorkflowPermission	41	readonly
2393	7	14	0	4	f	f	WorkflowPermission	57	readonly
2394	7	14	0	4	f	f	WorkflowPermission	58	readonly
2395	7	14	0	4	f	f	WorkflowPermission	25	readonly
2396	7	14	0	4	f	f	WorkflowPermission	26	readonly
2397	7	14	0	4	f	f	WorkflowPermission	27	readonly
2398	7	14	0	4	f	f	WorkflowPermission	28	readonly
2399	7	14	0	4	f	f	WorkflowPermission	29	readonly
2400	7	15	0	4	f	f	WorkflowPermission	project_id	readonly
2401	7	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
2402	7	15	0	4	f	f	WorkflowPermission	subject	readonly
2403	7	15	0	4	f	f	WorkflowPermission	priority_id	readonly
2404	7	15	0	4	f	f	WorkflowPermission	is_private	readonly
2405	7	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
2406	7	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
2407	7	15	0	4	f	f	WorkflowPermission	description	readonly
2408	7	15	0	4	f	f	WorkflowPermission	2	readonly
2409	7	15	0	4	f	f	WorkflowPermission	3	readonly
2410	7	15	0	4	f	f	WorkflowPermission	4	readonly
2411	7	15	0	4	f	f	WorkflowPermission	5	readonly
2412	7	15	0	4	f	f	WorkflowPermission	6	readonly
2413	7	15	0	4	f	f	WorkflowPermission	23	readonly
2414	7	15	0	4	f	f	WorkflowPermission	38	readonly
2415	7	15	0	4	f	f	WorkflowPermission	39	readonly
2416	7	15	0	4	f	f	WorkflowPermission	40	readonly
2417	7	15	0	4	f	f	WorkflowPermission	41	readonly
2418	7	15	0	4	f	f	WorkflowPermission	57	readonly
2419	7	15	0	4	f	f	WorkflowPermission	58	readonly
2420	7	15	0	4	f	f	WorkflowPermission	25	readonly
2421	7	15	0	4	f	f	WorkflowPermission	26	readonly
2422	7	15	0	4	f	f	WorkflowPermission	27	readonly
2423	7	15	0	4	f	f	WorkflowPermission	28	readonly
2424	7	15	0	4	f	f	WorkflowPermission	29	readonly
2425	7	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
2426	7	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
2427	7	12	0	5	f	f	WorkflowPermission	2	required
2428	7	12	0	5	f	f	WorkflowPermission	3	required
2429	7	12	0	5	f	f	WorkflowPermission	4	required
2430	7	12	0	5	f	f	WorkflowPermission	5	required
2431	7	12	0	5	f	f	WorkflowPermission	6	required
2432	7	12	0	5	f	f	WorkflowPermission	23	required
2433	7	12	0	5	f	f	WorkflowPermission	38	required
2434	7	12	0	5	f	f	WorkflowPermission	39	required
2435	7	12	0	5	f	f	WorkflowPermission	40	required
2436	7	12	0	5	f	f	WorkflowPermission	41	required
2437	7	12	0	5	f	f	WorkflowPermission	57	required
2438	7	12	0	5	f	f	WorkflowPermission	58	required
2439	7	12	0	5	f	f	WorkflowPermission	25	required
2440	7	13	0	5	f	f	WorkflowPermission	project_id	readonly
2441	7	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
2442	7	13	0	5	f	f	WorkflowPermission	subject	readonly
2443	7	13	0	5	f	f	WorkflowPermission	priority_id	readonly
2444	7	13	0	5	f	f	WorkflowPermission	is_private	readonly
2445	7	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
2446	7	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
2447	7	13	0	5	f	f	WorkflowPermission	description	readonly
2448	7	13	0	5	f	f	WorkflowPermission	2	readonly
2449	7	13	0	5	f	f	WorkflowPermission	3	readonly
2450	7	13	0	5	f	f	WorkflowPermission	4	readonly
2451	7	13	0	5	f	f	WorkflowPermission	5	readonly
2452	7	13	0	5	f	f	WorkflowPermission	6	readonly
2453	7	13	0	5	f	f	WorkflowPermission	23	readonly
2454	7	13	0	5	f	f	WorkflowPermission	38	readonly
2455	7	13	0	5	f	f	WorkflowPermission	39	readonly
2456	7	13	0	5	f	f	WorkflowPermission	40	readonly
2457	7	13	0	5	f	f	WorkflowPermission	41	readonly
2458	7	13	0	5	f	f	WorkflowPermission	57	readonly
2459	7	13	0	5	f	f	WorkflowPermission	58	readonly
2460	7	13	0	5	f	f	WorkflowPermission	25	readonly
2461	7	13	0	5	f	f	WorkflowPermission	26	readonly
2462	7	13	0	5	f	f	WorkflowPermission	27	readonly
2463	7	13	0	5	f	f	WorkflowPermission	28	readonly
2464	7	13	0	5	f	f	WorkflowPermission	29	readonly
2465	7	14	0	5	f	f	WorkflowPermission	project_id	readonly
2466	7	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
2467	7	14	0	5	f	f	WorkflowPermission	subject	readonly
2468	7	14	0	5	f	f	WorkflowPermission	priority_id	readonly
2469	7	14	0	5	f	f	WorkflowPermission	is_private	readonly
2470	7	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
2471	7	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
2472	7	14	0	5	f	f	WorkflowPermission	description	readonly
2473	7	14	0	5	f	f	WorkflowPermission	2	readonly
2474	7	14	0	5	f	f	WorkflowPermission	3	readonly
2475	7	14	0	5	f	f	WorkflowPermission	4	readonly
2476	7	14	0	5	f	f	WorkflowPermission	5	readonly
2477	7	14	0	5	f	f	WorkflowPermission	6	readonly
2478	7	14	0	5	f	f	WorkflowPermission	23	readonly
2479	7	14	0	5	f	f	WorkflowPermission	38	readonly
2480	7	14	0	5	f	f	WorkflowPermission	39	readonly
2481	7	14	0	5	f	f	WorkflowPermission	40	readonly
2482	7	14	0	5	f	f	WorkflowPermission	41	readonly
2483	7	14	0	5	f	f	WorkflowPermission	57	readonly
2484	7	14	0	5	f	f	WorkflowPermission	58	readonly
2485	7	14	0	5	f	f	WorkflowPermission	25	readonly
2486	7	14	0	5	f	f	WorkflowPermission	26	readonly
2487	7	14	0	5	f	f	WorkflowPermission	27	readonly
2488	7	14	0	5	f	f	WorkflowPermission	28	readonly
2489	7	14	0	5	f	f	WorkflowPermission	29	readonly
2490	7	15	0	5	f	f	WorkflowPermission	project_id	readonly
2491	7	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
2492	7	15	0	5	f	f	WorkflowPermission	subject	readonly
2493	7	15	0	5	f	f	WorkflowPermission	priority_id	readonly
2494	7	15	0	5	f	f	WorkflowPermission	is_private	readonly
2495	7	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
2496	7	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
2497	7	15	0	5	f	f	WorkflowPermission	description	readonly
2498	7	15	0	5	f	f	WorkflowPermission	2	readonly
2499	7	15	0	5	f	f	WorkflowPermission	3	readonly
2500	7	15	0	5	f	f	WorkflowPermission	4	readonly
2501	7	15	0	5	f	f	WorkflowPermission	5	readonly
2502	7	15	0	5	f	f	WorkflowPermission	6	readonly
2503	7	15	0	5	f	f	WorkflowPermission	23	readonly
2504	7	15	0	5	f	f	WorkflowPermission	38	readonly
2505	7	15	0	5	f	f	WorkflowPermission	39	readonly
2506	7	15	0	5	f	f	WorkflowPermission	40	readonly
2507	7	15	0	5	f	f	WorkflowPermission	41	readonly
2508	7	15	0	5	f	f	WorkflowPermission	57	readonly
2509	7	15	0	5	f	f	WorkflowPermission	58	readonly
2510	7	15	0	5	f	f	WorkflowPermission	25	readonly
2511	7	15	0	5	f	f	WorkflowPermission	26	readonly
2512	7	15	0	5	f	f	WorkflowPermission	27	readonly
2513	7	15	0	5	f	f	WorkflowPermission	28	readonly
2514	7	15	0	5	f	f	WorkflowPermission	29	readonly
4784	11	14	0	4	f	f	WorkflowPermission	37	readonly
4785	11	14	0	4	f	f	WorkflowPermission	38	readonly
2929	8	7	6	4	f	f	WorkflowTransition	\N	\N
2930	8	8	6	4	f	f	WorkflowTransition	\N	\N
2931	8	8	7	4	f	f	WorkflowTransition	\N	\N
2932	8	9	6	4	f	f	WorkflowTransition	\N	\N
2933	8	9	7	4	f	f	WorkflowTransition	\N	\N
2934	8	9	8	4	f	f	WorkflowTransition	\N	\N
2935	8	10	6	4	f	f	WorkflowTransition	\N	\N
2936	8	10	7	4	f	f	WorkflowTransition	\N	\N
2525	5	4	6	5	f	f	WorkflowTransition	\N	\N
2937	8	10	8	4	f	f	WorkflowTransition	\N	\N
2938	8	10	9	4	f	f	WorkflowTransition	\N	\N
2939	8	11	7	4	f	f	WorkflowTransition	\N	\N
2940	8	11	8	4	f	f	WorkflowTransition	\N	\N
2941	8	11	9	4	f	f	WorkflowTransition	\N	\N
2942	8	11	10	4	f	f	WorkflowTransition	\N	\N
4786	11	14	0	4	f	f	WorkflowPermission	39	readonly
4787	11	14	0	4	f	f	WorkflowPermission	40	readonly
2534	5	6	4	5	f	f	WorkflowTransition	\N	\N
2535	5	6	7	5	f	f	WorkflowTransition	\N	\N
2536	5	6	8	5	f	f	WorkflowTransition	\N	\N
2537	5	6	9	5	f	f	WorkflowTransition	\N	\N
2538	5	6	10	5	f	f	WorkflowTransition	\N	\N
2539	5	6	11	5	f	f	WorkflowTransition	\N	\N
2540	5	6	12	5	f	f	WorkflowTransition	\N	\N
4788	11	14	0	4	f	f	WorkflowPermission	41	readonly
2542	5	6	15	5	f	f	WorkflowTransition	\N	\N
4789	11	14	0	4	f	f	WorkflowPermission	42	readonly
2544	5	7	6	5	f	f	WorkflowTransition	\N	\N
2545	5	7	8	5	f	f	WorkflowTransition	\N	\N
2546	5	7	9	5	f	f	WorkflowTransition	\N	\N
2547	5	7	10	5	f	f	WorkflowTransition	\N	\N
2548	5	7	11	5	f	f	WorkflowTransition	\N	\N
2549	5	7	12	5	f	f	WorkflowTransition	\N	\N
4790	11	14	0	4	f	f	WorkflowPermission	43	readonly
2551	5	7	15	5	f	f	WorkflowTransition	\N	\N
4791	11	14	0	4	f	f	WorkflowPermission	44	readonly
2553	5	8	6	5	f	f	WorkflowTransition	\N	\N
2554	5	8	7	5	f	f	WorkflowTransition	\N	\N
2555	5	8	9	5	f	f	WorkflowTransition	\N	\N
2556	5	8	10	5	f	f	WorkflowTransition	\N	\N
2557	5	8	11	5	f	f	WorkflowTransition	\N	\N
2558	5	8	12	5	f	f	WorkflowTransition	\N	\N
4792	11	14	0	4	f	f	WorkflowPermission	45	readonly
2560	5	8	15	5	f	f	WorkflowTransition	\N	\N
2949	8	12	0	5	f	f	WorkflowPermission	7	required
2562	5	9	6	5	f	f	WorkflowTransition	\N	\N
2563	5	9	7	5	f	f	WorkflowTransition	\N	\N
2564	5	9	8	5	f	f	WorkflowTransition	\N	\N
2565	5	9	10	5	f	f	WorkflowTransition	\N	\N
2566	5	9	11	5	f	f	WorkflowTransition	\N	\N
2567	5	9	12	5	f	f	WorkflowTransition	\N	\N
2950	8	12	0	5	f	f	WorkflowPermission	48	required
2569	5	9	15	5	f	f	WorkflowTransition	\N	\N
2951	8	12	0	5	f	f	WorkflowPermission	9	required
2571	5	10	6	5	f	f	WorkflowTransition	\N	\N
2572	5	10	7	5	f	f	WorkflowTransition	\N	\N
2573	5	10	8	5	f	f	WorkflowTransition	\N	\N
2574	5	10	9	5	f	f	WorkflowTransition	\N	\N
2575	5	10	11	5	f	f	WorkflowTransition	\N	\N
2576	5	10	12	5	f	f	WorkflowTransition	\N	\N
2952	8	12	0	5	f	f	WorkflowPermission	34	required
2578	5	10	15	5	f	f	WorkflowTransition	\N	\N
2953	8	12	0	5	f	f	WorkflowPermission	35	required
2580	5	11	6	5	f	f	WorkflowTransition	\N	\N
2581	5	11	7	5	f	f	WorkflowTransition	\N	\N
2582	5	11	8	5	f	f	WorkflowTransition	\N	\N
2583	5	11	9	5	f	f	WorkflowTransition	\N	\N
2584	5	11	10	5	f	f	WorkflowTransition	\N	\N
2585	5	11	12	5	f	f	WorkflowTransition	\N	\N
2954	8	12	0	5	f	f	WorkflowPermission	36	required
2955	8	12	0	5	f	f	WorkflowPermission	37	required
2615	5	7	6	4	f	f	WorkflowTransition	\N	\N
2616	5	8	6	4	f	f	WorkflowTransition	\N	\N
2617	5	8	7	4	f	f	WorkflowTransition	\N	\N
2618	5	9	6	4	f	f	WorkflowTransition	\N	\N
2619	5	9	7	4	f	f	WorkflowTransition	\N	\N
2620	5	9	8	4	f	f	WorkflowTransition	\N	\N
2621	5	10	6	4	f	f	WorkflowTransition	\N	\N
2622	5	10	7	4	f	f	WorkflowTransition	\N	\N
2623	5	10	8	4	f	f	WorkflowTransition	\N	\N
2624	5	10	9	4	f	f	WorkflowTransition	\N	\N
2625	5	11	7	4	f	f	WorkflowTransition	\N	\N
2626	5	11	8	4	f	f	WorkflowTransition	\N	\N
2627	5	11	9	4	f	f	WorkflowTransition	\N	\N
2628	5	11	10	4	f	f	WorkflowTransition	\N	\N
2629	5	4	15	5	f	f	WorkflowTransition	\N	\N
2630	5	11	15	5	f	f	WorkflowTransition	\N	\N
2631	6	4	6	5	f	f	WorkflowTransition	\N	\N
2639	6	4	15	5	f	f	WorkflowTransition	\N	\N
2640	6	6	4	5	f	f	WorkflowTransition	\N	\N
2641	6	6	7	5	f	f	WorkflowTransition	\N	\N
2642	6	6	8	5	f	f	WorkflowTransition	\N	\N
2643	6	6	9	5	f	f	WorkflowTransition	\N	\N
2644	6	6	10	5	f	f	WorkflowTransition	\N	\N
2645	6	6	11	5	f	f	WorkflowTransition	\N	\N
2646	6	6	12	5	f	f	WorkflowTransition	\N	\N
2648	6	6	15	5	f	f	WorkflowTransition	\N	\N
2649	6	7	6	5	f	f	WorkflowTransition	\N	\N
2650	6	7	8	5	f	f	WorkflowTransition	\N	\N
2651	6	7	9	5	f	f	WorkflowTransition	\N	\N
2652	6	7	10	5	f	f	WorkflowTransition	\N	\N
2653	6	7	11	5	f	f	WorkflowTransition	\N	\N
2654	6	7	12	5	f	f	WorkflowTransition	\N	\N
2656	6	7	15	5	f	f	WorkflowTransition	\N	\N
2657	6	8	6	5	f	f	WorkflowTransition	\N	\N
2658	6	8	7	5	f	f	WorkflowTransition	\N	\N
2659	6	8	9	5	f	f	WorkflowTransition	\N	\N
2660	6	8	10	5	f	f	WorkflowTransition	\N	\N
2661	6	8	11	5	f	f	WorkflowTransition	\N	\N
2662	6	8	12	5	f	f	WorkflowTransition	\N	\N
2664	6	8	15	5	f	f	WorkflowTransition	\N	\N
2665	6	9	6	5	f	f	WorkflowTransition	\N	\N
2666	6	9	7	5	f	f	WorkflowTransition	\N	\N
2667	6	9	8	5	f	f	WorkflowTransition	\N	\N
2668	6	9	10	5	f	f	WorkflowTransition	\N	\N
2669	6	9	11	5	f	f	WorkflowTransition	\N	\N
2670	6	9	12	5	f	f	WorkflowTransition	\N	\N
2672	6	9	15	5	f	f	WorkflowTransition	\N	\N
2673	6	10	6	5	f	f	WorkflowTransition	\N	\N
2674	6	10	7	5	f	f	WorkflowTransition	\N	\N
2675	6	10	8	5	f	f	WorkflowTransition	\N	\N
2676	6	10	9	5	f	f	WorkflowTransition	\N	\N
2677	6	10	11	5	f	f	WorkflowTransition	\N	\N
2678	6	10	12	5	f	f	WorkflowTransition	\N	\N
2956	8	12	0	5	f	f	WorkflowPermission	42	required
2680	6	10	15	5	f	f	WorkflowTransition	\N	\N
2681	6	11	6	5	f	f	WorkflowTransition	\N	\N
2682	6	11	7	5	f	f	WorkflowTransition	\N	\N
2683	6	11	8	5	f	f	WorkflowTransition	\N	\N
2684	6	11	9	5	f	f	WorkflowTransition	\N	\N
2685	6	11	10	5	f	f	WorkflowTransition	\N	\N
2686	6	11	12	5	f	f	WorkflowTransition	\N	\N
2957	8	12	0	5	f	f	WorkflowPermission	43	required
2688	6	11	15	5	f	f	WorkflowTransition	\N	\N
2958	8	12	0	5	f	f	WorkflowPermission	44	required
2959	8	12	0	5	f	f	WorkflowPermission	45	required
2960	8	12	0	5	f	f	WorkflowPermission	25	required
2961	8	12	0	5	f	f	WorkflowPermission	46	required
2962	8	12	0	5	f	f	WorkflowPermission	47	required
4793	11	14	0	4	f	f	WorkflowPermission	25	readonly
4794	11	14	0	4	f	f	WorkflowPermission	46	readonly
4795	11	14	0	4	f	f	WorkflowPermission	47	readonly
4796	11	14	0	4	f	f	WorkflowPermission	26	readonly
4797	11	14	0	4	f	f	WorkflowPermission	27	readonly
4798	11	14	0	4	f	f	WorkflowPermission	28	readonly
4799	11	14	0	4	f	f	WorkflowPermission	29	readonly
4800	11	15	0	4	f	f	WorkflowPermission	48	readonly
4804	11	7	6	4	f	f	WorkflowTransition	\N	\N
2975	8	13	0	5	f	f	WorkflowPermission	7	readonly
2976	8	13	0	5	f	f	WorkflowPermission	48	readonly
2977	8	13	0	5	f	f	WorkflowPermission	9	readonly
2978	8	13	0	5	f	f	WorkflowPermission	34	readonly
2979	8	13	0	5	f	f	WorkflowPermission	35	readonly
2980	8	13	0	5	f	f	WorkflowPermission	36	readonly
2981	8	13	0	5	f	f	WorkflowPermission	37	readonly
4805	11	8	6	4	f	f	WorkflowTransition	\N	\N
4806	11	8	7	4	f	f	WorkflowTransition	\N	\N
4807	11	9	6	4	f	f	WorkflowTransition	\N	\N
4808	11	9	7	4	f	f	WorkflowTransition	\N	\N
2986	8	13	0	5	f	f	WorkflowPermission	42	readonly
2987	8	13	0	5	f	f	WorkflowPermission	43	readonly
2988	8	13	0	5	f	f	WorkflowPermission	44	readonly
2989	8	13	0	5	f	f	WorkflowPermission	45	readonly
2990	8	13	0	5	f	f	WorkflowPermission	25	readonly
2991	8	13	0	5	f	f	WorkflowPermission	46	readonly
2992	8	13	0	5	f	f	WorkflowPermission	47	readonly
4809	11	9	8	4	f	f	WorkflowTransition	\N	\N
4810	11	10	6	4	f	f	WorkflowTransition	\N	\N
4811	11	10	7	4	f	f	WorkflowTransition	\N	\N
4812	11	10	8	4	f	f	WorkflowTransition	\N	\N
2997	8	14	0	5	f	f	WorkflowPermission	project_id	readonly
2998	8	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
2999	8	14	0	5	f	f	WorkflowPermission	subject	readonly
3000	8	14	0	5	f	f	WorkflowPermission	priority_id	readonly
3001	8	14	0	5	f	f	WorkflowPermission	is_private	readonly
3002	8	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
3003	8	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
3004	8	14	0	5	f	f	WorkflowPermission	description	readonly
3005	8	14	0	5	f	f	WorkflowPermission	2	readonly
3006	8	14	0	5	f	f	WorkflowPermission	3	readonly
3007	8	14	0	5	f	f	WorkflowPermission	4	readonly
3008	8	14	0	5	f	f	WorkflowPermission	5	readonly
3009	8	14	0	5	f	f	WorkflowPermission	7	readonly
3010	8	14	0	5	f	f	WorkflowPermission	48	readonly
3011	8	14	0	5	f	f	WorkflowPermission	9	readonly
3012	8	14	0	5	f	f	WorkflowPermission	34	readonly
3013	8	14	0	5	f	f	WorkflowPermission	35	readonly
3014	8	14	0	5	f	f	WorkflowPermission	36	readonly
3015	8	14	0	5	f	f	WorkflowPermission	37	readonly
3016	8	14	0	5	f	f	WorkflowPermission	38	readonly
3017	8	14	0	5	f	f	WorkflowPermission	39	readonly
3018	8	14	0	5	f	f	WorkflowPermission	40	readonly
3019	8	14	0	5	f	f	WorkflowPermission	41	readonly
3020	8	14	0	5	f	f	WorkflowPermission	42	readonly
3021	8	14	0	5	f	f	WorkflowPermission	43	readonly
3022	8	14	0	5	f	f	WorkflowPermission	44	readonly
3023	8	14	0	5	f	f	WorkflowPermission	45	readonly
3024	8	14	0	5	f	f	WorkflowPermission	25	readonly
3025	8	14	0	5	f	f	WorkflowPermission	46	readonly
3026	8	14	0	5	f	f	WorkflowPermission	47	readonly
3027	8	14	0	5	f	f	WorkflowPermission	26	readonly
3028	8	14	0	5	f	f	WorkflowPermission	27	readonly
3029	8	14	0	5	f	f	WorkflowPermission	28	readonly
3030	8	14	0	5	f	f	WorkflowPermission	29	readonly
4813	11	10	9	4	f	f	WorkflowTransition	\N	\N
4814	11	11	7	4	f	f	WorkflowTransition	\N	\N
4815	11	11	8	4	f	f	WorkflowTransition	\N	\N
4816	11	11	9	4	f	f	WorkflowTransition	\N	\N
4817	11	11	10	4	f	f	WorkflowTransition	\N	\N
3078	8	7	11	5	f	f	WorkflowTransition	\N	\N
3079	8	7	12	5	f	f	WorkflowTransition	\N	\N
3080	8	7	15	5	f	f	WorkflowTransition	\N	\N
3081	8	8	6	5	f	f	WorkflowTransition	\N	\N
3082	8	8	7	5	f	f	WorkflowTransition	\N	\N
3083	8	8	9	5	f	f	WorkflowTransition	\N	\N
3084	8	8	10	5	f	f	WorkflowTransition	\N	\N
3085	8	8	11	5	f	f	WorkflowTransition	\N	\N
3086	8	8	12	5	f	f	WorkflowTransition	\N	\N
3087	8	8	15	5	f	f	WorkflowTransition	\N	\N
3088	8	9	6	5	f	f	WorkflowTransition	\N	\N
3089	8	9	7	5	f	f	WorkflowTransition	\N	\N
3090	8	9	8	5	f	f	WorkflowTransition	\N	\N
3091	8	9	10	5	f	f	WorkflowTransition	\N	\N
3092	8	9	11	5	f	f	WorkflowTransition	\N	\N
3093	8	9	12	5	f	f	WorkflowTransition	\N	\N
3094	8	9	15	5	f	f	WorkflowTransition	\N	\N
3095	8	10	6	5	f	f	WorkflowTransition	\N	\N
3096	8	10	7	5	f	f	WorkflowTransition	\N	\N
3097	8	10	8	5	f	f	WorkflowTransition	\N	\N
3098	8	10	9	5	f	f	WorkflowTransition	\N	\N
3099	8	10	11	5	f	f	WorkflowTransition	\N	\N
3100	8	10	12	5	f	f	WorkflowTransition	\N	\N
3101	8	10	15	5	f	f	WorkflowTransition	\N	\N
3102	8	11	6	5	f	f	WorkflowTransition	\N	\N
3103	8	11	7	5	f	f	WorkflowTransition	\N	\N
3104	8	11	8	5	f	f	WorkflowTransition	\N	\N
3105	8	11	9	5	f	f	WorkflowTransition	\N	\N
3106	8	11	10	5	f	f	WorkflowTransition	\N	\N
3107	8	11	12	5	f	f	WorkflowTransition	\N	\N
3108	8	4	15	5	f	f	WorkflowTransition	\N	\N
3109	8	11	15	5	f	f	WorkflowTransition	\N	\N
3172	8	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
3173	8	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
3174	8	12	0	4	f	f	WorkflowPermission	2	required
3175	8	12	0	4	f	f	WorkflowPermission	3	required
3176	8	12	0	4	f	f	WorkflowPermission	4	required
3177	8	12	0	4	f	f	WorkflowPermission	5	required
3178	8	12	0	4	f	f	WorkflowPermission	6	required
3179	8	12	0	4	f	f	WorkflowPermission	23	required
3180	8	12	0	4	f	f	WorkflowPermission	38	required
3181	8	12	0	4	f	f	WorkflowPermission	39	required
3182	8	12	0	4	f	f	WorkflowPermission	40	required
3183	8	12	0	4	f	f	WorkflowPermission	41	required
3184	8	12	0	4	f	f	WorkflowPermission	59	required
3185	8	12	0	4	f	f	WorkflowPermission	60	required
3186	8	12	0	4	f	f	WorkflowPermission	61	required
3187	8	12	0	4	f	f	WorkflowPermission	62	required
3188	8	13	0	4	f	f	WorkflowPermission	project_id	readonly
3189	8	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
3190	8	13	0	4	f	f	WorkflowPermission	subject	readonly
3191	8	13	0	4	f	f	WorkflowPermission	priority_id	readonly
3192	8	13	0	4	f	f	WorkflowPermission	is_private	readonly
3193	8	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3194	8	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3195	8	13	0	4	f	f	WorkflowPermission	description	readonly
3196	8	13	0	4	f	f	WorkflowPermission	2	readonly
3197	8	13	0	4	f	f	WorkflowPermission	3	readonly
3198	8	13	0	4	f	f	WorkflowPermission	4	readonly
3199	8	13	0	4	f	f	WorkflowPermission	5	readonly
3200	8	13	0	4	f	f	WorkflowPermission	6	readonly
3201	8	13	0	4	f	f	WorkflowPermission	23	readonly
3202	8	13	0	4	f	f	WorkflowPermission	38	readonly
3203	8	13	0	4	f	f	WorkflowPermission	39	readonly
3204	8	13	0	4	f	f	WorkflowPermission	40	readonly
3205	8	13	0	4	f	f	WorkflowPermission	41	readonly
3206	8	13	0	4	f	f	WorkflowPermission	59	readonly
3207	8	13	0	4	f	f	WorkflowPermission	60	readonly
3208	8	13	0	4	f	f	WorkflowPermission	61	readonly
3209	8	13	0	4	f	f	WorkflowPermission	62	readonly
3210	8	13	0	4	f	f	WorkflowPermission	26	readonly
3211	8	13	0	4	f	f	WorkflowPermission	27	readonly
3212	8	13	0	4	f	f	WorkflowPermission	28	readonly
3213	8	13	0	4	f	f	WorkflowPermission	29	readonly
3214	8	15	0	4	f	f	WorkflowPermission	project_id	readonly
3215	8	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
3216	8	15	0	4	f	f	WorkflowPermission	subject	readonly
3217	8	15	0	4	f	f	WorkflowPermission	priority_id	readonly
3218	8	15	0	4	f	f	WorkflowPermission	is_private	readonly
3219	8	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3220	8	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3221	8	15	0	4	f	f	WorkflowPermission	description	readonly
3222	8	15	0	4	f	f	WorkflowPermission	2	readonly
3223	8	15	0	4	f	f	WorkflowPermission	3	readonly
3224	8	15	0	4	f	f	WorkflowPermission	4	readonly
3225	8	15	0	4	f	f	WorkflowPermission	5	readonly
3226	8	15	0	4	f	f	WorkflowPermission	6	readonly
3227	8	15	0	4	f	f	WorkflowPermission	23	readonly
3228	8	15	0	4	f	f	WorkflowPermission	38	readonly
3229	8	15	0	4	f	f	WorkflowPermission	39	readonly
3230	8	15	0	4	f	f	WorkflowPermission	40	readonly
3231	8	15	0	4	f	f	WorkflowPermission	41	readonly
3232	8	15	0	4	f	f	WorkflowPermission	59	readonly
3233	8	15	0	4	f	f	WorkflowPermission	60	readonly
3234	8	15	0	4	f	f	WorkflowPermission	61	readonly
3235	8	15	0	4	f	f	WorkflowPermission	62	readonly
3236	8	15	0	4	f	f	WorkflowPermission	26	readonly
3237	8	15	0	4	f	f	WorkflowPermission	27	readonly
3238	8	15	0	4	f	f	WorkflowPermission	28	readonly
3239	8	15	0	4	f	f	WorkflowPermission	29	readonly
3240	8	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
3241	8	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
3242	8	12	0	5	f	f	WorkflowPermission	2	required
3243	8	12	0	5	f	f	WorkflowPermission	3	required
3244	8	12	0	5	f	f	WorkflowPermission	4	required
3245	8	12	0	5	f	f	WorkflowPermission	5	required
3246	8	12	0	5	f	f	WorkflowPermission	6	required
3247	8	12	0	5	f	f	WorkflowPermission	23	required
3248	8	12	0	5	f	f	WorkflowPermission	38	required
3249	8	12	0	5	f	f	WorkflowPermission	39	required
3250	8	12	0	5	f	f	WorkflowPermission	40	required
3251	8	12	0	5	f	f	WorkflowPermission	41	required
3252	8	12	0	5	f	f	WorkflowPermission	59	required
3253	8	12	0	5	f	f	WorkflowPermission	60	required
3254	8	12	0	5	f	f	WorkflowPermission	61	required
3255	8	12	0	5	f	f	WorkflowPermission	62	required
3256	8	13	0	5	f	f	WorkflowPermission	project_id	readonly
3257	8	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
3258	8	13	0	5	f	f	WorkflowPermission	subject	readonly
3259	8	13	0	5	f	f	WorkflowPermission	priority_id	readonly
3260	8	13	0	5	f	f	WorkflowPermission	is_private	readonly
3261	8	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
3262	8	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
3263	8	13	0	5	f	f	WorkflowPermission	description	readonly
3264	8	13	0	5	f	f	WorkflowPermission	2	readonly
3265	8	13	0	5	f	f	WorkflowPermission	3	readonly
3266	8	13	0	5	f	f	WorkflowPermission	4	readonly
3267	8	13	0	5	f	f	WorkflowPermission	5	readonly
3268	8	13	0	5	f	f	WorkflowPermission	6	readonly
3269	8	13	0	5	f	f	WorkflowPermission	23	readonly
3270	8	13	0	5	f	f	WorkflowPermission	38	readonly
3271	8	13	0	5	f	f	WorkflowPermission	39	readonly
3272	8	13	0	5	f	f	WorkflowPermission	40	readonly
3273	8	13	0	5	f	f	WorkflowPermission	41	readonly
3274	8	13	0	5	f	f	WorkflowPermission	59	readonly
3275	8	13	0	5	f	f	WorkflowPermission	60	readonly
3276	8	13	0	5	f	f	WorkflowPermission	61	readonly
3277	8	13	0	5	f	f	WorkflowPermission	62	readonly
3278	8	13	0	5	f	f	WorkflowPermission	26	readonly
3279	8	13	0	5	f	f	WorkflowPermission	27	readonly
3280	8	13	0	5	f	f	WorkflowPermission	28	readonly
3281	8	13	0	5	f	f	WorkflowPermission	29	readonly
3282	8	15	0	5	f	f	WorkflowPermission	project_id	readonly
3283	8	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
3284	8	15	0	5	f	f	WorkflowPermission	subject	readonly
3285	8	15	0	5	f	f	WorkflowPermission	priority_id	readonly
3286	8	15	0	5	f	f	WorkflowPermission	is_private	readonly
3287	8	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
3288	8	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
3289	8	15	0	5	f	f	WorkflowPermission	description	readonly
3290	8	15	0	5	f	f	WorkflowPermission	2	readonly
3291	8	15	0	5	f	f	WorkflowPermission	3	readonly
3292	8	15	0	5	f	f	WorkflowPermission	4	readonly
3293	8	15	0	5	f	f	WorkflowPermission	5	readonly
3294	8	15	0	5	f	f	WorkflowPermission	6	readonly
3295	8	15	0	5	f	f	WorkflowPermission	23	readonly
3296	8	15	0	5	f	f	WorkflowPermission	38	readonly
3297	8	15	0	5	f	f	WorkflowPermission	39	readonly
3298	8	15	0	5	f	f	WorkflowPermission	40	readonly
3299	8	15	0	5	f	f	WorkflowPermission	41	readonly
3300	8	15	0	5	f	f	WorkflowPermission	59	readonly
3301	8	15	0	5	f	f	WorkflowPermission	60	readonly
3302	8	15	0	5	f	f	WorkflowPermission	61	readonly
3303	8	15	0	5	f	f	WorkflowPermission	62	readonly
3304	8	15	0	5	f	f	WorkflowPermission	26	readonly
3305	8	15	0	5	f	f	WorkflowPermission	27	readonly
3306	8	15	0	5	f	f	WorkflowPermission	28	readonly
3307	8	15	0	5	f	f	WorkflowPermission	29	readonly
3308	9	12	4	4	f	f	WorkflowTransition	\N	\N
3309	9	13	4	4	f	f	WorkflowTransition	\N	\N
3310	9	14	4	4	f	f	WorkflowTransition	\N	\N
3311	9	15	4	4	f	f	WorkflowTransition	\N	\N
3312	9	4	5	4	f	f	WorkflowTransition	\N	\N
3313	9	4	6	4	f	f	WorkflowTransition	\N	\N
3314	9	4	14	4	f	f	WorkflowTransition	\N	\N
3315	9	4	15	4	f	f	WorkflowTransition	\N	\N
3316	9	5	6	4	f	f	WorkflowTransition	\N	\N
3317	9	5	14	4	f	f	WorkflowTransition	\N	\N
3318	9	5	15	4	f	f	WorkflowTransition	\N	\N
3319	9	6	7	4	f	f	WorkflowTransition	\N	\N
3320	9	6	8	4	f	f	WorkflowTransition	\N	\N
3321	9	6	9	4	f	f	WorkflowTransition	\N	\N
3322	9	6	10	4	f	f	WorkflowTransition	\N	\N
3323	9	6	11	4	f	f	WorkflowTransition	\N	\N
3324	9	6	12	4	f	f	WorkflowTransition	\N	\N
3325	9	6	13	4	f	f	WorkflowTransition	\N	\N
3326	9	6	14	4	f	f	WorkflowTransition	\N	\N
3327	9	6	15	4	f	f	WorkflowTransition	\N	\N
3328	9	7	14	4	f	f	WorkflowTransition	\N	\N
3329	9	7	15	4	f	f	WorkflowTransition	\N	\N
3330	9	8	14	4	f	f	WorkflowTransition	\N	\N
3331	9	8	15	4	f	f	WorkflowTransition	\N	\N
3332	9	9	14	4	f	f	WorkflowTransition	\N	\N
3333	9	9	15	4	f	f	WorkflowTransition	\N	\N
3334	9	10	14	4	f	f	WorkflowTransition	\N	\N
3335	9	10	15	4	f	f	WorkflowTransition	\N	\N
3336	9	11	14	4	f	f	WorkflowTransition	\N	\N
3337	9	11	15	4	f	f	WorkflowTransition	\N	\N
3338	9	12	14	4	f	f	WorkflowTransition	\N	\N
3339	9	12	15	4	f	f	WorkflowTransition	\N	\N
3340	9	13	6	4	f	f	WorkflowTransition	\N	\N
3341	9	13	14	4	f	f	WorkflowTransition	\N	\N
3342	9	13	15	4	f	f	WorkflowTransition	\N	\N
3343	9	14	6	4	f	f	WorkflowTransition	\N	\N
3344	9	14	15	4	f	f	WorkflowTransition	\N	\N
3345	9	15	6	4	f	f	WorkflowTransition	\N	\N
3346	9	6	5	4	f	f	WorkflowTransition	\N	\N
3347	9	7	8	4	f	f	WorkflowTransition	\N	\N
3348	9	7	9	4	f	f	WorkflowTransition	\N	\N
3349	9	7	10	4	f	f	WorkflowTransition	\N	\N
3350	9	7	11	4	f	f	WorkflowTransition	\N	\N
3351	9	7	12	4	f	f	WorkflowTransition	\N	\N
3352	9	7	13	4	f	f	WorkflowTransition	\N	\N
3353	9	8	9	4	f	f	WorkflowTransition	\N	\N
3354	9	8	10	4	f	f	WorkflowTransition	\N	\N
3355	9	8	11	4	f	f	WorkflowTransition	\N	\N
3356	9	8	12	4	f	f	WorkflowTransition	\N	\N
3357	9	8	13	4	f	f	WorkflowTransition	\N	\N
3358	9	9	10	4	f	f	WorkflowTransition	\N	\N
3359	9	9	11	4	f	f	WorkflowTransition	\N	\N
3360	9	9	12	4	f	f	WorkflowTransition	\N	\N
3361	9	9	13	4	f	f	WorkflowTransition	\N	\N
3362	9	10	11	4	f	f	WorkflowTransition	\N	\N
3363	9	10	12	4	f	f	WorkflowTransition	\N	\N
3364	9	10	13	4	f	f	WorkflowTransition	\N	\N
3365	9	11	12	4	f	f	WorkflowTransition	\N	\N
3366	9	11	13	4	f	f	WorkflowTransition	\N	\N
3367	9	12	13	4	f	f	WorkflowTransition	\N	\N
3368	9	11	6	4	f	f	WorkflowTransition	\N	\N
3369	9	7	6	4	f	f	WorkflowTransition	\N	\N
3370	9	8	6	4	f	f	WorkflowTransition	\N	\N
3371	9	8	7	4	f	f	WorkflowTransition	\N	\N
3372	9	9	6	4	f	f	WorkflowTransition	\N	\N
3373	9	9	7	4	f	f	WorkflowTransition	\N	\N
3374	9	9	8	4	f	f	WorkflowTransition	\N	\N
3375	9	10	6	4	f	f	WorkflowTransition	\N	\N
3376	9	10	7	4	f	f	WorkflowTransition	\N	\N
3377	9	10	8	4	f	f	WorkflowTransition	\N	\N
3378	9	10	9	4	f	f	WorkflowTransition	\N	\N
3379	9	11	7	4	f	f	WorkflowTransition	\N	\N
3380	9	11	8	4	f	f	WorkflowTransition	\N	\N
3381	9	11	9	4	f	f	WorkflowTransition	\N	\N
3382	9	11	10	4	f	f	WorkflowTransition	\N	\N
3393	9	12	0	4	f	f	WorkflowPermission	10	required
3395	9	12	0	4	f	f	WorkflowPermission	11	required
3396	9	12	0	4	f	f	WorkflowPermission	12	required
3397	9	12	0	4	f	f	WorkflowPermission	14	required
4902	11	12	0	5	f	f	WorkflowPermission	48	required
4903	11	12	0	5	f	f	WorkflowPermission	9	required
4904	11	12	0	5	f	f	WorkflowPermission	46	required
4905	11	12	0	5	f	f	WorkflowPermission	47	required
4906	11	13	0	5	f	f	WorkflowPermission	48	readonly
4907	11	13	0	5	f	f	WorkflowPermission	9	readonly
4908	11	13	0	5	f	f	WorkflowPermission	46	readonly
4909	11	13	0	5	f	f	WorkflowPermission	47	readonly
4910	11	14	0	5	f	f	WorkflowPermission	project_id	readonly
4911	11	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
4912	11	14	0	5	f	f	WorkflowPermission	subject	readonly
4913	11	14	0	5	f	f	WorkflowPermission	priority_id	readonly
4914	11	14	0	5	f	f	WorkflowPermission	is_private	readonly
4915	11	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4916	11	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4917	11	14	0	5	f	f	WorkflowPermission	description	readonly
4918	11	14	0	5	f	f	WorkflowPermission	2	readonly
4919	11	14	0	5	f	f	WorkflowPermission	3	readonly
4920	11	14	0	5	f	f	WorkflowPermission	4	readonly
4921	11	14	0	5	f	f	WorkflowPermission	5	readonly
4922	11	14	0	5	f	f	WorkflowPermission	7	readonly
3425	9	13	0	4	f	f	WorkflowPermission	10	readonly
4923	11	14	0	5	f	f	WorkflowPermission	48	readonly
3427	9	13	0	4	f	f	WorkflowPermission	11	readonly
3428	9	13	0	4	f	f	WorkflowPermission	12	readonly
3429	9	13	0	4	f	f	WorkflowPermission	14	readonly
4924	11	14	0	5	f	f	WorkflowPermission	9	readonly
4925	11	14	0	5	f	f	WorkflowPermission	34	readonly
4926	11	14	0	5	f	f	WorkflowPermission	35	readonly
4927	11	14	0	5	f	f	WorkflowPermission	36	readonly
4928	11	14	0	5	f	f	WorkflowPermission	37	readonly
4929	11	14	0	5	f	f	WorkflowPermission	38	readonly
4930	11	14	0	5	f	f	WorkflowPermission	39	readonly
4931	11	14	0	5	f	f	WorkflowPermission	40	readonly
4932	11	14	0	5	f	f	WorkflowPermission	41	readonly
4933	11	14	0	5	f	f	WorkflowPermission	42	readonly
4934	11	14	0	5	f	f	WorkflowPermission	43	readonly
4935	11	14	0	5	f	f	WorkflowPermission	44	readonly
4936	11	14	0	5	f	f	WorkflowPermission	45	readonly
4937	11	14	0	5	f	f	WorkflowPermission	25	readonly
4938	11	14	0	5	f	f	WorkflowPermission	46	readonly
4939	11	14	0	5	f	f	WorkflowPermission	47	readonly
4940	11	14	0	5	f	f	WorkflowPermission	26	readonly
4941	11	14	0	5	f	f	WorkflowPermission	27	readonly
4942	11	14	0	5	f	f	WorkflowPermission	28	readonly
4943	11	14	0	5	f	f	WorkflowPermission	29	readonly
4944	11	15	0	5	f	f	WorkflowPermission	48	readonly
4945	11	15	0	5	f	f	WorkflowPermission	9	readonly
4946	11	15	0	5	f	f	WorkflowPermission	46	readonly
4947	11	15	0	5	f	f	WorkflowPermission	47	readonly
4948	11	4	6	5	f	f	WorkflowTransition	\N	\N
4949	11	6	4	5	f	f	WorkflowTransition	\N	\N
4950	11	6	7	5	f	f	WorkflowTransition	\N	\N
4951	11	6	8	5	f	f	WorkflowTransition	\N	\N
4952	11	6	9	5	f	f	WorkflowTransition	\N	\N
4953	11	6	10	5	f	f	WorkflowTransition	\N	\N
4954	11	6	11	5	f	f	WorkflowTransition	\N	\N
4955	11	6	12	5	f	f	WorkflowTransition	\N	\N
4956	11	6	15	5	f	f	WorkflowTransition	\N	\N
3461	9	14	0	4	f	f	WorkflowPermission	10	readonly
4957	11	7	6	5	f	f	WorkflowTransition	\N	\N
3463	9	14	0	4	f	f	WorkflowPermission	11	readonly
3464	9	14	0	4	f	f	WorkflowPermission	12	readonly
3465	9	14	0	4	f	f	WorkflowPermission	14	readonly
4958	11	7	8	5	f	f	WorkflowTransition	\N	\N
4959	11	7	9	5	f	f	WorkflowTransition	\N	\N
4960	11	7	10	5	f	f	WorkflowTransition	\N	\N
4961	11	7	11	5	f	f	WorkflowTransition	\N	\N
4962	11	7	12	5	f	f	WorkflowTransition	\N	\N
4963	11	7	15	5	f	f	WorkflowTransition	\N	\N
4964	11	8	6	5	f	f	WorkflowTransition	\N	\N
4965	11	8	7	5	f	f	WorkflowTransition	\N	\N
4966	11	8	9	5	f	f	WorkflowTransition	\N	\N
4967	11	8	10	5	f	f	WorkflowTransition	\N	\N
4968	11	8	11	5	f	f	WorkflowTransition	\N	\N
4969	11	8	12	5	f	f	WorkflowTransition	\N	\N
4970	11	8	15	5	f	f	WorkflowTransition	\N	\N
4971	11	9	6	5	f	f	WorkflowTransition	\N	\N
4972	11	9	7	5	f	f	WorkflowTransition	\N	\N
4973	11	9	8	5	f	f	WorkflowTransition	\N	\N
4974	11	9	10	5	f	f	WorkflowTransition	\N	\N
4975	11	9	11	5	f	f	WorkflowTransition	\N	\N
4976	11	9	12	5	f	f	WorkflowTransition	\N	\N
4977	11	9	15	5	f	f	WorkflowTransition	\N	\N
4978	11	10	6	5	f	f	WorkflowTransition	\N	\N
4979	11	10	7	5	f	f	WorkflowTransition	\N	\N
4980	11	10	8	5	f	f	WorkflowTransition	\N	\N
4981	11	10	9	5	f	f	WorkflowTransition	\N	\N
4982	11	10	11	5	f	f	WorkflowTransition	\N	\N
4983	11	10	12	5	f	f	WorkflowTransition	\N	\N
4984	11	10	15	5	f	f	WorkflowTransition	\N	\N
4985	11	11	6	5	f	f	WorkflowTransition	\N	\N
4986	11	11	7	5	f	f	WorkflowTransition	\N	\N
4987	11	11	8	5	f	f	WorkflowTransition	\N	\N
4988	11	11	9	5	f	f	WorkflowTransition	\N	\N
3497	9	15	0	4	f	f	WorkflowPermission	10	readonly
4989	11	11	10	5	f	f	WorkflowTransition	\N	\N
3499	9	15	0	4	f	f	WorkflowPermission	11	readonly
3500	9	15	0	4	f	f	WorkflowPermission	12	readonly
3501	9	15	0	4	f	f	WorkflowPermission	14	readonly
4990	11	11	12	5	f	f	WorkflowTransition	\N	\N
4991	11	4	15	5	f	f	WorkflowTransition	\N	\N
4992	11	11	15	5	f	f	WorkflowTransition	\N	\N
4993	11	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
4994	11	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
4995	11	12	0	5	f	f	WorkflowPermission	2	required
4996	11	12	0	5	f	f	WorkflowPermission	3	required
4997	11	12	0	5	f	f	WorkflowPermission	4	required
4998	11	12	0	5	f	f	WorkflowPermission	5	required
4999	11	12	0	5	f	f	WorkflowPermission	7	required
5000	11	12	0	5	f	f	WorkflowPermission	23	required
5001	11	12	0	5	f	f	WorkflowPermission	34	required
5002	11	12	0	5	f	f	WorkflowPermission	35	required
5003	11	12	0	5	f	f	WorkflowPermission	36	required
5004	11	12	0	5	f	f	WorkflowPermission	37	required
3517	9	14	4	5	f	f	WorkflowTransition	\N	\N
3518	9	15	4	5	f	f	WorkflowTransition	\N	\N
3519	9	4	5	5	f	f	WorkflowTransition	\N	\N
3520	9	4	6	5	f	f	WorkflowTransition	\N	\N
3521	9	4	14	5	f	f	WorkflowTransition	\N	\N
3522	9	4	15	5	f	f	WorkflowTransition	\N	\N
3523	9	5	6	5	f	f	WorkflowTransition	\N	\N
3524	9	5	14	5	f	f	WorkflowTransition	\N	\N
3525	9	5	15	5	f	f	WorkflowTransition	\N	\N
3526	9	6	7	5	f	f	WorkflowTransition	\N	\N
3527	9	6	8	5	f	f	WorkflowTransition	\N	\N
3528	9	6	9	5	f	f	WorkflowTransition	\N	\N
3529	9	6	10	5	f	f	WorkflowTransition	\N	\N
3530	9	6	11	5	f	f	WorkflowTransition	\N	\N
3531	9	6	12	5	f	f	WorkflowTransition	\N	\N
3532	9	6	14	5	f	f	WorkflowTransition	\N	\N
3533	9	6	15	5	f	f	WorkflowTransition	\N	\N
3534	9	7	14	5	f	f	WorkflowTransition	\N	\N
3535	9	7	15	5	f	f	WorkflowTransition	\N	\N
3536	9	8	14	5	f	f	WorkflowTransition	\N	\N
3537	9	8	15	5	f	f	WorkflowTransition	\N	\N
3538	9	9	14	5	f	f	WorkflowTransition	\N	\N
3539	9	9	15	5	f	f	WorkflowTransition	\N	\N
3540	9	10	14	5	f	f	WorkflowTransition	\N	\N
3541	9	10	15	5	f	f	WorkflowTransition	\N	\N
3542	9	11	14	5	f	f	WorkflowTransition	\N	\N
3543	9	11	15	5	f	f	WorkflowTransition	\N	\N
3544	9	12	14	5	f	f	WorkflowTransition	\N	\N
3545	9	12	15	5	f	f	WorkflowTransition	\N	\N
3546	9	14	6	5	f	f	WorkflowTransition	\N	\N
3547	9	14	15	5	f	f	WorkflowTransition	\N	\N
3548	9	15	6	5	f	f	WorkflowTransition	\N	\N
3549	9	6	5	5	f	f	WorkflowTransition	\N	\N
3550	9	7	8	5	f	f	WorkflowTransition	\N	\N
3551	9	7	9	5	f	f	WorkflowTransition	\N	\N
3552	9	7	10	5	f	f	WorkflowTransition	\N	\N
3553	9	7	11	5	f	f	WorkflowTransition	\N	\N
3554	9	7	12	5	f	f	WorkflowTransition	\N	\N
3555	9	8	9	5	f	f	WorkflowTransition	\N	\N
3556	9	8	10	5	f	f	WorkflowTransition	\N	\N
3557	9	8	11	5	f	f	WorkflowTransition	\N	\N
3558	9	8	12	5	f	f	WorkflowTransition	\N	\N
3559	9	9	10	5	f	f	WorkflowTransition	\N	\N
3560	9	9	11	5	f	f	WorkflowTransition	\N	\N
3561	9	9	12	5	f	f	WorkflowTransition	\N	\N
3562	9	10	11	5	f	f	WorkflowTransition	\N	\N
3563	9	10	12	5	f	f	WorkflowTransition	\N	\N
3564	9	11	12	5	f	f	WorkflowTransition	\N	\N
3565	9	11	6	5	f	f	WorkflowTransition	\N	\N
3566	9	7	6	5	f	f	WorkflowTransition	\N	\N
3567	9	8	6	5	f	f	WorkflowTransition	\N	\N
3568	9	9	6	5	f	f	WorkflowTransition	\N	\N
3569	9	9	7	5	f	f	WorkflowTransition	\N	\N
3570	9	9	8	5	f	f	WorkflowTransition	\N	\N
3571	9	10	6	5	f	f	WorkflowTransition	\N	\N
3572	9	10	7	5	f	f	WorkflowTransition	\N	\N
3573	9	10	8	5	f	f	WorkflowTransition	\N	\N
3574	9	10	9	5	f	f	WorkflowTransition	\N	\N
3575	9	11	7	5	f	f	WorkflowTransition	\N	\N
3576	9	11	8	5	f	f	WorkflowTransition	\N	\N
3577	9	11	9	5	f	f	WorkflowTransition	\N	\N
3578	9	11	10	5	f	f	WorkflowTransition	\N	\N
3579	9	8	7	5	f	f	WorkflowTransition	\N	\N
5005	11	12	0	5	f	f	WorkflowPermission	38	required
5006	11	12	0	5	f	f	WorkflowPermission	39	required
5007	11	12	0	5	f	f	WorkflowPermission	40	required
5008	11	12	0	5	f	f	WorkflowPermission	41	required
5009	11	12	0	5	f	f	WorkflowPermission	42	required
5010	11	12	0	5	f	f	WorkflowPermission	43	required
5011	11	12	0	5	f	f	WorkflowPermission	44	required
5012	11	12	0	5	f	f	WorkflowPermission	45	required
5013	11	12	0	5	f	f	WorkflowPermission	25	required
5014	11	13	0	5	f	f	WorkflowPermission	project_id	readonly
3590	9	12	0	5	f	f	WorkflowPermission	10	required
5015	11	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
3592	9	12	0	5	f	f	WorkflowPermission	11	required
3593	9	12	0	5	f	f	WorkflowPermission	12	required
3594	9	12	0	5	f	f	WorkflowPermission	14	required
5016	11	13	0	5	f	f	WorkflowPermission	subject	readonly
5017	11	13	0	5	f	f	WorkflowPermission	priority_id	readonly
5018	11	13	0	5	f	f	WorkflowPermission	is_private	readonly
5019	11	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
5020	11	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
5021	11	13	0	5	f	f	WorkflowPermission	description	readonly
5022	11	13	0	5	f	f	WorkflowPermission	2	readonly
5023	11	13	0	5	f	f	WorkflowPermission	3	readonly
5024	11	13	0	5	f	f	WorkflowPermission	4	readonly
5025	11	13	0	5	f	f	WorkflowPermission	5	readonly
5026	11	13	0	5	f	f	WorkflowPermission	7	readonly
5027	11	13	0	5	f	f	WorkflowPermission	23	readonly
5028	11	13	0	5	f	f	WorkflowPermission	34	readonly
5029	11	13	0	5	f	f	WorkflowPermission	35	readonly
5030	11	13	0	5	f	f	WorkflowPermission	36	readonly
5031	11	13	0	5	f	f	WorkflowPermission	37	readonly
5032	11	13	0	5	f	f	WorkflowPermission	38	readonly
5033	11	13	0	5	f	f	WorkflowPermission	39	readonly
5034	11	13	0	5	f	f	WorkflowPermission	40	readonly
5035	11	13	0	5	f	f	WorkflowPermission	41	readonly
5036	11	13	0	5	f	f	WorkflowPermission	42	readonly
5037	11	13	0	5	f	f	WorkflowPermission	43	readonly
5038	11	13	0	5	f	f	WorkflowPermission	44	readonly
5039	11	13	0	5	f	f	WorkflowPermission	45	readonly
5040	11	13	0	5	f	f	WorkflowPermission	25	readonly
5041	11	13	0	5	f	f	WorkflowPermission	70	readonly
5042	11	13	0	5	f	f	WorkflowPermission	69	readonly
3622	9	13	0	5	f	f	WorkflowPermission	10	readonly
5043	11	13	0	5	f	f	WorkflowPermission	26	readonly
3624	9	13	0	5	f	f	WorkflowPermission	11	readonly
3625	9	13	0	5	f	f	WorkflowPermission	12	readonly
3626	9	13	0	5	f	f	WorkflowPermission	14	readonly
5044	11	13	0	5	f	f	WorkflowPermission	27	readonly
5045	11	13	0	5	f	f	WorkflowPermission	28	readonly
5046	11	13	0	5	f	f	WorkflowPermission	29	readonly
5047	11	13	0	5	f	f	WorkflowPermission	71	readonly
5048	11	13	0	5	f	f	WorkflowPermission	72	readonly
5049	11	15	0	5	f	f	WorkflowPermission	project_id	readonly
5050	11	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
5051	11	15	0	5	f	f	WorkflowPermission	subject	readonly
5052	11	15	0	5	f	f	WorkflowPermission	priority_id	readonly
5053	11	15	0	5	f	f	WorkflowPermission	is_private	readonly
5054	11	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
5055	11	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
5056	11	15	0	5	f	f	WorkflowPermission	description	readonly
5057	11	15	0	5	f	f	WorkflowPermission	2	readonly
5058	11	15	0	5	f	f	WorkflowPermission	3	readonly
5059	11	15	0	5	f	f	WorkflowPermission	4	readonly
5060	11	15	0	5	f	f	WorkflowPermission	5	readonly
5061	11	15	0	5	f	f	WorkflowPermission	7	readonly
5062	11	15	0	5	f	f	WorkflowPermission	23	readonly
5063	11	15	0	5	f	f	WorkflowPermission	34	readonly
5064	11	15	0	5	f	f	WorkflowPermission	35	readonly
5065	11	15	0	5	f	f	WorkflowPermission	36	readonly
5066	11	15	0	5	f	f	WorkflowPermission	37	readonly
5067	11	15	0	5	f	f	WorkflowPermission	38	readonly
5068	11	15	0	5	f	f	WorkflowPermission	39	readonly
5069	11	15	0	5	f	f	WorkflowPermission	40	readonly
5070	11	15	0	5	f	f	WorkflowPermission	41	readonly
5071	11	15	0	5	f	f	WorkflowPermission	42	readonly
5072	11	15	0	5	f	f	WorkflowPermission	43	readonly
5073	11	15	0	5	f	f	WorkflowPermission	44	readonly
5074	11	15	0	5	f	f	WorkflowPermission	45	readonly
3658	9	14	0	5	f	f	WorkflowPermission	10	readonly
5075	11	15	0	5	f	f	WorkflowPermission	25	readonly
3660	9	14	0	5	f	f	WorkflowPermission	11	readonly
3661	9	14	0	5	f	f	WorkflowPermission	12	readonly
3662	9	14	0	5	f	f	WorkflowPermission	14	readonly
5076	11	15	0	5	f	f	WorkflowPermission	70	readonly
5077	11	15	0	5	f	f	WorkflowPermission	69	readonly
5078	11	15	0	5	f	f	WorkflowPermission	26	readonly
5079	11	15	0	5	f	f	WorkflowPermission	27	readonly
5080	11	15	0	5	f	f	WorkflowPermission	28	readonly
5081	11	15	0	5	f	f	WorkflowPermission	29	readonly
5082	11	15	0	5	f	f	WorkflowPermission	71	readonly
5083	11	15	0	5	f	f	WorkflowPermission	72	readonly
5416	12	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
5417	12	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
5418	12	12	0	4	f	f	WorkflowPermission	2	required
5419	12	12	0	4	f	f	WorkflowPermission	3	required
5420	12	12	0	4	f	f	WorkflowPermission	4	required
5421	12	12	0	4	f	f	WorkflowPermission	5	required
5422	12	12	0	4	f	f	WorkflowPermission	7	required
5423	12	12	0	4	f	f	WorkflowPermission	9	required
5424	12	12	0	4	f	f	WorkflowPermission	23	required
5425	12	12	0	4	f	f	WorkflowPermission	73	required
5426	12	12	0	4	f	f	WorkflowPermission	74	required
5427	12	12	0	4	f	f	WorkflowPermission	51	required
5428	12	12	0	4	f	f	WorkflowPermission	52	required
5429	12	12	0	4	f	f	WorkflowPermission	53	required
5430	12	12	0	4	f	f	WorkflowPermission	54	required
5431	12	12	0	4	f	f	WorkflowPermission	25	required
5432	12	12	0	4	f	f	WorkflowPermission	46	required
5433	12	12	0	4	f	f	WorkflowPermission	47	required
5434	12	13	0	4	f	f	WorkflowPermission	project_id	readonly
5435	12	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
5436	12	13	0	4	f	f	WorkflowPermission	subject	readonly
5437	12	13	0	4	f	f	WorkflowPermission	priority_id	readonly
5438	12	13	0	4	f	f	WorkflowPermission	is_private	readonly
3694	9	15	0	5	f	f	WorkflowPermission	10	readonly
5439	12	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3696	9	15	0	5	f	f	WorkflowPermission	11	readonly
3697	9	15	0	5	f	f	WorkflowPermission	12	readonly
3698	9	15	0	5	f	f	WorkflowPermission	14	readonly
5440	12	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
5441	12	13	0	4	f	f	WorkflowPermission	description	readonly
5442	12	13	0	4	f	f	WorkflowPermission	2	readonly
5443	12	13	0	4	f	f	WorkflowPermission	3	readonly
5444	12	13	0	4	f	f	WorkflowPermission	4	readonly
5445	12	13	0	4	f	f	WorkflowPermission	5	readonly
5446	12	13	0	4	f	f	WorkflowPermission	7	readonly
5447	12	13	0	4	f	f	WorkflowPermission	9	readonly
5448	12	13	0	4	f	f	WorkflowPermission	23	readonly
5449	12	13	0	4	f	f	WorkflowPermission	73	readonly
5450	12	13	0	4	f	f	WorkflowPermission	74	readonly
5451	12	13	0	4	f	f	WorkflowPermission	51	readonly
5452	12	13	0	4	f	f	WorkflowPermission	52	readonly
5453	12	13	0	4	f	f	WorkflowPermission	53	readonly
5454	12	13	0	4	f	f	WorkflowPermission	54	readonly
3714	9	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
3715	9	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
3716	9	12	0	4	f	f	WorkflowPermission	2	required
3717	9	12	0	4	f	f	WorkflowPermission	3	required
3718	9	12	0	4	f	f	WorkflowPermission	4	required
3719	9	12	0	4	f	f	WorkflowPermission	5	required
3720	9	12	0	4	f	f	WorkflowPermission	6	required
3721	9	12	0	4	f	f	WorkflowPermission	7	required
3722	9	12	0	4	f	f	WorkflowPermission	8	required
3723	9	12	0	4	f	f	WorkflowPermission	9	required
3724	9	12	0	4	f	f	WorkflowPermission	13	required
3725	9	12	0	4	f	f	WorkflowPermission	63	required
3726	9	12	0	4	f	f	WorkflowPermission	64	required
3727	9	12	0	4	f	f	WorkflowPermission	65	required
3728	9	12	0	4	f	f	WorkflowPermission	15	required
3729	9	12	0	4	f	f	WorkflowPermission	16	required
3730	9	12	0	4	f	f	WorkflowPermission	17	required
3731	9	12	0	4	f	f	WorkflowPermission	18	required
3732	9	12	0	4	f	f	WorkflowPermission	19	required
3733	9	12	0	4	f	f	WorkflowPermission	20	required
3734	9	12	0	4	f	f	WorkflowPermission	21	required
3735	9	12	0	4	f	f	WorkflowPermission	22	required
3736	9	12	0	4	f	f	WorkflowPermission	23	required
3737	9	12	0	4	f	f	WorkflowPermission	24	required
3738	9	12	0	4	f	f	WorkflowPermission	61	required
3739	9	12	0	4	f	f	WorkflowPermission	66	required
3740	9	12	0	4	f	f	WorkflowPermission	67	required
3741	9	12	0	4	f	f	WorkflowPermission	68	required
3742	9	12	0	4	f	f	WorkflowPermission	25	required
3743	9	13	0	4	f	f	WorkflowPermission	project_id	readonly
3744	9	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
3745	9	13	0	4	f	f	WorkflowPermission	subject	readonly
3746	9	13	0	4	f	f	WorkflowPermission	priority_id	readonly
3747	9	13	0	4	f	f	WorkflowPermission	is_private	readonly
3748	9	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3749	9	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3750	9	13	0	4	f	f	WorkflowPermission	description	readonly
3751	9	13	0	4	f	f	WorkflowPermission	2	readonly
3752	9	13	0	4	f	f	WorkflowPermission	3	readonly
3753	9	13	0	4	f	f	WorkflowPermission	4	readonly
3754	9	13	0	4	f	f	WorkflowPermission	5	readonly
3755	9	13	0	4	f	f	WorkflowPermission	6	readonly
3756	9	13	0	4	f	f	WorkflowPermission	7	readonly
3757	9	13	0	4	f	f	WorkflowPermission	8	readonly
3758	9	13	0	4	f	f	WorkflowPermission	9	readonly
3759	9	13	0	4	f	f	WorkflowPermission	13	readonly
3760	9	13	0	4	f	f	WorkflowPermission	63	readonly
3761	9	13	0	4	f	f	WorkflowPermission	64	readonly
3762	9	13	0	4	f	f	WorkflowPermission	65	readonly
3763	9	13	0	4	f	f	WorkflowPermission	15	readonly
3764	9	13	0	4	f	f	WorkflowPermission	16	readonly
3765	9	13	0	4	f	f	WorkflowPermission	17	readonly
3766	9	13	0	4	f	f	WorkflowPermission	18	readonly
3767	9	13	0	4	f	f	WorkflowPermission	19	readonly
3768	9	13	0	4	f	f	WorkflowPermission	20	readonly
3769	9	13	0	4	f	f	WorkflowPermission	21	readonly
3770	9	13	0	4	f	f	WorkflowPermission	22	readonly
3771	9	13	0	4	f	f	WorkflowPermission	23	readonly
3772	9	13	0	4	f	f	WorkflowPermission	24	readonly
3773	9	13	0	4	f	f	WorkflowPermission	61	readonly
3774	9	13	0	4	f	f	WorkflowPermission	66	readonly
3775	9	13	0	4	f	f	WorkflowPermission	67	readonly
3776	9	13	0	4	f	f	WorkflowPermission	68	readonly
3777	9	13	0	4	f	f	WorkflowPermission	25	readonly
3778	9	13	0	4	f	f	WorkflowPermission	46	readonly
3779	9	13	0	4	f	f	WorkflowPermission	47	readonly
3780	9	13	0	4	f	f	WorkflowPermission	70	readonly
3781	9	13	0	4	f	f	WorkflowPermission	69	readonly
3782	9	13	0	4	f	f	WorkflowPermission	26	readonly
3783	9	13	0	4	f	f	WorkflowPermission	27	readonly
3784	9	13	0	4	f	f	WorkflowPermission	28	readonly
3785	9	13	0	4	f	f	WorkflowPermission	29	readonly
3786	9	13	0	4	f	f	WorkflowPermission	71	readonly
3787	9	13	0	4	f	f	WorkflowPermission	72	readonly
3788	9	14	0	4	f	f	WorkflowPermission	project_id	readonly
3789	9	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
3790	9	14	0	4	f	f	WorkflowPermission	subject	readonly
3791	9	14	0	4	f	f	WorkflowPermission	priority_id	readonly
3792	9	14	0	4	f	f	WorkflowPermission	is_private	readonly
3793	9	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3794	9	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3795	9	14	0	4	f	f	WorkflowPermission	description	readonly
3796	9	14	0	4	f	f	WorkflowPermission	2	readonly
3797	9	14	0	4	f	f	WorkflowPermission	3	readonly
3798	9	14	0	4	f	f	WorkflowPermission	4	readonly
3799	9	14	0	4	f	f	WorkflowPermission	5	readonly
3800	9	14	0	4	f	f	WorkflowPermission	6	readonly
3801	9	14	0	4	f	f	WorkflowPermission	7	readonly
3802	9	14	0	4	f	f	WorkflowPermission	8	readonly
3803	9	14	0	4	f	f	WorkflowPermission	9	readonly
3804	9	14	0	4	f	f	WorkflowPermission	13	readonly
3805	9	14	0	4	f	f	WorkflowPermission	63	readonly
3806	9	14	0	4	f	f	WorkflowPermission	64	readonly
3807	9	14	0	4	f	f	WorkflowPermission	65	readonly
3808	9	14	0	4	f	f	WorkflowPermission	15	readonly
3809	9	14	0	4	f	f	WorkflowPermission	16	readonly
3810	9	14	0	4	f	f	WorkflowPermission	17	readonly
3811	9	14	0	4	f	f	WorkflowPermission	18	readonly
3812	9	14	0	4	f	f	WorkflowPermission	19	readonly
3813	9	14	0	4	f	f	WorkflowPermission	20	readonly
3814	9	14	0	4	f	f	WorkflowPermission	21	readonly
3815	9	14	0	4	f	f	WorkflowPermission	22	readonly
3816	9	14	0	4	f	f	WorkflowPermission	23	readonly
3817	9	14	0	4	f	f	WorkflowPermission	24	readonly
3818	9	14	0	4	f	f	WorkflowPermission	61	readonly
3819	9	14	0	4	f	f	WorkflowPermission	66	readonly
3820	9	14	0	4	f	f	WorkflowPermission	67	readonly
3821	9	14	0	4	f	f	WorkflowPermission	68	readonly
3822	9	14	0	4	f	f	WorkflowPermission	25	readonly
3823	9	14	0	4	f	f	WorkflowPermission	46	readonly
3824	9	14	0	4	f	f	WorkflowPermission	47	readonly
3825	9	14	0	4	f	f	WorkflowPermission	70	readonly
3826	9	14	0	4	f	f	WorkflowPermission	69	readonly
3827	9	14	0	4	f	f	WorkflowPermission	26	readonly
3828	9	14	0	4	f	f	WorkflowPermission	27	readonly
3829	9	14	0	4	f	f	WorkflowPermission	28	readonly
3830	9	14	0	4	f	f	WorkflowPermission	29	readonly
3831	9	14	0	4	f	f	WorkflowPermission	71	readonly
3832	9	14	0	4	f	f	WorkflowPermission	72	readonly
3833	9	15	0	4	f	f	WorkflowPermission	project_id	readonly
3834	9	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
3835	9	15	0	4	f	f	WorkflowPermission	subject	readonly
3836	9	15	0	4	f	f	WorkflowPermission	priority_id	readonly
3837	9	15	0	4	f	f	WorkflowPermission	is_private	readonly
3838	9	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3839	9	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3840	9	15	0	4	f	f	WorkflowPermission	description	readonly
3841	9	15	0	4	f	f	WorkflowPermission	2	readonly
3842	9	15	0	4	f	f	WorkflowPermission	3	readonly
3843	9	15	0	4	f	f	WorkflowPermission	4	readonly
3844	9	15	0	4	f	f	WorkflowPermission	5	readonly
3845	9	15	0	4	f	f	WorkflowPermission	6	readonly
3846	9	15	0	4	f	f	WorkflowPermission	7	readonly
3847	9	15	0	4	f	f	WorkflowPermission	8	readonly
3848	9	15	0	4	f	f	WorkflowPermission	9	readonly
3849	9	15	0	4	f	f	WorkflowPermission	13	readonly
3850	9	15	0	4	f	f	WorkflowPermission	63	readonly
3851	9	15	0	4	f	f	WorkflowPermission	64	readonly
3852	9	15	0	4	f	f	WorkflowPermission	65	readonly
3853	9	15	0	4	f	f	WorkflowPermission	15	readonly
3854	9	15	0	4	f	f	WorkflowPermission	16	readonly
3855	9	15	0	4	f	f	WorkflowPermission	17	readonly
3856	9	15	0	4	f	f	WorkflowPermission	18	readonly
3857	9	15	0	4	f	f	WorkflowPermission	19	readonly
3858	9	15	0	4	f	f	WorkflowPermission	20	readonly
3859	9	15	0	4	f	f	WorkflowPermission	21	readonly
3860	9	15	0	4	f	f	WorkflowPermission	22	readonly
3861	9	15	0	4	f	f	WorkflowPermission	23	readonly
3862	9	15	0	4	f	f	WorkflowPermission	24	readonly
3863	9	15	0	4	f	f	WorkflowPermission	61	readonly
3864	9	15	0	4	f	f	WorkflowPermission	66	readonly
3865	9	15	0	4	f	f	WorkflowPermission	67	readonly
3866	9	15	0	4	f	f	WorkflowPermission	68	readonly
3867	9	15	0	4	f	f	WorkflowPermission	25	readonly
3868	9	15	0	4	f	f	WorkflowPermission	46	readonly
3869	9	15	0	4	f	f	WorkflowPermission	47	readonly
3870	9	15	0	4	f	f	WorkflowPermission	70	readonly
3871	9	15	0	4	f	f	WorkflowPermission	69	readonly
3872	9	15	0	4	f	f	WorkflowPermission	26	readonly
3873	9	15	0	4	f	f	WorkflowPermission	27	readonly
3874	9	15	0	4	f	f	WorkflowPermission	28	readonly
3875	9	15	0	4	f	f	WorkflowPermission	29	readonly
3876	9	15	0	4	f	f	WorkflowPermission	71	readonly
3877	9	15	0	4	f	f	WorkflowPermission	72	readonly
5084	12	6	4	4	f	f	WorkflowTransition	\N	\N
5085	12	7	6	4	f	f	WorkflowTransition	\N	\N
5086	12	8	6	4	f	f	WorkflowTransition	\N	\N
5087	12	8	7	4	f	f	WorkflowTransition	\N	\N
5088	12	9	6	4	f	f	WorkflowTransition	\N	\N
5089	12	9	7	4	f	f	WorkflowTransition	\N	\N
5090	12	9	8	4	f	f	WorkflowTransition	\N	\N
3885	10	12	4	4	f	f	WorkflowTransition	\N	\N
3886	10	13	4	4	f	f	WorkflowTransition	\N	\N
3887	10	15	4	4	f	f	WorkflowTransition	\N	\N
3888	10	4	6	4	f	f	WorkflowTransition	\N	\N
3889	10	4	15	4	f	f	WorkflowTransition	\N	\N
3890	10	6	7	4	f	f	WorkflowTransition	\N	\N
3891	10	6	8	4	f	f	WorkflowTransition	\N	\N
3892	10	6	9	4	f	f	WorkflowTransition	\N	\N
3893	10	6	10	4	f	f	WorkflowTransition	\N	\N
3894	10	6	11	4	f	f	WorkflowTransition	\N	\N
3895	10	6	12	4	f	f	WorkflowTransition	\N	\N
3896	10	6	13	4	f	f	WorkflowTransition	\N	\N
3897	10	6	15	4	f	f	WorkflowTransition	\N	\N
3898	10	7	15	4	f	f	WorkflowTransition	\N	\N
3899	10	8	15	4	f	f	WorkflowTransition	\N	\N
3900	10	9	15	4	f	f	WorkflowTransition	\N	\N
3901	10	10	15	4	f	f	WorkflowTransition	\N	\N
3902	10	11	15	4	f	f	WorkflowTransition	\N	\N
3903	10	12	15	4	f	f	WorkflowTransition	\N	\N
3904	10	13	6	4	f	f	WorkflowTransition	\N	\N
3905	10	13	15	4	f	f	WorkflowTransition	\N	\N
3906	10	15	6	4	f	f	WorkflowTransition	\N	\N
3907	10	7	8	4	f	f	WorkflowTransition	\N	\N
3908	10	7	9	4	f	f	WorkflowTransition	\N	\N
3909	10	7	10	4	f	f	WorkflowTransition	\N	\N
3910	10	7	11	4	f	f	WorkflowTransition	\N	\N
3911	10	7	12	4	f	f	WorkflowTransition	\N	\N
3912	10	7	13	4	f	f	WorkflowTransition	\N	\N
3913	10	8	9	4	f	f	WorkflowTransition	\N	\N
3914	10	8	10	4	f	f	WorkflowTransition	\N	\N
3915	10	8	11	4	f	f	WorkflowTransition	\N	\N
3916	10	8	12	4	f	f	WorkflowTransition	\N	\N
3917	10	8	13	4	f	f	WorkflowTransition	\N	\N
3918	10	9	10	4	f	f	WorkflowTransition	\N	\N
3919	10	9	11	4	f	f	WorkflowTransition	\N	\N
3920	10	9	12	4	f	f	WorkflowTransition	\N	\N
3921	10	9	13	4	f	f	WorkflowTransition	\N	\N
3922	10	10	11	4	f	f	WorkflowTransition	\N	\N
3923	10	10	12	4	f	f	WorkflowTransition	\N	\N
3924	10	10	13	4	f	f	WorkflowTransition	\N	\N
3925	10	11	12	4	f	f	WorkflowTransition	\N	\N
3926	10	11	13	4	f	f	WorkflowTransition	\N	\N
3927	10	12	13	4	f	f	WorkflowTransition	\N	\N
3928	10	11	6	4	f	f	WorkflowTransition	\N	\N
3929	10	12	0	4	f	f	WorkflowPermission	48	required
3930	10	12	0	4	f	f	WorkflowPermission	9	required
5091	12	10	6	4	f	f	WorkflowTransition	\N	\N
5092	12	10	7	4	f	f	WorkflowTransition	\N	\N
5093	12	10	8	4	f	f	WorkflowTransition	\N	\N
5094	12	10	9	4	f	f	WorkflowTransition	\N	\N
5095	12	11	7	4	f	f	WorkflowTransition	\N	\N
5096	12	11	8	4	f	f	WorkflowTransition	\N	\N
5097	12	11	9	4	f	f	WorkflowTransition	\N	\N
5098	12	11	10	4	f	f	WorkflowTransition	\N	\N
3940	10	12	0	4	f	f	WorkflowPermission	46	required
3941	10	12	0	4	f	f	WorkflowPermission	47	required
5106	12	12	0	4	f	f	WorkflowPermission	48	required
5108	12	12	4	4	f	f	WorkflowTransition	\N	\N
5109	12	13	4	4	f	f	WorkflowTransition	\N	\N
5110	12	15	4	4	f	f	WorkflowTransition	\N	\N
5111	12	4	6	4	f	f	WorkflowTransition	\N	\N
5112	12	4	15	4	f	f	WorkflowTransition	\N	\N
3955	10	13	0	4	f	f	WorkflowPermission	48	readonly
3956	10	13	0	4	f	f	WorkflowPermission	9	readonly
5113	12	6	7	4	f	f	WorkflowTransition	\N	\N
5114	12	6	8	4	f	f	WorkflowTransition	\N	\N
5115	12	6	9	4	f	f	WorkflowTransition	\N	\N
5116	12	6	10	4	f	f	WorkflowTransition	\N	\N
5117	12	6	11	4	f	f	WorkflowTransition	\N	\N
5118	12	6	12	4	f	f	WorkflowTransition	\N	\N
5119	12	6	13	4	f	f	WorkflowTransition	\N	\N
5120	12	6	15	4	f	f	WorkflowTransition	\N	\N
5121	12	7	15	4	f	f	WorkflowTransition	\N	\N
5122	12	8	15	4	f	f	WorkflowTransition	\N	\N
5123	12	9	15	4	f	f	WorkflowTransition	\N	\N
5124	12	10	15	4	f	f	WorkflowTransition	\N	\N
5125	12	11	15	4	f	f	WorkflowTransition	\N	\N
3970	10	13	0	4	f	f	WorkflowPermission	46	readonly
3971	10	13	0	4	f	f	WorkflowPermission	47	readonly
5126	12	12	15	4	f	f	WorkflowTransition	\N	\N
5127	12	13	6	4	f	f	WorkflowTransition	\N	\N
5128	12	13	15	4	f	f	WorkflowTransition	\N	\N
5129	12	15	6	4	f	f	WorkflowTransition	\N	\N
3976	10	14	0	4	f	f	WorkflowPermission	project_id	readonly
3977	10	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
3978	10	14	0	4	f	f	WorkflowPermission	subject	readonly
3979	10	14	0	4	f	f	WorkflowPermission	priority_id	readonly
3980	10	14	0	4	f	f	WorkflowPermission	is_private	readonly
3981	10	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
3982	10	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
3983	10	14	0	4	f	f	WorkflowPermission	description	readonly
3984	10	14	0	4	f	f	WorkflowPermission	2	readonly
3985	10	14	0	4	f	f	WorkflowPermission	3	readonly
3986	10	14	0	4	f	f	WorkflowPermission	4	readonly
3987	10	14	0	4	f	f	WorkflowPermission	5	readonly
3988	10	14	0	4	f	f	WorkflowPermission	7	readonly
3989	10	14	0	4	f	f	WorkflowPermission	48	readonly
3990	10	14	0	4	f	f	WorkflowPermission	9	readonly
3991	10	14	0	4	f	f	WorkflowPermission	34	readonly
3992	10	14	0	4	f	f	WorkflowPermission	35	readonly
3993	10	14	0	4	f	f	WorkflowPermission	36	readonly
3994	10	14	0	4	f	f	WorkflowPermission	37	readonly
3995	10	14	0	4	f	f	WorkflowPermission	38	readonly
3996	10	14	0	4	f	f	WorkflowPermission	39	readonly
3997	10	14	0	4	f	f	WorkflowPermission	40	readonly
3998	10	14	0	4	f	f	WorkflowPermission	41	readonly
3999	10	14	0	4	f	f	WorkflowPermission	42	readonly
4000	10	14	0	4	f	f	WorkflowPermission	43	readonly
4001	10	14	0	4	f	f	WorkflowPermission	44	readonly
4002	10	14	0	4	f	f	WorkflowPermission	45	readonly
4003	10	14	0	4	f	f	WorkflowPermission	25	readonly
4004	10	14	0	4	f	f	WorkflowPermission	46	readonly
4005	10	14	0	4	f	f	WorkflowPermission	47	readonly
4006	10	14	0	4	f	f	WorkflowPermission	26	readonly
4007	10	14	0	4	f	f	WorkflowPermission	27	readonly
4008	10	14	0	4	f	f	WorkflowPermission	28	readonly
4009	10	14	0	4	f	f	WorkflowPermission	29	readonly
5130	12	7	8	4	f	f	WorkflowTransition	\N	\N
5131	12	7	9	4	f	f	WorkflowTransition	\N	\N
5132	12	7	10	4	f	f	WorkflowTransition	\N	\N
5133	12	7	11	4	f	f	WorkflowTransition	\N	\N
5134	12	7	12	4	f	f	WorkflowTransition	\N	\N
5135	12	7	13	4	f	f	WorkflowTransition	\N	\N
5136	12	8	9	4	f	f	WorkflowTransition	\N	\N
5137	12	8	10	4	f	f	WorkflowTransition	\N	\N
5138	12	8	11	4	f	f	WorkflowTransition	\N	\N
5139	12	8	12	4	f	f	WorkflowTransition	\N	\N
5140	12	8	13	4	f	f	WorkflowTransition	\N	\N
5141	12	9	10	4	f	f	WorkflowTransition	\N	\N
5142	12	9	11	4	f	f	WorkflowTransition	\N	\N
4023	10	15	0	4	f	f	WorkflowPermission	48	readonly
4024	10	15	0	4	f	f	WorkflowPermission	9	readonly
5143	12	9	12	4	f	f	WorkflowTransition	\N	\N
5144	12	9	13	4	f	f	WorkflowTransition	\N	\N
5145	12	10	11	4	f	f	WorkflowTransition	\N	\N
5146	12	10	12	4	f	f	WorkflowTransition	\N	\N
5147	12	10	13	4	f	f	WorkflowTransition	\N	\N
5148	12	11	12	4	f	f	WorkflowTransition	\N	\N
5149	12	11	13	4	f	f	WorkflowTransition	\N	\N
5150	12	12	13	4	f	f	WorkflowTransition	\N	\N
5151	12	11	6	4	f	f	WorkflowTransition	\N	\N
5153	12	12	0	4	f	f	WorkflowPermission	49	required
5154	12	12	0	4	f	f	WorkflowPermission	50	required
4038	10	15	0	4	f	f	WorkflowPermission	46	readonly
4039	10	15	0	4	f	f	WorkflowPermission	47	readonly
5159	12	12	0	4	f	f	WorkflowPermission	55	required
5160	12	12	0	4	f	f	WorkflowPermission	56	required
4044	10	7	6	4	f	f	WorkflowTransition	\N	\N
4045	10	8	6	4	f	f	WorkflowTransition	\N	\N
4046	10	8	7	4	f	f	WorkflowTransition	\N	\N
4047	10	9	6	4	f	f	WorkflowTransition	\N	\N
4048	10	9	7	4	f	f	WorkflowTransition	\N	\N
4049	10	9	8	4	f	f	WorkflowTransition	\N	\N
4050	10	10	6	4	f	f	WorkflowTransition	\N	\N
4051	10	10	7	4	f	f	WorkflowTransition	\N	\N
4052	10	10	8	4	f	f	WorkflowTransition	\N	\N
4053	10	10	9	4	f	f	WorkflowTransition	\N	\N
4054	10	11	7	4	f	f	WorkflowTransition	\N	\N
4055	10	11	8	4	f	f	WorkflowTransition	\N	\N
4056	10	11	9	4	f	f	WorkflowTransition	\N	\N
4057	10	11	10	4	f	f	WorkflowTransition	\N	\N
4065	10	12	0	5	f	f	WorkflowPermission	48	required
4066	10	12	0	5	f	f	WorkflowPermission	9	required
4076	10	12	0	5	f	f	WorkflowPermission	46	required
4077	10	12	0	5	f	f	WorkflowPermission	47	required
5177	12	13	0	4	f	f	WorkflowPermission	48	readonly
5180	12	13	0	4	f	f	WorkflowPermission	49	readonly
5181	12	13	0	4	f	f	WorkflowPermission	50	readonly
5186	12	13	0	4	f	f	WorkflowPermission	55	readonly
5187	12	13	0	4	f	f	WorkflowPermission	56	readonly
4091	10	13	0	5	f	f	WorkflowPermission	48	readonly
4092	10	13	0	5	f	f	WorkflowPermission	9	readonly
5195	12	14	0	4	f	f	WorkflowPermission	project_id	readonly
5196	12	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
5197	12	14	0	4	f	f	WorkflowPermission	subject	readonly
5198	12	14	0	4	f	f	WorkflowPermission	priority_id	readonly
5199	12	14	0	4	f	f	WorkflowPermission	is_private	readonly
5200	12	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
5201	12	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
5202	12	14	0	4	f	f	WorkflowPermission	description	readonly
4106	10	13	0	5	f	f	WorkflowPermission	46	readonly
4107	10	13	0	5	f	f	WorkflowPermission	47	readonly
5203	12	14	0	4	f	f	WorkflowPermission	2	readonly
5204	12	14	0	4	f	f	WorkflowPermission	3	readonly
5205	12	14	0	4	f	f	WorkflowPermission	4	readonly
5206	12	14	0	4	f	f	WorkflowPermission	5	readonly
4112	10	14	0	5	f	f	WorkflowPermission	project_id	readonly
4113	10	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
4114	10	14	0	5	f	f	WorkflowPermission	subject	readonly
4115	10	14	0	5	f	f	WorkflowPermission	priority_id	readonly
4116	10	14	0	5	f	f	WorkflowPermission	is_private	readonly
4117	10	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4118	10	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4119	10	14	0	5	f	f	WorkflowPermission	description	readonly
4120	10	14	0	5	f	f	WorkflowPermission	2	readonly
4121	10	14	0	5	f	f	WorkflowPermission	3	readonly
4122	10	14	0	5	f	f	WorkflowPermission	4	readonly
4123	10	14	0	5	f	f	WorkflowPermission	5	readonly
4124	10	14	0	5	f	f	WorkflowPermission	7	readonly
4125	10	14	0	5	f	f	WorkflowPermission	48	readonly
4126	10	14	0	5	f	f	WorkflowPermission	9	readonly
4127	10	14	0	5	f	f	WorkflowPermission	34	readonly
4128	10	14	0	5	f	f	WorkflowPermission	35	readonly
4129	10	14	0	5	f	f	WorkflowPermission	36	readonly
4130	10	14	0	5	f	f	WorkflowPermission	37	readonly
4131	10	14	0	5	f	f	WorkflowPermission	38	readonly
4132	10	14	0	5	f	f	WorkflowPermission	39	readonly
4133	10	14	0	5	f	f	WorkflowPermission	40	readonly
4134	10	14	0	5	f	f	WorkflowPermission	41	readonly
4135	10	14	0	5	f	f	WorkflowPermission	42	readonly
4136	10	14	0	5	f	f	WorkflowPermission	43	readonly
4137	10	14	0	5	f	f	WorkflowPermission	44	readonly
4138	10	14	0	5	f	f	WorkflowPermission	45	readonly
4139	10	14	0	5	f	f	WorkflowPermission	25	readonly
4140	10	14	0	5	f	f	WorkflowPermission	46	readonly
4141	10	14	0	5	f	f	WorkflowPermission	47	readonly
4142	10	14	0	5	f	f	WorkflowPermission	26	readonly
4143	10	14	0	5	f	f	WorkflowPermission	27	readonly
4144	10	14	0	5	f	f	WorkflowPermission	28	readonly
4145	10	14	0	5	f	f	WorkflowPermission	29	readonly
5207	12	14	0	4	f	f	WorkflowPermission	7	readonly
5208	12	14	0	4	f	f	WorkflowPermission	48	readonly
5209	12	14	0	4	f	f	WorkflowPermission	9	readonly
5210	12	14	0	4	f	f	WorkflowPermission	23	readonly
5211	12	14	0	4	f	f	WorkflowPermission	49	readonly
5212	12	14	0	4	f	f	WorkflowPermission	50	readonly
5213	12	14	0	4	f	f	WorkflowPermission	51	readonly
5214	12	14	0	4	f	f	WorkflowPermission	52	readonly
5215	12	14	0	4	f	f	WorkflowPermission	53	readonly
5216	12	14	0	4	f	f	WorkflowPermission	54	readonly
5217	12	14	0	4	f	f	WorkflowPermission	55	readonly
5218	12	14	0	4	f	f	WorkflowPermission	56	readonly
5219	12	14	0	4	f	f	WorkflowPermission	25	readonly
4159	10	15	0	5	f	f	WorkflowPermission	48	readonly
4160	10	15	0	5	f	f	WorkflowPermission	9	readonly
5220	12	14	0	4	f	f	WorkflowPermission	46	readonly
5221	12	14	0	4	f	f	WorkflowPermission	47	readonly
5222	12	14	0	4	f	f	WorkflowPermission	26	readonly
5223	12	14	0	4	f	f	WorkflowPermission	27	readonly
5224	12	14	0	4	f	f	WorkflowPermission	28	readonly
5225	12	14	0	4	f	f	WorkflowPermission	29	readonly
4174	10	15	0	5	f	f	WorkflowPermission	46	readonly
4175	10	15	0	5	f	f	WorkflowPermission	47	readonly
4180	10	4	6	5	f	f	WorkflowTransition	\N	\N
4181	10	6	4	5	f	f	WorkflowTransition	\N	\N
4182	10	6	7	5	f	f	WorkflowTransition	\N	\N
4183	10	6	8	5	f	f	WorkflowTransition	\N	\N
4184	10	6	9	5	f	f	WorkflowTransition	\N	\N
4185	10	6	10	5	f	f	WorkflowTransition	\N	\N
4186	10	6	11	5	f	f	WorkflowTransition	\N	\N
4187	10	6	12	5	f	f	WorkflowTransition	\N	\N
4188	10	6	15	5	f	f	WorkflowTransition	\N	\N
4189	10	7	6	5	f	f	WorkflowTransition	\N	\N
4190	10	7	8	5	f	f	WorkflowTransition	\N	\N
4191	10	7	9	5	f	f	WorkflowTransition	\N	\N
4192	10	7	10	5	f	f	WorkflowTransition	\N	\N
4193	10	7	11	5	f	f	WorkflowTransition	\N	\N
4194	10	7	12	5	f	f	WorkflowTransition	\N	\N
4195	10	7	15	5	f	f	WorkflowTransition	\N	\N
4196	10	8	6	5	f	f	WorkflowTransition	\N	\N
4197	10	8	7	5	f	f	WorkflowTransition	\N	\N
4198	10	8	9	5	f	f	WorkflowTransition	\N	\N
4199	10	8	10	5	f	f	WorkflowTransition	\N	\N
4200	10	8	11	5	f	f	WorkflowTransition	\N	\N
4201	10	8	12	5	f	f	WorkflowTransition	\N	\N
4202	10	8	15	5	f	f	WorkflowTransition	\N	\N
4203	10	9	6	5	f	f	WorkflowTransition	\N	\N
4204	10	9	7	5	f	f	WorkflowTransition	\N	\N
4205	10	9	8	5	f	f	WorkflowTransition	\N	\N
4206	10	9	10	5	f	f	WorkflowTransition	\N	\N
4207	10	9	11	5	f	f	WorkflowTransition	\N	\N
4208	10	9	12	5	f	f	WorkflowTransition	\N	\N
4209	10	9	15	5	f	f	WorkflowTransition	\N	\N
4210	10	10	6	5	f	f	WorkflowTransition	\N	\N
4211	10	10	7	5	f	f	WorkflowTransition	\N	\N
4212	10	10	8	5	f	f	WorkflowTransition	\N	\N
4213	10	10	9	5	f	f	WorkflowTransition	\N	\N
4214	10	10	11	5	f	f	WorkflowTransition	\N	\N
4215	10	10	12	5	f	f	WorkflowTransition	\N	\N
4216	10	10	15	5	f	f	WorkflowTransition	\N	\N
4217	10	11	6	5	f	f	WorkflowTransition	\N	\N
4218	10	11	7	5	f	f	WorkflowTransition	\N	\N
4219	10	11	8	5	f	f	WorkflowTransition	\N	\N
4220	10	11	9	5	f	f	WorkflowTransition	\N	\N
4221	10	11	10	5	f	f	WorkflowTransition	\N	\N
4222	10	11	12	5	f	f	WorkflowTransition	\N	\N
4223	10	4	15	5	f	f	WorkflowTransition	\N	\N
4224	10	11	15	5	f	f	WorkflowTransition	\N	\N
4225	10	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
4226	10	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
4227	10	12	0	4	f	f	WorkflowPermission	2	required
4228	10	12	0	4	f	f	WorkflowPermission	3	required
4229	10	12	0	4	f	f	WorkflowPermission	4	required
4230	10	12	0	4	f	f	WorkflowPermission	5	required
4231	10	12	0	4	f	f	WorkflowPermission	7	required
4232	10	12	0	4	f	f	WorkflowPermission	34	required
4233	10	12	0	4	f	f	WorkflowPermission	35	required
4234	10	12	0	4	f	f	WorkflowPermission	36	required
4235	10	12	0	4	f	f	WorkflowPermission	37	required
4236	10	12	0	4	f	f	WorkflowPermission	38	required
4237	10	12	0	4	f	f	WorkflowPermission	39	required
4238	10	12	0	4	f	f	WorkflowPermission	40	required
4239	10	12	0	4	f	f	WorkflowPermission	41	required
4240	10	12	0	4	f	f	WorkflowPermission	42	required
4241	10	12	0	4	f	f	WorkflowPermission	43	required
4242	10	12	0	4	f	f	WorkflowPermission	44	required
4243	10	12	0	4	f	f	WorkflowPermission	45	required
4244	10	12	0	4	f	f	WorkflowPermission	25	required
4245	10	13	0	4	f	f	WorkflowPermission	project_id	readonly
4246	10	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
4247	10	13	0	4	f	f	WorkflowPermission	subject	readonly
4248	10	13	0	4	f	f	WorkflowPermission	priority_id	readonly
4249	10	13	0	4	f	f	WorkflowPermission	is_private	readonly
4250	10	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
4251	10	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
4252	10	13	0	4	f	f	WorkflowPermission	description	readonly
4253	10	13	0	4	f	f	WorkflowPermission	2	readonly
4254	10	13	0	4	f	f	WorkflowPermission	3	readonly
4255	10	13	0	4	f	f	WorkflowPermission	4	readonly
4256	10	13	0	4	f	f	WorkflowPermission	5	readonly
4257	10	13	0	4	f	f	WorkflowPermission	7	readonly
4258	10	13	0	4	f	f	WorkflowPermission	34	readonly
4259	10	13	0	4	f	f	WorkflowPermission	35	readonly
4260	10	13	0	4	f	f	WorkflowPermission	36	readonly
4261	10	13	0	4	f	f	WorkflowPermission	37	readonly
4262	10	13	0	4	f	f	WorkflowPermission	38	readonly
4263	10	13	0	4	f	f	WorkflowPermission	39	readonly
4264	10	13	0	4	f	f	WorkflowPermission	40	readonly
4265	10	13	0	4	f	f	WorkflowPermission	41	readonly
4266	10	13	0	4	f	f	WorkflowPermission	42	readonly
4267	10	13	0	4	f	f	WorkflowPermission	43	readonly
4268	10	13	0	4	f	f	WorkflowPermission	44	readonly
4269	10	13	0	4	f	f	WorkflowPermission	45	readonly
4270	10	13	0	4	f	f	WorkflowPermission	25	readonly
4271	10	13	0	4	f	f	WorkflowPermission	70	readonly
4272	10	13	0	4	f	f	WorkflowPermission	69	readonly
4273	10	13	0	4	f	f	WorkflowPermission	26	readonly
4274	10	13	0	4	f	f	WorkflowPermission	27	readonly
4275	10	13	0	4	f	f	WorkflowPermission	28	readonly
4276	10	13	0	4	f	f	WorkflowPermission	29	readonly
4277	10	15	0	4	f	f	WorkflowPermission	project_id	readonly
4278	10	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
4279	10	15	0	4	f	f	WorkflowPermission	subject	readonly
4280	10	15	0	4	f	f	WorkflowPermission	priority_id	readonly
4281	10	15	0	4	f	f	WorkflowPermission	is_private	readonly
4282	10	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
4283	10	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
4284	10	15	0	4	f	f	WorkflowPermission	description	readonly
4285	10	15	0	4	f	f	WorkflowPermission	2	readonly
4286	10	15	0	4	f	f	WorkflowPermission	3	readonly
4287	10	15	0	4	f	f	WorkflowPermission	4	readonly
4288	10	15	0	4	f	f	WorkflowPermission	5	readonly
4289	10	15	0	4	f	f	WorkflowPermission	7	readonly
4290	10	15	0	4	f	f	WorkflowPermission	34	readonly
4291	10	15	0	4	f	f	WorkflowPermission	35	readonly
4292	10	15	0	4	f	f	WorkflowPermission	36	readonly
4293	10	15	0	4	f	f	WorkflowPermission	37	readonly
4294	10	15	0	4	f	f	WorkflowPermission	38	readonly
4295	10	15	0	4	f	f	WorkflowPermission	39	readonly
4296	10	15	0	4	f	f	WorkflowPermission	40	readonly
4297	10	15	0	4	f	f	WorkflowPermission	41	readonly
4298	10	15	0	4	f	f	WorkflowPermission	42	readonly
4299	10	15	0	4	f	f	WorkflowPermission	43	readonly
4300	10	15	0	4	f	f	WorkflowPermission	44	readonly
4301	10	15	0	4	f	f	WorkflowPermission	45	readonly
4302	10	15	0	4	f	f	WorkflowPermission	25	readonly
4303	10	15	0	4	f	f	WorkflowPermission	70	readonly
4304	10	15	0	4	f	f	WorkflowPermission	69	readonly
4305	10	15	0	4	f	f	WorkflowPermission	26	readonly
4306	10	15	0	4	f	f	WorkflowPermission	27	readonly
4307	10	15	0	4	f	f	WorkflowPermission	28	readonly
4308	10	15	0	4	f	f	WorkflowPermission	29	readonly
4309	10	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
4310	10	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
4311	10	12	0	5	f	f	WorkflowPermission	2	required
4312	10	12	0	5	f	f	WorkflowPermission	3	required
4313	10	12	0	5	f	f	WorkflowPermission	4	required
4314	10	12	0	5	f	f	WorkflowPermission	5	required
4315	10	12	0	5	f	f	WorkflowPermission	7	required
4316	10	12	0	5	f	f	WorkflowPermission	23	required
4317	10	12	0	5	f	f	WorkflowPermission	34	required
4318	10	12	0	5	f	f	WorkflowPermission	35	required
4319	10	12	0	5	f	f	WorkflowPermission	36	required
4320	10	12	0	5	f	f	WorkflowPermission	37	required
4321	10	12	0	5	f	f	WorkflowPermission	38	required
4322	10	12	0	5	f	f	WorkflowPermission	39	required
4323	10	12	0	5	f	f	WorkflowPermission	40	required
4324	10	12	0	5	f	f	WorkflowPermission	41	required
4325	10	12	0	5	f	f	WorkflowPermission	42	required
4326	10	12	0	5	f	f	WorkflowPermission	43	required
4327	10	12	0	5	f	f	WorkflowPermission	44	required
4328	10	12	0	5	f	f	WorkflowPermission	45	required
4329	10	12	0	5	f	f	WorkflowPermission	25	required
4330	10	13	0	5	f	f	WorkflowPermission	project_id	readonly
4331	10	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
4332	10	13	0	5	f	f	WorkflowPermission	subject	readonly
4333	10	13	0	5	f	f	WorkflowPermission	priority_id	readonly
4334	10	13	0	5	f	f	WorkflowPermission	is_private	readonly
4335	10	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4336	10	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4337	10	13	0	5	f	f	WorkflowPermission	description	readonly
4338	10	13	0	5	f	f	WorkflowPermission	2	readonly
4339	10	13	0	5	f	f	WorkflowPermission	3	readonly
4340	10	13	0	5	f	f	WorkflowPermission	4	readonly
4341	10	13	0	5	f	f	WorkflowPermission	5	readonly
4342	10	13	0	5	f	f	WorkflowPermission	7	readonly
4343	10	13	0	5	f	f	WorkflowPermission	23	readonly
4344	10	13	0	5	f	f	WorkflowPermission	34	readonly
4345	10	13	0	5	f	f	WorkflowPermission	35	readonly
4346	10	13	0	5	f	f	WorkflowPermission	36	readonly
4347	10	13	0	5	f	f	WorkflowPermission	37	readonly
4348	10	13	0	5	f	f	WorkflowPermission	38	readonly
4349	10	13	0	5	f	f	WorkflowPermission	39	readonly
4350	10	13	0	5	f	f	WorkflowPermission	40	readonly
4351	10	13	0	5	f	f	WorkflowPermission	41	readonly
4352	10	13	0	5	f	f	WorkflowPermission	42	readonly
4353	10	13	0	5	f	f	WorkflowPermission	43	readonly
4354	10	13	0	5	f	f	WorkflowPermission	44	readonly
4355	10	13	0	5	f	f	WorkflowPermission	45	readonly
4356	10	13	0	5	f	f	WorkflowPermission	25	readonly
4357	10	13	0	5	f	f	WorkflowPermission	70	readonly
4358	10	13	0	5	f	f	WorkflowPermission	69	readonly
4359	10	13	0	5	f	f	WorkflowPermission	26	readonly
4360	10	13	0	5	f	f	WorkflowPermission	27	readonly
4361	10	13	0	5	f	f	WorkflowPermission	28	readonly
4362	10	13	0	5	f	f	WorkflowPermission	29	readonly
4363	10	13	0	5	f	f	WorkflowPermission	71	readonly
4364	10	13	0	5	f	f	WorkflowPermission	72	readonly
4365	10	15	0	5	f	f	WorkflowPermission	project_id	readonly
4366	10	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
4367	10	15	0	5	f	f	WorkflowPermission	subject	readonly
4368	10	15	0	5	f	f	WorkflowPermission	priority_id	readonly
4369	10	15	0	5	f	f	WorkflowPermission	is_private	readonly
4370	10	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4371	10	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4372	10	15	0	5	f	f	WorkflowPermission	description	readonly
4373	10	15	0	5	f	f	WorkflowPermission	2	readonly
4374	10	15	0	5	f	f	WorkflowPermission	3	readonly
4375	10	15	0	5	f	f	WorkflowPermission	4	readonly
4376	10	15	0	5	f	f	WorkflowPermission	5	readonly
4377	10	15	0	5	f	f	WorkflowPermission	7	readonly
4378	10	15	0	5	f	f	WorkflowPermission	23	readonly
4379	10	15	0	5	f	f	WorkflowPermission	34	readonly
4380	10	15	0	5	f	f	WorkflowPermission	35	readonly
4381	10	15	0	5	f	f	WorkflowPermission	36	readonly
4382	10	15	0	5	f	f	WorkflowPermission	37	readonly
4383	10	15	0	5	f	f	WorkflowPermission	38	readonly
4384	10	15	0	5	f	f	WorkflowPermission	39	readonly
4385	10	15	0	5	f	f	WorkflowPermission	40	readonly
4386	10	15	0	5	f	f	WorkflowPermission	41	readonly
4387	10	15	0	5	f	f	WorkflowPermission	42	readonly
4388	10	15	0	5	f	f	WorkflowPermission	43	readonly
4389	10	15	0	5	f	f	WorkflowPermission	44	readonly
4390	10	15	0	5	f	f	WorkflowPermission	45	readonly
4391	10	15	0	5	f	f	WorkflowPermission	25	readonly
4392	10	15	0	5	f	f	WorkflowPermission	70	readonly
4393	10	15	0	5	f	f	WorkflowPermission	69	readonly
4394	10	15	0	5	f	f	WorkflowPermission	26	readonly
4395	10	15	0	5	f	f	WorkflowPermission	27	readonly
4396	10	15	0	5	f	f	WorkflowPermission	28	readonly
4397	10	15	0	5	f	f	WorkflowPermission	29	readonly
4398	10	15	0	5	f	f	WorkflowPermission	71	readonly
4399	10	15	0	5	f	f	WorkflowPermission	72	readonly
5239	12	15	0	4	f	f	WorkflowPermission	48	readonly
5242	12	15	0	4	f	f	WorkflowPermission	49	readonly
5243	12	15	0	4	f	f	WorkflowPermission	50	readonly
5248	12	15	0	4	f	f	WorkflowPermission	55	readonly
5249	12	15	0	4	f	f	WorkflowPermission	56	readonly
5257	12	14	0	5	f	f	WorkflowPermission	27	readonly
5258	12	14	0	5	f	f	WorkflowPermission	28	readonly
5259	12	14	0	5	f	f	WorkflowPermission	29	readonly
5273	12	15	0	5	f	f	WorkflowPermission	48	readonly
5276	12	15	0	5	f	f	WorkflowPermission	49	readonly
5277	12	15	0	5	f	f	WorkflowPermission	50	readonly
5282	12	15	0	5	f	f	WorkflowPermission	55	readonly
5283	12	15	0	5	f	f	WorkflowPermission	56	readonly
5298	12	12	0	5	f	f	WorkflowPermission	48	required
5301	12	12	0	5	f	f	WorkflowPermission	49	required
5302	12	12	0	5	f	f	WorkflowPermission	50	required
5307	12	12	0	5	f	f	WorkflowPermission	55	required
5308	12	12	0	5	f	f	WorkflowPermission	56	required
5325	12	13	0	5	f	f	WorkflowPermission	48	readonly
5328	12	13	0	5	f	f	WorkflowPermission	49	readonly
5329	12	13	0	5	f	f	WorkflowPermission	50	readonly
5334	12	13	0	5	f	f	WorkflowPermission	55	readonly
5335	12	13	0	5	f	f	WorkflowPermission	56	readonly
5343	12	14	0	5	f	f	WorkflowPermission	project_id	readonly
5344	12	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
5345	12	14	0	5	f	f	WorkflowPermission	subject	readonly
5346	12	14	0	5	f	f	WorkflowPermission	priority_id	readonly
5347	12	14	0	5	f	f	WorkflowPermission	is_private	readonly
5348	12	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
5349	12	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
5350	12	14	0	5	f	f	WorkflowPermission	description	readonly
5351	12	14	0	5	f	f	WorkflowPermission	2	readonly
5352	12	14	0	5	f	f	WorkflowPermission	3	readonly
5353	12	14	0	5	f	f	WorkflowPermission	4	readonly
5354	12	14	0	5	f	f	WorkflowPermission	5	readonly
5355	12	14	0	5	f	f	WorkflowPermission	7	readonly
5356	12	14	0	5	f	f	WorkflowPermission	48	readonly
5357	12	14	0	5	f	f	WorkflowPermission	9	readonly
5358	12	14	0	5	f	f	WorkflowPermission	23	readonly
5359	12	14	0	5	f	f	WorkflowPermission	49	readonly
5360	12	14	0	5	f	f	WorkflowPermission	50	readonly
5361	12	14	0	5	f	f	WorkflowPermission	51	readonly
5362	12	14	0	5	f	f	WorkflowPermission	52	readonly
5363	12	14	0	5	f	f	WorkflowPermission	53	readonly
5364	12	14	0	5	f	f	WorkflowPermission	54	readonly
5365	12	14	0	5	f	f	WorkflowPermission	55	readonly
5366	12	14	0	5	f	f	WorkflowPermission	56	readonly
5367	12	14	0	5	f	f	WorkflowPermission	25	readonly
5368	12	14	0	5	f	f	WorkflowPermission	46	readonly
5369	12	14	0	5	f	f	WorkflowPermission	47	readonly
5370	12	14	0	5	f	f	WorkflowPermission	26	readonly
5371	12	4	6	5	f	f	WorkflowTransition	\N	\N
5372	12	4	15	5	f	f	WorkflowTransition	\N	\N
5373	12	6	4	5	f	f	WorkflowTransition	\N	\N
5374	12	6	7	5	f	f	WorkflowTransition	\N	\N
5375	12	6	8	5	f	f	WorkflowTransition	\N	\N
5376	12	6	9	5	f	f	WorkflowTransition	\N	\N
5377	12	6	10	5	f	f	WorkflowTransition	\N	\N
5378	12	6	11	5	f	f	WorkflowTransition	\N	\N
5379	12	6	12	5	f	f	WorkflowTransition	\N	\N
5380	12	6	15	5	f	f	WorkflowTransition	\N	\N
5381	12	7	6	5	f	f	WorkflowTransition	\N	\N
5382	12	7	8	5	f	f	WorkflowTransition	\N	\N
5383	12	7	9	5	f	f	WorkflowTransition	\N	\N
5384	12	7	10	5	f	f	WorkflowTransition	\N	\N
5385	12	7	11	5	f	f	WorkflowTransition	\N	\N
5386	12	7	12	5	f	f	WorkflowTransition	\N	\N
5387	12	7	15	5	f	f	WorkflowTransition	\N	\N
5388	12	8	6	5	f	f	WorkflowTransition	\N	\N
5389	12	8	7	5	f	f	WorkflowTransition	\N	\N
5390	12	8	9	5	f	f	WorkflowTransition	\N	\N
5391	12	8	10	5	f	f	WorkflowTransition	\N	\N
5392	12	8	11	5	f	f	WorkflowTransition	\N	\N
4556	9	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
4557	9	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
4558	9	12	0	5	f	f	WorkflowPermission	2	required
4559	9	12	0	5	f	f	WorkflowPermission	3	required
4560	9	12	0	5	f	f	WorkflowPermission	4	required
4561	9	12	0	5	f	f	WorkflowPermission	5	required
4562	9	12	0	5	f	f	WorkflowPermission	6	required
4563	9	12	0	5	f	f	WorkflowPermission	7	required
4564	9	12	0	5	f	f	WorkflowPermission	8	required
4565	9	12	0	5	f	f	WorkflowPermission	9	required
4566	9	12	0	5	f	f	WorkflowPermission	13	required
4567	9	12	0	5	f	f	WorkflowPermission	63	required
4568	9	12	0	5	f	f	WorkflowPermission	64	required
4569	9	12	0	5	f	f	WorkflowPermission	65	required
4570	9	12	0	5	f	f	WorkflowPermission	15	required
4571	9	12	0	5	f	f	WorkflowPermission	16	required
4572	9	12	0	5	f	f	WorkflowPermission	17	required
4573	9	12	0	5	f	f	WorkflowPermission	18	required
4574	9	12	0	5	f	f	WorkflowPermission	19	required
4575	9	12	0	5	f	f	WorkflowPermission	20	required
4576	9	12	0	5	f	f	WorkflowPermission	21	required
4577	9	12	0	5	f	f	WorkflowPermission	22	required
4578	9	12	0	5	f	f	WorkflowPermission	23	required
4579	9	12	0	5	f	f	WorkflowPermission	24	required
4580	9	12	0	5	f	f	WorkflowPermission	61	required
4581	9	12	0	5	f	f	WorkflowPermission	66	required
4582	9	12	0	5	f	f	WorkflowPermission	67	required
4583	9	12	0	5	f	f	WorkflowPermission	68	required
4584	9	12	0	5	f	f	WorkflowPermission	25	required
4585	9	13	0	5	f	f	WorkflowPermission	project_id	readonly
4586	9	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
4587	9	13	0	5	f	f	WorkflowPermission	subject	readonly
4588	9	13	0	5	f	f	WorkflowPermission	priority_id	readonly
4589	9	13	0	5	f	f	WorkflowPermission	is_private	readonly
4590	9	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4591	9	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4592	9	13	0	5	f	f	WorkflowPermission	description	readonly
4593	9	13	0	5	f	f	WorkflowPermission	2	readonly
4594	9	13	0	5	f	f	WorkflowPermission	3	readonly
4595	9	13	0	5	f	f	WorkflowPermission	4	readonly
4596	9	13	0	5	f	f	WorkflowPermission	5	readonly
4597	9	13	0	5	f	f	WorkflowPermission	6	readonly
4598	9	13	0	5	f	f	WorkflowPermission	7	readonly
4599	9	13	0	5	f	f	WorkflowPermission	8	readonly
4600	9	13	0	5	f	f	WorkflowPermission	9	readonly
4601	9	13	0	5	f	f	WorkflowPermission	13	readonly
4602	9	13	0	5	f	f	WorkflowPermission	63	readonly
4603	9	13	0	5	f	f	WorkflowPermission	64	readonly
4604	9	13	0	5	f	f	WorkflowPermission	65	readonly
4605	9	13	0	5	f	f	WorkflowPermission	15	readonly
4606	9	13	0	5	f	f	WorkflowPermission	16	readonly
4607	9	13	0	5	f	f	WorkflowPermission	17	readonly
4608	9	13	0	5	f	f	WorkflowPermission	18	readonly
4609	9	13	0	5	f	f	WorkflowPermission	19	readonly
4610	9	13	0	5	f	f	WorkflowPermission	20	readonly
4611	9	13	0	5	f	f	WorkflowPermission	21	readonly
4612	9	13	0	5	f	f	WorkflowPermission	22	readonly
4613	9	13	0	5	f	f	WorkflowPermission	23	readonly
4614	9	13	0	5	f	f	WorkflowPermission	24	readonly
4615	9	13	0	5	f	f	WorkflowPermission	61	readonly
4616	9	13	0	5	f	f	WorkflowPermission	66	readonly
4617	9	13	0	5	f	f	WorkflowPermission	67	readonly
4618	9	13	0	5	f	f	WorkflowPermission	68	readonly
4619	9	13	0	5	f	f	WorkflowPermission	25	readonly
4620	9	13	0	5	f	f	WorkflowPermission	46	readonly
4621	9	13	0	5	f	f	WorkflowPermission	47	readonly
4622	9	13	0	5	f	f	WorkflowPermission	70	readonly
4623	9	13	0	5	f	f	WorkflowPermission	69	readonly
4624	9	13	0	5	f	f	WorkflowPermission	26	readonly
4625	9	13	0	5	f	f	WorkflowPermission	27	readonly
4626	9	13	0	5	f	f	WorkflowPermission	28	readonly
4627	9	13	0	5	f	f	WorkflowPermission	29	readonly
4628	9	14	0	5	f	f	WorkflowPermission	project_id	readonly
4629	9	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
4630	9	14	0	5	f	f	WorkflowPermission	subject	readonly
4631	9	14	0	5	f	f	WorkflowPermission	priority_id	readonly
4632	9	14	0	5	f	f	WorkflowPermission	is_private	readonly
4633	9	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4634	9	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4635	9	14	0	5	f	f	WorkflowPermission	description	readonly
4636	9	14	0	5	f	f	WorkflowPermission	2	readonly
4637	9	14	0	5	f	f	WorkflowPermission	3	readonly
4638	9	14	0	5	f	f	WorkflowPermission	4	readonly
4639	9	14	0	5	f	f	WorkflowPermission	5	readonly
4640	9	14	0	5	f	f	WorkflowPermission	6	readonly
4641	9	14	0	5	f	f	WorkflowPermission	7	readonly
4642	9	14	0	5	f	f	WorkflowPermission	8	readonly
4643	9	14	0	5	f	f	WorkflowPermission	9	readonly
4644	9	14	0	5	f	f	WorkflowPermission	13	readonly
4645	9	14	0	5	f	f	WorkflowPermission	63	readonly
4646	9	14	0	5	f	f	WorkflowPermission	64	readonly
4647	9	14	0	5	f	f	WorkflowPermission	65	readonly
4648	9	14	0	5	f	f	WorkflowPermission	15	readonly
4649	9	14	0	5	f	f	WorkflowPermission	16	readonly
4650	9	14	0	5	f	f	WorkflowPermission	17	readonly
4651	9	14	0	5	f	f	WorkflowPermission	18	readonly
4652	9	14	0	5	f	f	WorkflowPermission	19	readonly
4653	9	14	0	5	f	f	WorkflowPermission	20	readonly
4654	9	14	0	5	f	f	WorkflowPermission	21	readonly
4655	9	14	0	5	f	f	WorkflowPermission	22	readonly
4656	9	14	0	5	f	f	WorkflowPermission	23	readonly
4657	9	14	0	5	f	f	WorkflowPermission	24	readonly
4658	9	14	0	5	f	f	WorkflowPermission	61	readonly
4659	9	14	0	5	f	f	WorkflowPermission	66	readonly
4660	9	14	0	5	f	f	WorkflowPermission	67	readonly
4661	9	14	0	5	f	f	WorkflowPermission	68	readonly
4662	9	14	0	5	f	f	WorkflowPermission	25	readonly
4663	9	14	0	5	f	f	WorkflowPermission	46	readonly
4664	9	14	0	5	f	f	WorkflowPermission	47	readonly
4665	9	14	0	5	f	f	WorkflowPermission	70	readonly
4666	9	14	0	5	f	f	WorkflowPermission	69	readonly
4667	9	14	0	5	f	f	WorkflowPermission	26	readonly
4668	9	14	0	5	f	f	WorkflowPermission	27	readonly
4669	9	14	0	5	f	f	WorkflowPermission	28	readonly
4670	9	14	0	5	f	f	WorkflowPermission	29	readonly
4671	9	15	0	5	f	f	WorkflowPermission	project_id	readonly
4672	9	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
4673	9	15	0	5	f	f	WorkflowPermission	subject	readonly
4674	9	15	0	5	f	f	WorkflowPermission	priority_id	readonly
4675	9	15	0	5	f	f	WorkflowPermission	is_private	readonly
4676	9	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
4677	9	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
4678	9	15	0	5	f	f	WorkflowPermission	description	readonly
4679	9	15	0	5	f	f	WorkflowPermission	2	readonly
4680	9	15	0	5	f	f	WorkflowPermission	3	readonly
4681	9	15	0	5	f	f	WorkflowPermission	4	readonly
4682	9	15	0	5	f	f	WorkflowPermission	5	readonly
4683	9	15	0	5	f	f	WorkflowPermission	6	readonly
4684	9	15	0	5	f	f	WorkflowPermission	7	readonly
4685	9	15	0	5	f	f	WorkflowPermission	8	readonly
4686	9	15	0	5	f	f	WorkflowPermission	9	readonly
4687	9	15	0	5	f	f	WorkflowPermission	13	readonly
4688	9	15	0	5	f	f	WorkflowPermission	63	readonly
4689	9	15	0	5	f	f	WorkflowPermission	64	readonly
4690	9	15	0	5	f	f	WorkflowPermission	65	readonly
4691	9	15	0	5	f	f	WorkflowPermission	15	readonly
4692	9	15	0	5	f	f	WorkflowPermission	16	readonly
4693	9	15	0	5	f	f	WorkflowPermission	17	readonly
4694	9	15	0	5	f	f	WorkflowPermission	18	readonly
4695	9	15	0	5	f	f	WorkflowPermission	19	readonly
4696	9	15	0	5	f	f	WorkflowPermission	20	readonly
4697	9	15	0	5	f	f	WorkflowPermission	21	readonly
4698	9	15	0	5	f	f	WorkflowPermission	22	readonly
4699	9	15	0	5	f	f	WorkflowPermission	23	readonly
4700	9	15	0	5	f	f	WorkflowPermission	24	readonly
4701	9	15	0	5	f	f	WorkflowPermission	61	readonly
4702	9	15	0	5	f	f	WorkflowPermission	66	readonly
4703	9	15	0	5	f	f	WorkflowPermission	67	readonly
4704	9	15	0	5	f	f	WorkflowPermission	68	readonly
4705	9	15	0	5	f	f	WorkflowPermission	25	readonly
4706	9	15	0	5	f	f	WorkflowPermission	46	readonly
4707	9	15	0	5	f	f	WorkflowPermission	47	readonly
4708	9	15	0	5	f	f	WorkflowPermission	70	readonly
4709	9	15	0	5	f	f	WorkflowPermission	69	readonly
4710	9	15	0	5	f	f	WorkflowPermission	26	readonly
4711	9	15	0	5	f	f	WorkflowPermission	27	readonly
4712	9	15	0	5	f	f	WorkflowPermission	28	readonly
4713	9	15	0	5	f	f	WorkflowPermission	29	readonly
5393	12	8	12	5	f	f	WorkflowTransition	\N	\N
5394	12	8	15	5	f	f	WorkflowTransition	\N	\N
5395	12	9	6	5	f	f	WorkflowTransition	\N	\N
5396	12	9	7	5	f	f	WorkflowTransition	\N	\N
5397	12	9	8	5	f	f	WorkflowTransition	\N	\N
5398	12	9	10	5	f	f	WorkflowTransition	\N	\N
5399	12	9	11	5	f	f	WorkflowTransition	\N	\N
5400	12	9	12	5	f	f	WorkflowTransition	\N	\N
5401	12	9	15	5	f	f	WorkflowTransition	\N	\N
5402	12	10	6	5	f	f	WorkflowTransition	\N	\N
5403	12	10	7	5	f	f	WorkflowTransition	\N	\N
5404	12	10	8	5	f	f	WorkflowTransition	\N	\N
5405	12	10	9	5	f	f	WorkflowTransition	\N	\N
5406	12	10	11	5	f	f	WorkflowTransition	\N	\N
5407	12	10	12	5	f	f	WorkflowTransition	\N	\N
5408	12	10	15	5	f	f	WorkflowTransition	\N	\N
5409	12	11	6	5	f	f	WorkflowTransition	\N	\N
5410	12	11	7	5	f	f	WorkflowTransition	\N	\N
5411	12	11	8	5	f	f	WorkflowTransition	\N	\N
5412	12	11	9	5	f	f	WorkflowTransition	\N	\N
5413	12	11	10	5	f	f	WorkflowTransition	\N	\N
5414	12	11	12	5	f	f	WorkflowTransition	\N	\N
5415	12	11	15	5	f	f	WorkflowTransition	\N	\N
5455	12	13	0	4	f	f	WorkflowPermission	25	readonly
5456	12	13	0	4	f	f	WorkflowPermission	46	readonly
5457	12	13	0	4	f	f	WorkflowPermission	47	readonly
5458	12	13	0	4	f	f	WorkflowPermission	70	readonly
5459	12	13	0	4	f	f	WorkflowPermission	69	readonly
5460	12	13	0	4	f	f	WorkflowPermission	26	readonly
5461	12	13	0	4	f	f	WorkflowPermission	27	readonly
5462	12	13	0	4	f	f	WorkflowPermission	28	readonly
5463	12	13	0	4	f	f	WorkflowPermission	29	readonly
5464	12	13	0	4	f	f	WorkflowPermission	71	readonly
5465	12	13	0	4	f	f	WorkflowPermission	72	readonly
5466	12	15	0	4	f	f	WorkflowPermission	project_id	readonly
5467	12	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
5468	12	15	0	4	f	f	WorkflowPermission	subject	readonly
5469	12	15	0	4	f	f	WorkflowPermission	priority_id	readonly
5470	12	15	0	4	f	f	WorkflowPermission	is_private	readonly
5471	12	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
5472	12	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
5473	12	15	0	4	f	f	WorkflowPermission	description	readonly
5474	12	15	0	4	f	f	WorkflowPermission	2	readonly
5475	12	15	0	4	f	f	WorkflowPermission	3	readonly
5476	12	15	0	4	f	f	WorkflowPermission	4	readonly
5477	12	15	0	4	f	f	WorkflowPermission	5	readonly
5478	12	15	0	4	f	f	WorkflowPermission	7	readonly
5479	12	15	0	4	f	f	WorkflowPermission	9	readonly
5480	12	15	0	4	f	f	WorkflowPermission	23	readonly
5481	12	15	0	4	f	f	WorkflowPermission	73	readonly
5482	12	15	0	4	f	f	WorkflowPermission	74	readonly
5483	12	15	0	4	f	f	WorkflowPermission	51	readonly
5484	12	15	0	4	f	f	WorkflowPermission	52	readonly
5485	12	15	0	4	f	f	WorkflowPermission	53	readonly
5486	12	15	0	4	f	f	WorkflowPermission	54	readonly
5487	12	15	0	4	f	f	WorkflowPermission	25	readonly
5488	12	15	0	4	f	f	WorkflowPermission	46	readonly
5489	12	15	0	4	f	f	WorkflowPermission	47	readonly
5490	12	15	0	4	f	f	WorkflowPermission	70	readonly
5491	12	15	0	4	f	f	WorkflowPermission	69	readonly
5492	12	15	0	4	f	f	WorkflowPermission	26	readonly
5493	12	15	0	4	f	f	WorkflowPermission	27	readonly
5494	12	15	0	4	f	f	WorkflowPermission	28	readonly
5495	12	15	0	4	f	f	WorkflowPermission	29	readonly
5496	12	15	0	4	f	f	WorkflowPermission	71	readonly
5497	12	15	0	4	f	f	WorkflowPermission	72	readonly
5498	13	7	6	4	f	f	WorkflowTransition	\N	\N
5499	13	8	6	4	f	f	WorkflowTransition	\N	\N
5500	13	8	7	4	f	f	WorkflowTransition	\N	\N
5501	13	9	6	4	f	f	WorkflowTransition	\N	\N
5502	13	9	7	4	f	f	WorkflowTransition	\N	\N
5503	13	9	8	4	f	f	WorkflowTransition	\N	\N
5504	13	10	6	4	f	f	WorkflowTransition	\N	\N
5505	13	10	7	4	f	f	WorkflowTransition	\N	\N
5506	13	10	8	4	f	f	WorkflowTransition	\N	\N
5507	13	10	9	4	f	f	WorkflowTransition	\N	\N
5508	13	11	7	4	f	f	WorkflowTransition	\N	\N
5509	13	11	8	4	f	f	WorkflowTransition	\N	\N
5510	13	11	9	4	f	f	WorkflowTransition	\N	\N
5511	13	11	10	4	f	f	WorkflowTransition	\N	\N
5512	13	12	0	4	f	f	WorkflowPermission	7	required
5513	13	12	0	4	f	f	WorkflowPermission	48	required
5514	13	12	0	4	f	f	WorkflowPermission	9	required
5515	13	12	4	4	f	f	WorkflowTransition	\N	\N
5516	13	13	4	4	f	f	WorkflowTransition	\N	\N
5517	13	15	4	4	f	f	WorkflowTransition	\N	\N
5518	13	4	6	4	f	f	WorkflowTransition	\N	\N
5519	13	4	15	4	f	f	WorkflowTransition	\N	\N
5520	13	6	7	4	f	f	WorkflowTransition	\N	\N
5521	13	6	8	4	f	f	WorkflowTransition	\N	\N
5522	13	6	9	4	f	f	WorkflowTransition	\N	\N
5523	13	6	10	4	f	f	WorkflowTransition	\N	\N
5524	13	6	11	4	f	f	WorkflowTransition	\N	\N
5525	13	6	12	4	f	f	WorkflowTransition	\N	\N
5526	13	6	13	4	f	f	WorkflowTransition	\N	\N
5527	13	6	15	4	f	f	WorkflowTransition	\N	\N
5528	13	7	15	4	f	f	WorkflowTransition	\N	\N
5529	13	8	15	4	f	f	WorkflowTransition	\N	\N
5530	13	9	15	4	f	f	WorkflowTransition	\N	\N
5531	13	10	15	4	f	f	WorkflowTransition	\N	\N
5532	13	11	15	4	f	f	WorkflowTransition	\N	\N
5533	13	12	15	4	f	f	WorkflowTransition	\N	\N
5534	13	13	6	4	f	f	WorkflowTransition	\N	\N
5535	13	13	15	4	f	f	WorkflowTransition	\N	\N
5536	13	15	6	4	f	f	WorkflowTransition	\N	\N
5537	13	7	8	4	f	f	WorkflowTransition	\N	\N
5538	13	7	9	4	f	f	WorkflowTransition	\N	\N
5539	13	7	10	4	f	f	WorkflowTransition	\N	\N
5540	13	7	11	4	f	f	WorkflowTransition	\N	\N
5541	13	7	12	4	f	f	WorkflowTransition	\N	\N
5542	13	7	13	4	f	f	WorkflowTransition	\N	\N
5543	13	8	9	4	f	f	WorkflowTransition	\N	\N
5544	13	8	10	4	f	f	WorkflowTransition	\N	\N
5545	13	8	11	4	f	f	WorkflowTransition	\N	\N
5546	13	8	12	4	f	f	WorkflowTransition	\N	\N
5547	13	8	13	4	f	f	WorkflowTransition	\N	\N
5548	13	9	10	4	f	f	WorkflowTransition	\N	\N
5549	13	9	11	4	f	f	WorkflowTransition	\N	\N
5550	13	9	12	4	f	f	WorkflowTransition	\N	\N
5551	13	9	13	4	f	f	WorkflowTransition	\N	\N
5552	13	10	11	4	f	f	WorkflowTransition	\N	\N
5553	13	10	12	4	f	f	WorkflowTransition	\N	\N
5554	13	10	13	4	f	f	WorkflowTransition	\N	\N
5555	13	11	12	4	f	f	WorkflowTransition	\N	\N
5556	13	11	13	4	f	f	WorkflowTransition	\N	\N
5557	13	12	13	4	f	f	WorkflowTransition	\N	\N
5558	13	11	6	4	f	f	WorkflowTransition	\N	\N
5559	13	12	0	4	f	f	WorkflowPermission	49	required
5560	13	12	0	4	f	f	WorkflowPermission	50	required
5561	13	12	0	4	f	f	WorkflowPermission	51	required
5562	13	12	0	4	f	f	WorkflowPermission	52	required
5563	13	12	0	4	f	f	WorkflowPermission	53	required
5564	13	12	0	4	f	f	WorkflowPermission	54	required
5565	13	12	0	4	f	f	WorkflowPermission	55	required
5566	13	12	0	4	f	f	WorkflowPermission	56	required
5567	13	12	0	4	f	f	WorkflowPermission	46	required
5568	13	12	0	4	f	f	WorkflowPermission	47	required
5569	13	13	0	4	f	f	WorkflowPermission	7	readonly
5570	13	13	0	4	f	f	WorkflowPermission	48	readonly
5571	13	13	0	4	f	f	WorkflowPermission	9	readonly
5572	13	13	0	4	f	f	WorkflowPermission	49	readonly
5573	13	13	0	4	f	f	WorkflowPermission	50	readonly
5574	13	13	0	4	f	f	WorkflowPermission	51	readonly
5575	13	13	0	4	f	f	WorkflowPermission	52	readonly
5576	13	13	0	4	f	f	WorkflowPermission	53	readonly
5577	13	13	0	4	f	f	WorkflowPermission	54	readonly
5578	13	13	0	4	f	f	WorkflowPermission	55	readonly
5579	13	13	0	4	f	f	WorkflowPermission	56	readonly
5580	13	13	0	4	f	f	WorkflowPermission	46	readonly
5581	13	13	0	4	f	f	WorkflowPermission	47	readonly
5582	13	14	0	4	f	f	WorkflowPermission	7	readonly
5583	13	14	0	4	f	f	WorkflowPermission	48	readonly
5584	13	14	0	4	f	f	WorkflowPermission	9	readonly
5585	13	14	0	4	f	f	WorkflowPermission	49	readonly
5586	13	14	0	4	f	f	WorkflowPermission	50	readonly
5587	13	14	0	4	f	f	WorkflowPermission	51	readonly
5588	13	14	0	4	f	f	WorkflowPermission	52	readonly
5589	13	14	0	4	f	f	WorkflowPermission	53	readonly
5590	13	14	0	4	f	f	WorkflowPermission	54	readonly
5591	13	14	0	4	f	f	WorkflowPermission	55	readonly
5592	13	14	0	4	f	f	WorkflowPermission	56	readonly
5593	13	14	0	4	f	f	WorkflowPermission	46	readonly
5594	13	14	0	4	f	f	WorkflowPermission	47	readonly
5595	13	15	0	4	f	f	WorkflowPermission	7	readonly
5596	13	15	0	4	f	f	WorkflowPermission	48	readonly
5597	13	15	0	4	f	f	WorkflowPermission	9	readonly
5598	13	15	0	4	f	f	WorkflowPermission	49	readonly
5599	13	15	0	4	f	f	WorkflowPermission	50	readonly
5600	13	15	0	4	f	f	WorkflowPermission	51	readonly
5601	13	15	0	4	f	f	WorkflowPermission	52	readonly
5602	13	15	0	4	f	f	WorkflowPermission	53	readonly
5603	13	15	0	4	f	f	WorkflowPermission	54	readonly
5604	13	15	0	4	f	f	WorkflowPermission	55	readonly
5605	13	15	0	4	f	f	WorkflowPermission	56	readonly
5606	13	15	0	4	f	f	WorkflowPermission	46	readonly
5607	13	15	0	4	f	f	WorkflowPermission	47	readonly
5614	13	12	0	4	f	f	WorkflowPermission	6	required
5635	13	13	0	4	f	f	WorkflowPermission	6	readonly
5648	13	14	0	4	f	f	WorkflowPermission	project_id	readonly
5649	13	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
5650	13	14	0	4	f	f	WorkflowPermission	subject	readonly
5651	13	14	0	4	f	f	WorkflowPermission	priority_id	readonly
5652	13	14	0	4	f	f	WorkflowPermission	is_private	readonly
5653	13	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
5654	13	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
5655	13	14	0	4	f	f	WorkflowPermission	description	readonly
5656	13	14	0	4	f	f	WorkflowPermission	2	readonly
5657	13	14	0	4	f	f	WorkflowPermission	3	readonly
5658	13	14	0	4	f	f	WorkflowPermission	4	readonly
5659	13	14	0	4	f	f	WorkflowPermission	5	readonly
5660	13	14	0	4	f	f	WorkflowPermission	6	readonly
5661	13	14	0	4	f	f	WorkflowPermission	23	readonly
5662	13	14	0	4	f	f	WorkflowPermission	38	readonly
5663	13	14	0	4	f	f	WorkflowPermission	39	readonly
5664	13	14	0	4	f	f	WorkflowPermission	40	readonly
5665	13	14	0	4	f	f	WorkflowPermission	41	readonly
5666	13	14	0	4	f	f	WorkflowPermission	57	readonly
5667	13	14	0	4	f	f	WorkflowPermission	58	readonly
5668	13	14	0	4	f	f	WorkflowPermission	25	readonly
5669	13	14	0	4	f	f	WorkflowPermission	26	readonly
5670	13	14	0	4	f	f	WorkflowPermission	27	readonly
5671	13	14	0	4	f	f	WorkflowPermission	28	readonly
5672	13	14	0	4	f	f	WorkflowPermission	29	readonly
5685	13	15	0	4	f	f	WorkflowPermission	6	readonly
5698	13	4	6	5	f	f	WorkflowTransition	\N	\N
5699	13	4	15	5	f	f	WorkflowTransition	\N	\N
5700	13	6	4	5	f	f	WorkflowTransition	\N	\N
5701	13	6	7	5	f	f	WorkflowTransition	\N	\N
5702	13	6	8	5	f	f	WorkflowTransition	\N	\N
5703	13	6	9	5	f	f	WorkflowTransition	\N	\N
5704	13	6	10	5	f	f	WorkflowTransition	\N	\N
5705	13	6	11	5	f	f	WorkflowTransition	\N	\N
5706	13	6	12	5	f	f	WorkflowTransition	\N	\N
5707	13	6	15	5	f	f	WorkflowTransition	\N	\N
5708	13	7	6	5	f	f	WorkflowTransition	\N	\N
5709	13	7	8	5	f	f	WorkflowTransition	\N	\N
5710	13	7	9	5	f	f	WorkflowTransition	\N	\N
5711	13	7	10	5	f	f	WorkflowTransition	\N	\N
5712	13	7	11	5	f	f	WorkflowTransition	\N	\N
5713	13	7	12	5	f	f	WorkflowTransition	\N	\N
5714	13	7	15	5	f	f	WorkflowTransition	\N	\N
5715	13	8	6	5	f	f	WorkflowTransition	\N	\N
5716	13	8	7	5	f	f	WorkflowTransition	\N	\N
5717	13	8	9	5	f	f	WorkflowTransition	\N	\N
5718	13	8	10	5	f	f	WorkflowTransition	\N	\N
5719	13	8	11	5	f	f	WorkflowTransition	\N	\N
5720	13	8	12	5	f	f	WorkflowTransition	\N	\N
5721	13	8	15	5	f	f	WorkflowTransition	\N	\N
5722	13	9	6	5	f	f	WorkflowTransition	\N	\N
5723	13	9	7	5	f	f	WorkflowTransition	\N	\N
5724	13	9	8	5	f	f	WorkflowTransition	\N	\N
5725	13	9	10	5	f	f	WorkflowTransition	\N	\N
5726	13	9	11	5	f	f	WorkflowTransition	\N	\N
5727	13	9	12	5	f	f	WorkflowTransition	\N	\N
5728	13	9	15	5	f	f	WorkflowTransition	\N	\N
5729	13	10	6	5	f	f	WorkflowTransition	\N	\N
5730	13	10	7	5	f	f	WorkflowTransition	\N	\N
5731	13	10	8	5	f	f	WorkflowTransition	\N	\N
5732	13	10	9	5	f	f	WorkflowTransition	\N	\N
5733	13	10	11	5	f	f	WorkflowTransition	\N	\N
5734	13	10	12	5	f	f	WorkflowTransition	\N	\N
5735	13	10	15	5	f	f	WorkflowTransition	\N	\N
5736	13	11	6	5	f	f	WorkflowTransition	\N	\N
5737	13	11	7	5	f	f	WorkflowTransition	\N	\N
5738	13	11	8	5	f	f	WorkflowTransition	\N	\N
5739	13	11	9	5	f	f	WorkflowTransition	\N	\N
5740	13	11	10	5	f	f	WorkflowTransition	\N	\N
5741	13	11	12	5	f	f	WorkflowTransition	\N	\N
5742	13	11	15	5	f	f	WorkflowTransition	\N	\N
5743	13	15	0	5	f	f	WorkflowPermission	7	readonly
5744	13	15	0	5	f	f	WorkflowPermission	48	readonly
5745	13	15	0	5	f	f	WorkflowPermission	9	readonly
5746	13	15	0	5	f	f	WorkflowPermission	49	readonly
5747	13	15	0	5	f	f	WorkflowPermission	50	readonly
5748	13	15	0	5	f	f	WorkflowPermission	51	readonly
5749	13	15	0	5	f	f	WorkflowPermission	52	readonly
5750	13	15	0	5	f	f	WorkflowPermission	53	readonly
5751	13	15	0	5	f	f	WorkflowPermission	54	readonly
5752	13	15	0	5	f	f	WorkflowPermission	55	readonly
5753	13	15	0	5	f	f	WorkflowPermission	56	readonly
5754	13	15	0	5	f	f	WorkflowPermission	46	readonly
5755	13	15	0	5	f	f	WorkflowPermission	47	readonly
5756	13	12	0	5	f	f	WorkflowPermission	7	required
5757	13	12	0	5	f	f	WorkflowPermission	48	required
5758	13	12	0	5	f	f	WorkflowPermission	9	required
5759	13	12	0	5	f	f	WorkflowPermission	49	required
5760	13	12	0	5	f	f	WorkflowPermission	50	required
5761	13	12	0	5	f	f	WorkflowPermission	51	required
5762	13	12	0	5	f	f	WorkflowPermission	52	required
5763	13	12	0	5	f	f	WorkflowPermission	53	required
5764	13	12	0	5	f	f	WorkflowPermission	54	required
5765	13	12	0	5	f	f	WorkflowPermission	55	required
5766	13	12	0	5	f	f	WorkflowPermission	56	required
5767	13	12	0	5	f	f	WorkflowPermission	46	required
5768	13	12	0	5	f	f	WorkflowPermission	47	required
5769	13	13	0	5	f	f	WorkflowPermission	7	readonly
5770	13	13	0	5	f	f	WorkflowPermission	48	readonly
5771	13	13	0	5	f	f	WorkflowPermission	9	readonly
5772	13	13	0	5	f	f	WorkflowPermission	49	readonly
5773	13	13	0	5	f	f	WorkflowPermission	50	readonly
5774	13	13	0	5	f	f	WorkflowPermission	51	readonly
5775	13	13	0	5	f	f	WorkflowPermission	52	readonly
5776	13	13	0	5	f	f	WorkflowPermission	53	readonly
5777	13	13	0	5	f	f	WorkflowPermission	54	readonly
5778	13	13	0	5	f	f	WorkflowPermission	55	readonly
5779	13	13	0	5	f	f	WorkflowPermission	56	readonly
5780	13	13	0	5	f	f	WorkflowPermission	46	readonly
5781	13	13	0	5	f	f	WorkflowPermission	47	readonly
5782	13	14	0	5	f	f	WorkflowPermission	7	readonly
5783	13	14	0	5	f	f	WorkflowPermission	48	readonly
5784	13	14	0	5	f	f	WorkflowPermission	9	readonly
5785	13	14	0	5	f	f	WorkflowPermission	49	readonly
5786	13	14	0	5	f	f	WorkflowPermission	50	readonly
5787	13	14	0	5	f	f	WorkflowPermission	51	readonly
5788	13	14	0	5	f	f	WorkflowPermission	52	readonly
5789	13	14	0	5	f	f	WorkflowPermission	53	readonly
5790	13	14	0	5	f	f	WorkflowPermission	54	readonly
5791	13	14	0	5	f	f	WorkflowPermission	55	readonly
5792	13	14	0	5	f	f	WorkflowPermission	56	readonly
5793	13	14	0	5	f	f	WorkflowPermission	46	readonly
5794	13	14	0	5	f	f	WorkflowPermission	47	readonly
5801	13	12	0	5	f	f	WorkflowPermission	6	required
5822	13	13	0	5	f	f	WorkflowPermission	6	readonly
5835	13	14	0	5	f	f	WorkflowPermission	project_id	readonly
5836	13	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
5837	13	14	0	5	f	f	WorkflowPermission	subject	readonly
5838	13	14	0	5	f	f	WorkflowPermission	priority_id	readonly
5839	13	14	0	5	f	f	WorkflowPermission	is_private	readonly
5840	13	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
5841	13	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
5842	13	14	0	5	f	f	WorkflowPermission	description	readonly
5843	13	14	0	5	f	f	WorkflowPermission	2	readonly
5844	13	14	0	5	f	f	WorkflowPermission	3	readonly
5845	13	14	0	5	f	f	WorkflowPermission	4	readonly
5846	13	14	0	5	f	f	WorkflowPermission	5	readonly
5847	13	14	0	5	f	f	WorkflowPermission	6	readonly
5848	13	14	0	5	f	f	WorkflowPermission	23	readonly
5849	13	14	0	5	f	f	WorkflowPermission	38	readonly
5850	13	14	0	5	f	f	WorkflowPermission	39	readonly
5851	13	14	0	5	f	f	WorkflowPermission	40	readonly
5852	13	14	0	5	f	f	WorkflowPermission	41	readonly
5853	13	14	0	5	f	f	WorkflowPermission	57	readonly
5854	13	14	0	5	f	f	WorkflowPermission	58	readonly
5855	13	14	0	5	f	f	WorkflowPermission	25	readonly
5856	13	14	0	5	f	f	WorkflowPermission	26	readonly
5857	13	14	0	5	f	f	WorkflowPermission	27	readonly
5858	13	14	0	5	f	f	WorkflowPermission	28	readonly
5859	13	14	0	5	f	f	WorkflowPermission	29	readonly
5872	13	15	0	5	f	f	WorkflowPermission	6	readonly
5885	14	12	0	4	f	f	WorkflowPermission	7	required
5886	14	12	4	4	f	f	WorkflowTransition	\N	\N
5887	14	13	4	4	f	f	WorkflowTransition	\N	\N
5888	14	15	4	4	f	f	WorkflowTransition	\N	\N
5889	14	4	6	4	f	f	WorkflowTransition	\N	\N
5890	14	4	15	4	f	f	WorkflowTransition	\N	\N
5891	14	6	7	4	f	f	WorkflowTransition	\N	\N
5892	14	6	8	4	f	f	WorkflowTransition	\N	\N
5893	14	6	9	4	f	f	WorkflowTransition	\N	\N
5894	14	6	10	4	f	f	WorkflowTransition	\N	\N
5895	14	6	11	4	f	f	WorkflowTransition	\N	\N
5896	14	6	12	4	f	f	WorkflowTransition	\N	\N
5897	14	6	13	4	f	f	WorkflowTransition	\N	\N
5898	14	6	15	4	f	f	WorkflowTransition	\N	\N
5899	14	7	15	4	f	f	WorkflowTransition	\N	\N
5900	14	8	15	4	f	f	WorkflowTransition	\N	\N
5901	14	9	15	4	f	f	WorkflowTransition	\N	\N
5902	14	10	15	4	f	f	WorkflowTransition	\N	\N
5903	14	11	15	4	f	f	WorkflowTransition	\N	\N
5904	14	12	15	4	f	f	WorkflowTransition	\N	\N
5905	14	13	6	4	f	f	WorkflowTransition	\N	\N
5906	14	13	15	4	f	f	WorkflowTransition	\N	\N
5907	14	15	6	4	f	f	WorkflowTransition	\N	\N
5908	14	7	8	4	f	f	WorkflowTransition	\N	\N
5909	14	7	9	4	f	f	WorkflowTransition	\N	\N
5910	14	7	10	4	f	f	WorkflowTransition	\N	\N
5911	14	7	11	4	f	f	WorkflowTransition	\N	\N
5912	14	7	12	4	f	f	WorkflowTransition	\N	\N
5913	14	7	13	4	f	f	WorkflowTransition	\N	\N
5914	14	8	9	4	f	f	WorkflowTransition	\N	\N
5915	14	8	10	4	f	f	WorkflowTransition	\N	\N
5916	14	8	11	4	f	f	WorkflowTransition	\N	\N
5917	14	8	12	4	f	f	WorkflowTransition	\N	\N
5918	14	8	13	4	f	f	WorkflowTransition	\N	\N
5919	14	9	10	4	f	f	WorkflowTransition	\N	\N
5920	14	9	11	4	f	f	WorkflowTransition	\N	\N
5921	14	9	12	4	f	f	WorkflowTransition	\N	\N
5922	14	9	13	4	f	f	WorkflowTransition	\N	\N
5923	14	10	11	4	f	f	WorkflowTransition	\N	\N
5924	14	10	12	4	f	f	WorkflowTransition	\N	\N
5925	14	10	13	4	f	f	WorkflowTransition	\N	\N
5926	14	11	12	4	f	f	WorkflowTransition	\N	\N
5927	14	11	13	4	f	f	WorkflowTransition	\N	\N
5928	14	12	13	4	f	f	WorkflowTransition	\N	\N
5929	14	11	6	4	f	f	WorkflowTransition	\N	\N
5930	14	12	0	4	f	f	WorkflowPermission	48	required
5931	14	12	0	4	f	f	WorkflowPermission	9	required
5932	14	12	0	4	f	f	WorkflowPermission	34	required
5933	14	12	0	4	f	f	WorkflowPermission	35	required
5934	14	12	0	4	f	f	WorkflowPermission	36	required
5935	14	12	0	4	f	f	WorkflowPermission	37	readonly
5936	14	12	0	4	f	f	WorkflowPermission	42	required
5937	14	12	0	4	f	f	WorkflowPermission	43	required
5938	14	12	0	4	f	f	WorkflowPermission	44	required
5939	14	12	0	4	f	f	WorkflowPermission	45	required
5940	14	12	0	4	f	f	WorkflowPermission	25	required
5941	14	12	0	4	f	f	WorkflowPermission	46	required
5942	14	12	0	4	f	f	WorkflowPermission	47	required
5943	14	13	0	4	f	f	WorkflowPermission	7	readonly
5944	14	13	0	4	f	f	WorkflowPermission	48	readonly
5945	14	13	0	4	f	f	WorkflowPermission	9	readonly
5946	14	13	0	4	f	f	WorkflowPermission	34	readonly
5947	14	13	0	4	f	f	WorkflowPermission	35	readonly
5948	14	13	0	4	f	f	WorkflowPermission	36	readonly
5949	14	13	0	4	f	f	WorkflowPermission	37	readonly
5950	14	13	0	4	f	f	WorkflowPermission	42	readonly
5951	14	13	0	4	f	f	WorkflowPermission	43	readonly
5952	14	13	0	4	f	f	WorkflowPermission	44	readonly
5953	14	13	0	4	f	f	WorkflowPermission	45	readonly
5954	14	13	0	4	f	f	WorkflowPermission	25	readonly
5955	14	13	0	4	f	f	WorkflowPermission	46	readonly
5956	14	13	0	4	f	f	WorkflowPermission	47	readonly
5957	14	14	0	4	f	f	WorkflowPermission	project_id	readonly
5958	14	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
5959	14	14	0	4	f	f	WorkflowPermission	subject	readonly
5960	14	14	0	4	f	f	WorkflowPermission	priority_id	readonly
5961	14	14	0	4	f	f	WorkflowPermission	is_private	readonly
5962	14	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
5963	14	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
5964	14	14	0	4	f	f	WorkflowPermission	description	readonly
5965	14	14	0	4	f	f	WorkflowPermission	2	readonly
5966	14	14	0	4	f	f	WorkflowPermission	3	readonly
5967	14	14	0	4	f	f	WorkflowPermission	4	readonly
5968	14	14	0	4	f	f	WorkflowPermission	5	readonly
5969	14	14	0	4	f	f	WorkflowPermission	7	readonly
5970	14	14	0	4	f	f	WorkflowPermission	48	readonly
5971	14	14	0	4	f	f	WorkflowPermission	9	readonly
5972	14	14	0	4	f	f	WorkflowPermission	34	readonly
5973	14	14	0	4	f	f	WorkflowPermission	35	readonly
5974	14	14	0	4	f	f	WorkflowPermission	36	readonly
5975	14	14	0	4	f	f	WorkflowPermission	37	readonly
5976	14	14	0	4	f	f	WorkflowPermission	38	readonly
5977	14	14	0	4	f	f	WorkflowPermission	39	readonly
5978	14	14	0	4	f	f	WorkflowPermission	40	readonly
5979	14	14	0	4	f	f	WorkflowPermission	41	readonly
5980	14	14	0	4	f	f	WorkflowPermission	42	readonly
5981	14	14	0	4	f	f	WorkflowPermission	43	readonly
5982	14	14	0	4	f	f	WorkflowPermission	44	readonly
5983	14	14	0	4	f	f	WorkflowPermission	45	readonly
5984	14	14	0	4	f	f	WorkflowPermission	25	readonly
5985	14	14	0	4	f	f	WorkflowPermission	46	readonly
5986	14	14	0	4	f	f	WorkflowPermission	47	readonly
5987	14	14	0	4	f	f	WorkflowPermission	26	readonly
5988	14	14	0	4	f	f	WorkflowPermission	27	readonly
5989	14	14	0	4	f	f	WorkflowPermission	28	readonly
5990	14	14	0	4	f	f	WorkflowPermission	29	readonly
5991	14	15	0	4	f	f	WorkflowPermission	7	readonly
5992	14	15	0	4	f	f	WorkflowPermission	48	readonly
5993	14	15	0	4	f	f	WorkflowPermission	9	readonly
5994	14	15	0	4	f	f	WorkflowPermission	34	readonly
5995	14	15	0	4	f	f	WorkflowPermission	35	readonly
5996	14	15	0	4	f	f	WorkflowPermission	36	readonly
5997	14	15	0	4	f	f	WorkflowPermission	37	readonly
5998	14	15	0	4	f	f	WorkflowPermission	42	readonly
5999	14	15	0	4	f	f	WorkflowPermission	43	readonly
6000	14	15	0	4	f	f	WorkflowPermission	44	readonly
6001	14	15	0	4	f	f	WorkflowPermission	45	readonly
6002	14	15	0	4	f	f	WorkflowPermission	25	readonly
6003	14	15	0	4	f	f	WorkflowPermission	46	readonly
6004	14	15	0	4	f	f	WorkflowPermission	47	readonly
6005	14	7	6	4	f	f	WorkflowTransition	\N	\N
6006	14	8	6	4	f	f	WorkflowTransition	\N	\N
6007	14	8	7	4	f	f	WorkflowTransition	\N	\N
6008	14	9	6	4	f	f	WorkflowTransition	\N	\N
6009	14	9	7	4	f	f	WorkflowTransition	\N	\N
6010	14	9	8	4	f	f	WorkflowTransition	\N	\N
6011	14	10	6	4	f	f	WorkflowTransition	\N	\N
6012	14	10	7	4	f	f	WorkflowTransition	\N	\N
6013	14	10	8	4	f	f	WorkflowTransition	\N	\N
6014	14	10	9	4	f	f	WorkflowTransition	\N	\N
6015	14	11	7	4	f	f	WorkflowTransition	\N	\N
6016	14	11	8	4	f	f	WorkflowTransition	\N	\N
6017	14	11	9	4	f	f	WorkflowTransition	\N	\N
6018	14	11	10	4	f	f	WorkflowTransition	\N	\N
6034	14	12	0	4	f	f	WorkflowPermission	62	required
6042	14	13	0	4	f	f	WorkflowPermission	description	readonly
6056	14	13	0	4	f	f	WorkflowPermission	62	readonly
6068	14	15	0	4	f	f	WorkflowPermission	description	readonly
6082	14	15	0	4	f	f	WorkflowPermission	62	readonly
6087	14	15	0	5	f	f	WorkflowPermission	7	readonly
6088	14	15	0	5	f	f	WorkflowPermission	48	readonly
6089	14	15	0	5	f	f	WorkflowPermission	9	readonly
6090	14	15	0	5	f	f	WorkflowPermission	34	readonly
6091	14	15	0	5	f	f	WorkflowPermission	35	readonly
6092	14	15	0	5	f	f	WorkflowPermission	36	readonly
6093	14	15	0	5	f	f	WorkflowPermission	37	readonly
6094	14	15	0	5	f	f	WorkflowPermission	42	readonly
6095	14	15	0	5	f	f	WorkflowPermission	43	readonly
6096	14	15	0	5	f	f	WorkflowPermission	44	readonly
6097	14	15	0	5	f	f	WorkflowPermission	45	readonly
6098	14	15	0	5	f	f	WorkflowPermission	25	readonly
6099	14	15	0	5	f	f	WorkflowPermission	46	readonly
6100	14	15	0	5	f	f	WorkflowPermission	47	readonly
6101	14	4	6	5	f	f	WorkflowTransition	\N	\N
6102	14	6	4	5	f	f	WorkflowTransition	\N	\N
6103	14	6	7	5	f	f	WorkflowTransition	\N	\N
6104	14	6	8	5	f	f	WorkflowTransition	\N	\N
6105	14	6	9	5	f	f	WorkflowTransition	\N	\N
6106	14	6	10	5	f	f	WorkflowTransition	\N	\N
6107	14	6	11	5	f	f	WorkflowTransition	\N	\N
6108	14	6	12	5	f	f	WorkflowTransition	\N	\N
6109	14	6	15	5	f	f	WorkflowTransition	\N	\N
6110	14	7	6	5	f	f	WorkflowTransition	\N	\N
6111	14	7	8	5	f	f	WorkflowTransition	\N	\N
6112	14	7	9	5	f	f	WorkflowTransition	\N	\N
6113	14	7	10	5	f	f	WorkflowTransition	\N	\N
6114	14	12	0	5	f	f	WorkflowPermission	7	required
6115	14	12	0	5	f	f	WorkflowPermission	48	required
6116	14	12	0	5	f	f	WorkflowPermission	9	required
6117	14	12	0	5	f	f	WorkflowPermission	34	required
6118	14	12	0	5	f	f	WorkflowPermission	35	required
6119	14	12	0	5	f	f	WorkflowPermission	36	required
6120	14	12	0	5	f	f	WorkflowPermission	37	required
6121	14	12	0	5	f	f	WorkflowPermission	42	required
6122	14	12	0	5	f	f	WorkflowPermission	43	required
6123	14	12	0	5	f	f	WorkflowPermission	44	required
6124	14	12	0	5	f	f	WorkflowPermission	45	required
6125	14	12	0	5	f	f	WorkflowPermission	25	required
6126	14	12	0	5	f	f	WorkflowPermission	46	required
6127	14	12	0	5	f	f	WorkflowPermission	47	required
6128	14	13	0	5	f	f	WorkflowPermission	7	readonly
6129	14	13	0	5	f	f	WorkflowPermission	48	readonly
6130	14	13	0	5	f	f	WorkflowPermission	9	readonly
6131	14	13	0	5	f	f	WorkflowPermission	34	readonly
6132	14	13	0	5	f	f	WorkflowPermission	35	readonly
6133	14	13	0	5	f	f	WorkflowPermission	36	readonly
6134	14	13	0	5	f	f	WorkflowPermission	37	readonly
6135	14	13	0	5	f	f	WorkflowPermission	42	readonly
6136	14	13	0	5	f	f	WorkflowPermission	43	readonly
6137	14	13	0	5	f	f	WorkflowPermission	44	readonly
6138	14	13	0	5	f	f	WorkflowPermission	45	readonly
6139	14	13	0	5	f	f	WorkflowPermission	25	readonly
6140	14	13	0	5	f	f	WorkflowPermission	46	readonly
6141	14	13	0	5	f	f	WorkflowPermission	47	readonly
6142	14	14	0	5	f	f	WorkflowPermission	project_id	readonly
6143	14	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
6144	14	14	0	5	f	f	WorkflowPermission	subject	readonly
6145	14	14	0	5	f	f	WorkflowPermission	priority_id	readonly
6146	14	14	0	5	f	f	WorkflowPermission	is_private	readonly
6147	14	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
6148	14	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
6149	14	14	0	5	f	f	WorkflowPermission	description	readonly
6150	14	14	0	5	f	f	WorkflowPermission	2	readonly
6151	14	14	0	5	f	f	WorkflowPermission	3	readonly
6152	14	14	0	5	f	f	WorkflowPermission	4	readonly
6153	14	14	0	5	f	f	WorkflowPermission	5	readonly
6154	14	14	0	5	f	f	WorkflowPermission	7	readonly
6155	14	14	0	5	f	f	WorkflowPermission	48	readonly
6156	14	14	0	5	f	f	WorkflowPermission	9	readonly
6157	14	14	0	5	f	f	WorkflowPermission	34	readonly
6158	14	14	0	5	f	f	WorkflowPermission	35	readonly
6159	14	14	0	5	f	f	WorkflowPermission	36	readonly
6160	14	14	0	5	f	f	WorkflowPermission	37	readonly
6161	14	14	0	5	f	f	WorkflowPermission	38	readonly
6162	14	14	0	5	f	f	WorkflowPermission	39	readonly
6163	14	14	0	5	f	f	WorkflowPermission	40	readonly
6164	14	14	0	5	f	f	WorkflowPermission	41	readonly
6165	14	14	0	5	f	f	WorkflowPermission	42	readonly
6166	14	14	0	5	f	f	WorkflowPermission	43	readonly
6167	14	14	0	5	f	f	WorkflowPermission	44	readonly
6168	14	14	0	5	f	f	WorkflowPermission	45	readonly
6169	14	14	0	5	f	f	WorkflowPermission	25	readonly
6170	14	14	0	5	f	f	WorkflowPermission	46	readonly
6171	14	14	0	5	f	f	WorkflowPermission	47	readonly
6172	14	14	0	5	f	f	WorkflowPermission	26	readonly
6173	14	14	0	5	f	f	WorkflowPermission	27	readonly
6174	14	14	0	5	f	f	WorkflowPermission	28	readonly
6175	14	14	0	5	f	f	WorkflowPermission	29	readonly
6176	14	7	11	5	f	f	WorkflowTransition	\N	\N
6177	14	7	12	5	f	f	WorkflowTransition	\N	\N
6178	14	7	15	5	f	f	WorkflowTransition	\N	\N
6179	14	8	6	5	f	f	WorkflowTransition	\N	\N
6180	14	8	7	5	f	f	WorkflowTransition	\N	\N
6181	14	8	9	5	f	f	WorkflowTransition	\N	\N
6182	14	8	10	5	f	f	WorkflowTransition	\N	\N
6183	14	8	11	5	f	f	WorkflowTransition	\N	\N
6184	14	8	12	5	f	f	WorkflowTransition	\N	\N
6185	14	8	15	5	f	f	WorkflowTransition	\N	\N
6186	14	9	6	5	f	f	WorkflowTransition	\N	\N
6187	14	9	7	5	f	f	WorkflowTransition	\N	\N
6188	14	9	8	5	f	f	WorkflowTransition	\N	\N
6189	14	9	10	5	f	f	WorkflowTransition	\N	\N
6190	14	9	11	5	f	f	WorkflowTransition	\N	\N
6191	14	9	12	5	f	f	WorkflowTransition	\N	\N
6192	14	9	15	5	f	f	WorkflowTransition	\N	\N
6193	14	10	6	5	f	f	WorkflowTransition	\N	\N
6194	14	10	7	5	f	f	WorkflowTransition	\N	\N
6195	14	10	8	5	f	f	WorkflowTransition	\N	\N
6196	14	10	9	5	f	f	WorkflowTransition	\N	\N
6197	14	10	11	5	f	f	WorkflowTransition	\N	\N
6198	14	10	12	5	f	f	WorkflowTransition	\N	\N
6199	14	10	15	5	f	f	WorkflowTransition	\N	\N
6200	14	11	6	5	f	f	WorkflowTransition	\N	\N
6201	14	11	7	5	f	f	WorkflowTransition	\N	\N
6202	14	11	8	5	f	f	WorkflowTransition	\N	\N
6203	14	11	9	5	f	f	WorkflowTransition	\N	\N
6204	14	11	10	5	f	f	WorkflowTransition	\N	\N
6205	14	11	12	5	f	f	WorkflowTransition	\N	\N
6206	14	4	15	5	f	f	WorkflowTransition	\N	\N
6207	14	11	15	5	f	f	WorkflowTransition	\N	\N
6223	14	12	0	5	f	f	WorkflowPermission	62	required
6231	14	13	0	5	f	f	WorkflowPermission	description	readonly
6245	14	13	0	5	f	f	WorkflowPermission	62	readonly
6257	14	15	0	5	f	f	WorkflowPermission	description	readonly
6271	14	15	0	5	f	f	WorkflowPermission	62	readonly
6276	15	12	4	4	f	f	WorkflowTransition	\N	\N
6277	15	13	4	4	f	f	WorkflowTransition	\N	\N
6278	15	14	4	4	f	f	WorkflowTransition	\N	\N
6279	15	15	4	4	f	f	WorkflowTransition	\N	\N
6280	15	4	5	4	f	f	WorkflowTransition	\N	\N
6281	15	4	6	4	f	f	WorkflowTransition	\N	\N
6282	15	4	14	4	f	f	WorkflowTransition	\N	\N
6283	15	4	15	4	f	f	WorkflowTransition	\N	\N
6284	15	5	6	4	f	f	WorkflowTransition	\N	\N
6285	15	5	14	4	f	f	WorkflowTransition	\N	\N
6286	15	5	15	4	f	f	WorkflowTransition	\N	\N
6287	15	6	7	4	f	f	WorkflowTransition	\N	\N
6288	15	6	8	4	f	f	WorkflowTransition	\N	\N
6289	15	6	9	4	f	f	WorkflowTransition	\N	\N
6290	15	6	10	4	f	f	WorkflowTransition	\N	\N
6291	15	6	11	4	f	f	WorkflowTransition	\N	\N
6292	15	6	12	4	f	f	WorkflowTransition	\N	\N
6293	15	6	13	4	f	f	WorkflowTransition	\N	\N
6294	15	6	14	4	f	f	WorkflowTransition	\N	\N
6295	15	6	15	4	f	f	WorkflowTransition	\N	\N
6296	15	7	14	4	f	f	WorkflowTransition	\N	\N
6297	15	7	15	4	f	f	WorkflowTransition	\N	\N
6298	15	8	14	4	f	f	WorkflowTransition	\N	\N
6299	15	8	15	4	f	f	WorkflowTransition	\N	\N
6300	15	9	14	4	f	f	WorkflowTransition	\N	\N
6301	15	9	15	4	f	f	WorkflowTransition	\N	\N
6302	15	10	14	4	f	f	WorkflowTransition	\N	\N
6303	15	10	15	4	f	f	WorkflowTransition	\N	\N
6304	15	11	14	4	f	f	WorkflowTransition	\N	\N
6305	15	11	15	4	f	f	WorkflowTransition	\N	\N
6306	15	12	14	4	f	f	WorkflowTransition	\N	\N
6307	15	12	15	4	f	f	WorkflowTransition	\N	\N
6308	15	13	6	4	f	f	WorkflowTransition	\N	\N
6309	15	13	14	4	f	f	WorkflowTransition	\N	\N
6310	15	13	15	4	f	f	WorkflowTransition	\N	\N
6311	15	14	6	4	f	f	WorkflowTransition	\N	\N
6312	15	14	15	4	f	f	WorkflowTransition	\N	\N
6313	15	15	6	4	f	f	WorkflowTransition	\N	\N
6314	15	6	5	4	f	f	WorkflowTransition	\N	\N
6315	15	7	8	4	f	f	WorkflowTransition	\N	\N
6316	15	7	9	4	f	f	WorkflowTransition	\N	\N
6317	15	7	10	4	f	f	WorkflowTransition	\N	\N
6318	15	7	11	4	f	f	WorkflowTransition	\N	\N
6319	15	7	12	4	f	f	WorkflowTransition	\N	\N
6320	15	7	13	4	f	f	WorkflowTransition	\N	\N
6321	15	8	9	4	f	f	WorkflowTransition	\N	\N
6322	15	8	10	4	f	f	WorkflowTransition	\N	\N
6323	15	8	11	4	f	f	WorkflowTransition	\N	\N
6324	15	8	12	4	f	f	WorkflowTransition	\N	\N
6325	15	8	13	4	f	f	WorkflowTransition	\N	\N
6326	15	9	10	4	f	f	WorkflowTransition	\N	\N
6327	15	9	11	4	f	f	WorkflowTransition	\N	\N
6328	15	9	12	4	f	f	WorkflowTransition	\N	\N
6329	15	9	13	4	f	f	WorkflowTransition	\N	\N
6330	15	10	11	4	f	f	WorkflowTransition	\N	\N
6331	15	10	12	4	f	f	WorkflowTransition	\N	\N
6332	15	10	13	4	f	f	WorkflowTransition	\N	\N
6333	15	11	12	4	f	f	WorkflowTransition	\N	\N
6334	15	11	13	4	f	f	WorkflowTransition	\N	\N
6335	15	12	13	4	f	f	WorkflowTransition	\N	\N
6336	15	11	6	4	f	f	WorkflowTransition	\N	\N
6337	15	7	6	4	f	f	WorkflowTransition	\N	\N
6338	15	8	6	4	f	f	WorkflowTransition	\N	\N
6339	15	8	7	4	f	f	WorkflowTransition	\N	\N
6340	15	9	6	4	f	f	WorkflowTransition	\N	\N
6341	15	9	7	4	f	f	WorkflowTransition	\N	\N
6342	15	9	8	4	f	f	WorkflowTransition	\N	\N
6343	15	10	6	4	f	f	WorkflowTransition	\N	\N
6344	15	10	7	4	f	f	WorkflowTransition	\N	\N
6345	15	10	8	4	f	f	WorkflowTransition	\N	\N
6346	15	10	9	4	f	f	WorkflowTransition	\N	\N
6347	15	11	7	4	f	f	WorkflowTransition	\N	\N
6348	15	11	8	4	f	f	WorkflowTransition	\N	\N
6349	15	11	9	4	f	f	WorkflowTransition	\N	\N
6350	15	11	10	4	f	f	WorkflowTransition	\N	\N
6351	15	12	0	4	f	f	WorkflowPermission	10	required
6352	15	12	0	4	f	f	WorkflowPermission	11	required
6353	15	12	0	4	f	f	WorkflowPermission	12	required
6354	15	12	0	4	f	f	WorkflowPermission	14	required
6355	15	13	0	4	f	f	WorkflowPermission	10	readonly
6356	15	13	0	4	f	f	WorkflowPermission	11	readonly
6357	15	13	0	4	f	f	WorkflowPermission	12	readonly
6358	15	13	0	4	f	f	WorkflowPermission	14	readonly
6359	15	14	0	4	f	f	WorkflowPermission	10	readonly
6360	15	14	0	4	f	f	WorkflowPermission	11	readonly
6361	15	14	0	4	f	f	WorkflowPermission	12	readonly
6362	15	14	0	4	f	f	WorkflowPermission	14	readonly
6363	15	15	0	4	f	f	WorkflowPermission	10	readonly
6364	15	15	0	4	f	f	WorkflowPermission	11	readonly
6365	15	15	0	4	f	f	WorkflowPermission	12	readonly
6366	15	15	0	4	f	f	WorkflowPermission	14	readonly
6373	15	12	0	4	f	f	WorkflowPermission	6	required
6374	15	12	0	4	f	f	WorkflowPermission	7	required
6375	15	12	0	4	f	f	WorkflowPermission	8	required
6376	15	12	0	4	f	f	WorkflowPermission	9	required
6378	15	12	0	4	f	f	WorkflowPermission	63	required
6379	15	12	0	4	f	f	WorkflowPermission	64	required
6380	15	12	0	4	f	f	WorkflowPermission	65	required
6381	15	12	0	4	f	f	WorkflowPermission	15	required
6382	15	12	0	4	f	f	WorkflowPermission	16	required
6383	15	12	0	4	f	f	WorkflowPermission	17	required
6384	15	12	0	4	f	f	WorkflowPermission	18	required
6385	15	12	0	4	f	f	WorkflowPermission	19	required
6386	15	12	0	4	f	f	WorkflowPermission	20	required
6387	15	12	0	4	f	f	WorkflowPermission	21	required
6388	15	12	0	4	f	f	WorkflowPermission	22	required
6389	15	12	0	4	f	f	WorkflowPermission	23	required
6391	15	12	0	4	f	f	WorkflowPermission	61	required
6392	15	12	0	4	f	f	WorkflowPermission	66	required
6393	15	12	0	4	f	f	WorkflowPermission	67	required
6394	15	12	0	4	f	f	WorkflowPermission	68	required
6395	15	12	0	4	f	f	WorkflowPermission	25	required
6408	15	13	0	4	f	f	WorkflowPermission	6	readonly
6409	15	13	0	4	f	f	WorkflowPermission	7	readonly
6410	15	13	0	4	f	f	WorkflowPermission	8	readonly
6411	15	13	0	4	f	f	WorkflowPermission	9	readonly
6413	15	13	0	4	f	f	WorkflowPermission	63	readonly
6414	15	13	0	4	f	f	WorkflowPermission	64	readonly
6415	15	13	0	4	f	f	WorkflowPermission	65	readonly
6416	15	13	0	4	f	f	WorkflowPermission	15	readonly
6417	15	13	0	4	f	f	WorkflowPermission	16	readonly
6418	15	13	0	4	f	f	WorkflowPermission	17	readonly
6419	15	13	0	4	f	f	WorkflowPermission	18	readonly
6420	15	13	0	4	f	f	WorkflowPermission	19	readonly
6421	15	13	0	4	f	f	WorkflowPermission	20	readonly
6422	15	13	0	4	f	f	WorkflowPermission	21	readonly
6423	15	13	0	4	f	f	WorkflowPermission	22	readonly
6424	15	13	0	4	f	f	WorkflowPermission	23	readonly
6426	15	13	0	4	f	f	WorkflowPermission	61	readonly
6427	15	13	0	4	f	f	WorkflowPermission	66	readonly
6428	15	13	0	4	f	f	WorkflowPermission	67	readonly
6429	15	13	0	4	f	f	WorkflowPermission	68	readonly
6430	15	13	0	4	f	f	WorkflowPermission	25	readonly
6431	15	13	0	4	f	f	WorkflowPermission	46	readonly
6432	15	13	0	4	f	f	WorkflowPermission	47	readonly
6433	15	13	0	4	f	f	WorkflowPermission	70	readonly
6453	15	14	0	4	f	f	WorkflowPermission	6	readonly
6454	15	14	0	4	f	f	WorkflowPermission	7	readonly
6455	15	14	0	4	f	f	WorkflowPermission	8	readonly
6456	15	14	0	4	f	f	WorkflowPermission	9	readonly
6458	15	14	0	4	f	f	WorkflowPermission	63	readonly
6459	15	14	0	4	f	f	WorkflowPermission	64	readonly
6460	15	14	0	4	f	f	WorkflowPermission	65	readonly
6461	15	14	0	4	f	f	WorkflowPermission	15	readonly
6462	15	14	0	4	f	f	WorkflowPermission	16	readonly
6463	15	14	0	4	f	f	WorkflowPermission	17	readonly
6464	15	14	0	4	f	f	WorkflowPermission	18	readonly
6465	15	14	0	4	f	f	WorkflowPermission	19	readonly
6466	15	14	0	4	f	f	WorkflowPermission	20	readonly
6467	15	14	0	4	f	f	WorkflowPermission	21	readonly
6468	15	14	0	4	f	f	WorkflowPermission	22	readonly
6469	15	14	0	4	f	f	WorkflowPermission	23	readonly
6471	15	14	0	4	f	f	WorkflowPermission	61	readonly
6472	15	14	0	4	f	f	WorkflowPermission	66	readonly
6473	15	14	0	4	f	f	WorkflowPermission	67	readonly
6474	15	14	0	4	f	f	WorkflowPermission	68	readonly
6475	15	14	0	4	f	f	WorkflowPermission	25	readonly
6476	15	14	0	4	f	f	WorkflowPermission	46	readonly
6477	15	14	0	4	f	f	WorkflowPermission	47	readonly
6478	15	14	0	4	f	f	WorkflowPermission	70	readonly
6498	15	15	0	4	f	f	WorkflowPermission	6	readonly
6499	15	15	0	4	f	f	WorkflowPermission	7	readonly
6500	15	15	0	4	f	f	WorkflowPermission	8	readonly
6501	15	15	0	4	f	f	WorkflowPermission	9	readonly
6503	15	15	0	4	f	f	WorkflowPermission	63	readonly
6504	15	15	0	4	f	f	WorkflowPermission	64	readonly
6505	15	15	0	4	f	f	WorkflowPermission	65	readonly
6506	15	15	0	4	f	f	WorkflowPermission	15	readonly
6507	15	15	0	4	f	f	WorkflowPermission	16	readonly
6508	15	15	0	4	f	f	WorkflowPermission	17	readonly
6509	15	15	0	4	f	f	WorkflowPermission	18	readonly
6510	15	15	0	4	f	f	WorkflowPermission	19	readonly
6511	15	15	0	4	f	f	WorkflowPermission	20	readonly
6512	15	15	0	4	f	f	WorkflowPermission	21	readonly
6513	15	15	0	4	f	f	WorkflowPermission	22	readonly
6514	15	15	0	4	f	f	WorkflowPermission	23	readonly
6516	15	15	0	4	f	f	WorkflowPermission	61	readonly
6517	15	15	0	4	f	f	WorkflowPermission	66	readonly
6518	15	15	0	4	f	f	WorkflowPermission	67	readonly
6519	15	15	0	4	f	f	WorkflowPermission	68	readonly
6520	15	15	0	4	f	f	WorkflowPermission	25	readonly
6521	15	15	0	4	f	f	WorkflowPermission	46	readonly
6522	15	15	0	4	f	f	WorkflowPermission	47	readonly
6523	15	15	0	4	f	f	WorkflowPermission	70	readonly
6531	15	14	4	5	f	f	WorkflowTransition	\N	\N
6532	15	15	4	5	f	f	WorkflowTransition	\N	\N
6533	15	4	5	5	f	f	WorkflowTransition	\N	\N
6534	15	4	6	5	f	f	WorkflowTransition	\N	\N
6535	15	4	14	5	f	f	WorkflowTransition	\N	\N
6536	15	4	15	5	f	f	WorkflowTransition	\N	\N
6537	15	5	6	5	f	f	WorkflowTransition	\N	\N
6538	15	5	14	5	f	f	WorkflowTransition	\N	\N
6539	15	5	15	5	f	f	WorkflowTransition	\N	\N
6540	15	6	7	5	f	f	WorkflowTransition	\N	\N
6541	15	6	8	5	f	f	WorkflowTransition	\N	\N
6542	15	6	9	5	f	f	WorkflowTransition	\N	\N
6543	15	6	10	5	f	f	WorkflowTransition	\N	\N
6544	15	6	11	5	f	f	WorkflowTransition	\N	\N
6545	15	6	12	5	f	f	WorkflowTransition	\N	\N
6546	15	6	14	5	f	f	WorkflowTransition	\N	\N
6547	15	6	15	5	f	f	WorkflowTransition	\N	\N
6548	15	7	14	5	f	f	WorkflowTransition	\N	\N
6549	15	7	15	5	f	f	WorkflowTransition	\N	\N
6550	15	8	14	5	f	f	WorkflowTransition	\N	\N
6551	15	8	15	5	f	f	WorkflowTransition	\N	\N
6552	15	9	14	5	f	f	WorkflowTransition	\N	\N
6553	15	9	15	5	f	f	WorkflowTransition	\N	\N
6554	15	10	14	5	f	f	WorkflowTransition	\N	\N
6555	15	10	15	5	f	f	WorkflowTransition	\N	\N
6556	15	11	14	5	f	f	WorkflowTransition	\N	\N
6557	15	11	15	5	f	f	WorkflowTransition	\N	\N
6558	15	12	14	5	f	f	WorkflowTransition	\N	\N
6559	15	12	15	5	f	f	WorkflowTransition	\N	\N
6560	15	14	6	5	f	f	WorkflowTransition	\N	\N
6561	15	14	15	5	f	f	WorkflowTransition	\N	\N
6562	15	15	6	5	f	f	WorkflowTransition	\N	\N
6563	15	6	5	5	f	f	WorkflowTransition	\N	\N
6564	15	7	8	5	f	f	WorkflowTransition	\N	\N
6565	15	7	9	5	f	f	WorkflowTransition	\N	\N
6566	15	7	10	5	f	f	WorkflowTransition	\N	\N
6567	15	7	11	5	f	f	WorkflowTransition	\N	\N
6568	15	7	12	5	f	f	WorkflowTransition	\N	\N
6569	15	8	9	5	f	f	WorkflowTransition	\N	\N
6570	15	8	10	5	f	f	WorkflowTransition	\N	\N
6571	15	8	11	5	f	f	WorkflowTransition	\N	\N
6572	15	8	12	5	f	f	WorkflowTransition	\N	\N
6573	15	9	10	5	f	f	WorkflowTransition	\N	\N
6574	15	9	11	5	f	f	WorkflowTransition	\N	\N
6575	15	9	12	5	f	f	WorkflowTransition	\N	\N
6576	15	10	11	5	f	f	WorkflowTransition	\N	\N
6577	15	10	12	5	f	f	WorkflowTransition	\N	\N
6578	15	11	12	5	f	f	WorkflowTransition	\N	\N
6579	15	11	6	5	f	f	WorkflowTransition	\N	\N
6580	15	7	6	5	f	f	WorkflowTransition	\N	\N
6581	15	8	6	5	f	f	WorkflowTransition	\N	\N
6582	15	9	6	5	f	f	WorkflowTransition	\N	\N
6583	15	9	7	5	f	f	WorkflowTransition	\N	\N
6584	15	9	8	5	f	f	WorkflowTransition	\N	\N
6585	15	10	6	5	f	f	WorkflowTransition	\N	\N
6586	15	10	7	5	f	f	WorkflowTransition	\N	\N
6587	15	10	8	5	f	f	WorkflowTransition	\N	\N
6588	15	10	9	5	f	f	WorkflowTransition	\N	\N
6589	15	11	7	5	f	f	WorkflowTransition	\N	\N
6590	15	11	8	5	f	f	WorkflowTransition	\N	\N
6591	15	11	9	5	f	f	WorkflowTransition	\N	\N
6592	15	11	10	5	f	f	WorkflowTransition	\N	\N
6593	15	8	7	5	f	f	WorkflowTransition	\N	\N
6594	15	12	0	5	f	f	WorkflowPermission	10	required
6595	15	12	0	5	f	f	WorkflowPermission	11	required
6596	15	12	0	5	f	f	WorkflowPermission	12	required
6597	15	12	0	5	f	f	WorkflowPermission	14	required
6598	15	13	0	5	f	f	WorkflowPermission	10	readonly
6599	15	13	0	5	f	f	WorkflowPermission	11	readonly
6600	15	13	0	5	f	f	WorkflowPermission	12	readonly
6601	15	13	0	5	f	f	WorkflowPermission	14	readonly
6602	15	14	0	5	f	f	WorkflowPermission	10	readonly
6603	15	14	0	5	f	f	WorkflowPermission	11	readonly
6604	15	14	0	5	f	f	WorkflowPermission	12	readonly
6605	15	14	0	5	f	f	WorkflowPermission	14	readonly
6606	15	15	0	5	f	f	WorkflowPermission	10	readonly
6607	15	15	0	5	f	f	WorkflowPermission	11	readonly
6608	15	15	0	5	f	f	WorkflowPermission	12	readonly
6609	15	15	0	5	f	f	WorkflowPermission	14	readonly
6616	15	12	0	5	f	f	WorkflowPermission	6	required
6617	15	12	0	5	f	f	WorkflowPermission	7	required
6618	15	12	0	5	f	f	WorkflowPermission	8	required
6619	15	12	0	5	f	f	WorkflowPermission	9	required
6621	15	12	0	5	f	f	WorkflowPermission	63	required
6622	15	12	0	5	f	f	WorkflowPermission	64	required
6623	15	12	0	5	f	f	WorkflowPermission	65	required
6624	15	12	0	5	f	f	WorkflowPermission	15	required
6625	15	12	0	5	f	f	WorkflowPermission	16	required
6626	15	12	0	5	f	f	WorkflowPermission	17	required
6627	15	12	0	5	f	f	WorkflowPermission	18	required
6628	15	12	0	5	f	f	WorkflowPermission	19	required
6629	15	12	0	5	f	f	WorkflowPermission	20	required
6630	15	12	0	5	f	f	WorkflowPermission	21	required
6631	15	12	0	5	f	f	WorkflowPermission	22	required
6632	15	12	0	5	f	f	WorkflowPermission	23	required
6634	15	12	0	5	f	f	WorkflowPermission	61	required
6635	15	12	0	5	f	f	WorkflowPermission	66	required
6636	15	12	0	5	f	f	WorkflowPermission	67	required
6637	15	12	0	5	f	f	WorkflowPermission	68	required
6638	15	12	0	5	f	f	WorkflowPermission	25	required
6651	15	13	0	5	f	f	WorkflowPermission	6	readonly
6652	15	13	0	5	f	f	WorkflowPermission	7	readonly
6653	15	13	0	5	f	f	WorkflowPermission	8	readonly
6654	15	13	0	5	f	f	WorkflowPermission	9	readonly
6656	15	13	0	5	f	f	WorkflowPermission	63	readonly
6657	15	13	0	5	f	f	WorkflowPermission	64	readonly
6658	15	13	0	5	f	f	WorkflowPermission	65	readonly
6659	15	13	0	5	f	f	WorkflowPermission	15	readonly
6660	15	13	0	5	f	f	WorkflowPermission	16	readonly
6661	15	13	0	5	f	f	WorkflowPermission	17	readonly
6662	15	13	0	5	f	f	WorkflowPermission	18	readonly
6663	15	13	0	5	f	f	WorkflowPermission	19	readonly
6664	15	13	0	5	f	f	WorkflowPermission	20	readonly
6665	15	13	0	5	f	f	WorkflowPermission	21	readonly
6666	15	13	0	5	f	f	WorkflowPermission	22	readonly
6667	15	13	0	5	f	f	WorkflowPermission	23	readonly
6669	15	13	0	5	f	f	WorkflowPermission	61	readonly
6670	15	13	0	5	f	f	WorkflowPermission	66	readonly
6671	15	13	0	5	f	f	WorkflowPermission	67	readonly
6672	15	13	0	5	f	f	WorkflowPermission	68	readonly
6673	15	13	0	5	f	f	WorkflowPermission	25	readonly
6674	15	13	0	5	f	f	WorkflowPermission	46	readonly
6675	15	13	0	5	f	f	WorkflowPermission	47	readonly
6676	15	13	0	5	f	f	WorkflowPermission	70	readonly
6694	15	14	0	5	f	f	WorkflowPermission	6	readonly
6695	15	14	0	5	f	f	WorkflowPermission	7	readonly
6696	15	14	0	5	f	f	WorkflowPermission	8	readonly
6697	15	14	0	5	f	f	WorkflowPermission	9	readonly
6699	15	14	0	5	f	f	WorkflowPermission	63	readonly
6700	15	14	0	5	f	f	WorkflowPermission	64	readonly
6701	15	14	0	5	f	f	WorkflowPermission	65	readonly
6702	15	14	0	5	f	f	WorkflowPermission	15	readonly
6703	15	14	0	5	f	f	WorkflowPermission	16	readonly
6704	15	14	0	5	f	f	WorkflowPermission	17	readonly
6705	15	14	0	5	f	f	WorkflowPermission	18	readonly
6706	15	14	0	5	f	f	WorkflowPermission	19	readonly
6707	15	14	0	5	f	f	WorkflowPermission	20	readonly
6708	15	14	0	5	f	f	WorkflowPermission	21	readonly
6709	15	14	0	5	f	f	WorkflowPermission	22	readonly
6710	15	14	0	5	f	f	WorkflowPermission	23	readonly
6712	15	14	0	5	f	f	WorkflowPermission	61	readonly
6713	15	14	0	5	f	f	WorkflowPermission	66	readonly
6714	15	14	0	5	f	f	WorkflowPermission	67	readonly
6715	15	14	0	5	f	f	WorkflowPermission	68	readonly
6716	15	14	0	5	f	f	WorkflowPermission	25	readonly
6717	15	14	0	5	f	f	WorkflowPermission	46	readonly
6718	15	14	0	5	f	f	WorkflowPermission	47	readonly
6719	15	14	0	5	f	f	WorkflowPermission	70	readonly
6737	15	15	0	5	f	f	WorkflowPermission	6	readonly
6738	15	15	0	5	f	f	WorkflowPermission	7	readonly
6739	15	15	0	5	f	f	WorkflowPermission	8	readonly
6740	15	15	0	5	f	f	WorkflowPermission	9	readonly
6742	15	15	0	5	f	f	WorkflowPermission	63	readonly
6743	15	15	0	5	f	f	WorkflowPermission	64	readonly
6744	15	15	0	5	f	f	WorkflowPermission	65	readonly
6745	15	15	0	5	f	f	WorkflowPermission	15	readonly
6746	15	15	0	5	f	f	WorkflowPermission	16	readonly
6747	15	15	0	5	f	f	WorkflowPermission	17	readonly
6748	15	15	0	5	f	f	WorkflowPermission	18	readonly
6749	15	15	0	5	f	f	WorkflowPermission	19	readonly
6750	15	15	0	5	f	f	WorkflowPermission	20	readonly
6751	15	15	0	5	f	f	WorkflowPermission	21	readonly
6752	15	15	0	5	f	f	WorkflowPermission	22	readonly
6753	15	15	0	5	f	f	WorkflowPermission	23	readonly
6755	15	15	0	5	f	f	WorkflowPermission	61	readonly
6756	15	15	0	5	f	f	WorkflowPermission	66	readonly
6757	15	15	0	5	f	f	WorkflowPermission	67	readonly
6758	15	15	0	5	f	f	WorkflowPermission	68	readonly
6759	15	15	0	5	f	f	WorkflowPermission	25	readonly
6760	15	15	0	5	f	f	WorkflowPermission	46	readonly
6761	15	15	0	5	f	f	WorkflowPermission	47	readonly
6762	15	15	0	5	f	f	WorkflowPermission	70	readonly
6769	16	13	4	4	f	f	WorkflowTransition	\N	\N
6770	16	15	4	4	f	f	WorkflowTransition	\N	\N
6771	16	4	6	4	f	f	WorkflowTransition	\N	\N
6772	16	4	15	4	f	f	WorkflowTransition	\N	\N
6779	16	6	13	4	f	f	WorkflowTransition	\N	\N
6780	16	6	15	4	f	f	WorkflowTransition	\N	\N
6787	16	13	6	4	f	f	WorkflowTransition	\N	\N
6788	16	13	15	4	f	f	WorkflowTransition	\N	\N
6789	16	15	6	4	f	f	WorkflowTransition	\N	\N
6812	16	12	0	4	f	f	WorkflowPermission	48	required
6813	16	12	0	4	f	f	WorkflowPermission	9	required
6814	16	12	0	4	f	f	WorkflowPermission	46	required
6815	16	12	0	4	f	f	WorkflowPermission	47	required
6816	16	13	0	4	f	f	WorkflowPermission	48	readonly
6817	16	13	0	4	f	f	WorkflowPermission	9	readonly
6818	16	13	0	4	f	f	WorkflowPermission	46	readonly
6819	16	13	0	4	f	f	WorkflowPermission	47	readonly
6820	16	14	0	4	f	f	WorkflowPermission	project_id	readonly
6821	16	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
6822	16	14	0	4	f	f	WorkflowPermission	subject	readonly
6823	16	14	0	4	f	f	WorkflowPermission	priority_id	readonly
6824	16	14	0	4	f	f	WorkflowPermission	is_private	readonly
6825	16	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
6826	16	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
6827	16	14	0	4	f	f	WorkflowPermission	description	readonly
6828	16	14	0	4	f	f	WorkflowPermission	2	readonly
6829	16	14	0	4	f	f	WorkflowPermission	3	readonly
6830	16	14	0	4	f	f	WorkflowPermission	4	readonly
6831	16	14	0	4	f	f	WorkflowPermission	5	readonly
6832	16	14	0	4	f	f	WorkflowPermission	7	readonly
6833	16	14	0	4	f	f	WorkflowPermission	48	readonly
6834	16	14	0	4	f	f	WorkflowPermission	9	readonly
6835	16	14	0	4	f	f	WorkflowPermission	34	readonly
6836	16	14	0	4	f	f	WorkflowPermission	35	readonly
6837	16	14	0	4	f	f	WorkflowPermission	36	readonly
6838	16	14	0	4	f	f	WorkflowPermission	37	readonly
6839	16	14	0	4	f	f	WorkflowPermission	38	readonly
6840	16	14	0	4	f	f	WorkflowPermission	39	readonly
6841	16	14	0	4	f	f	WorkflowPermission	40	readonly
6842	16	14	0	4	f	f	WorkflowPermission	41	readonly
6843	16	14	0	4	f	f	WorkflowPermission	42	readonly
6844	16	14	0	4	f	f	WorkflowPermission	43	readonly
6845	16	14	0	4	f	f	WorkflowPermission	44	readonly
6846	16	14	0	4	f	f	WorkflowPermission	45	readonly
6847	16	14	0	4	f	f	WorkflowPermission	25	readonly
6848	16	14	0	4	f	f	WorkflowPermission	46	readonly
6849	16	14	0	4	f	f	WorkflowPermission	47	readonly
6850	16	14	0	4	f	f	WorkflowPermission	26	readonly
6851	16	14	0	4	f	f	WorkflowPermission	27	readonly
6852	16	14	0	4	f	f	WorkflowPermission	28	readonly
6853	16	14	0	4	f	f	WorkflowPermission	29	readonly
6854	16	15	0	4	f	f	WorkflowPermission	48	readonly
6855	16	15	0	4	f	f	WorkflowPermission	9	readonly
6856	16	15	0	4	f	f	WorkflowPermission	46	readonly
6857	16	15	0	4	f	f	WorkflowPermission	47	readonly
6878	16	12	0	4	f	f	WorkflowPermission	7	required
6879	16	12	0	4	f	f	WorkflowPermission	34	required
6880	16	12	0	4	f	f	WorkflowPermission	35	required
6881	16	12	0	4	f	f	WorkflowPermission	36	required
6882	16	12	0	4	f	f	WorkflowPermission	37	required
6885	16	12	0	4	f	f	WorkflowPermission	40	required
6886	16	12	0	4	f	f	WorkflowPermission	41	required
6887	16	12	0	4	f	f	WorkflowPermission	42	required
6888	16	12	0	4	f	f	WorkflowPermission	43	required
6889	16	12	0	4	f	f	WorkflowPermission	44	required
6890	16	12	0	4	f	f	WorkflowPermission	45	required
6891	16	12	0	4	f	f	WorkflowPermission	25	required
6904	16	13	0	4	f	f	WorkflowPermission	7	readonly
6905	16	13	0	4	f	f	WorkflowPermission	34	readonly
6906	16	13	0	4	f	f	WorkflowPermission	35	readonly
6907	16	13	0	4	f	f	WorkflowPermission	36	readonly
6908	16	13	0	4	f	f	WorkflowPermission	37	readonly
6911	16	13	0	4	f	f	WorkflowPermission	40	readonly
6912	16	13	0	4	f	f	WorkflowPermission	41	readonly
6913	16	13	0	4	f	f	WorkflowPermission	42	readonly
6914	16	13	0	4	f	f	WorkflowPermission	43	readonly
6915	16	13	0	4	f	f	WorkflowPermission	44	readonly
6916	16	13	0	4	f	f	WorkflowPermission	45	readonly
6917	16	13	0	4	f	f	WorkflowPermission	25	readonly
6918	16	13	0	4	f	f	WorkflowPermission	70	readonly
6919	16	13	0	4	f	f	WorkflowPermission	69	readonly
6936	16	15	0	4	f	f	WorkflowPermission	7	readonly
6937	16	15	0	4	f	f	WorkflowPermission	34	readonly
6938	16	15	0	4	f	f	WorkflowPermission	35	readonly
6939	16	15	0	4	f	f	WorkflowPermission	36	readonly
6940	16	15	0	4	f	f	WorkflowPermission	37	readonly
6943	16	15	0	4	f	f	WorkflowPermission	40	readonly
6944	16	15	0	4	f	f	WorkflowPermission	41	readonly
6945	16	15	0	4	f	f	WorkflowPermission	42	readonly
6946	16	15	0	4	f	f	WorkflowPermission	43	readonly
6947	16	15	0	4	f	f	WorkflowPermission	44	readonly
6948	16	15	0	4	f	f	WorkflowPermission	45	readonly
6949	16	15	0	4	f	f	WorkflowPermission	25	readonly
6950	16	15	0	4	f	f	WorkflowPermission	70	readonly
6951	16	15	0	4	f	f	WorkflowPermission	69	readonly
6956	16	12	0	5	f	f	WorkflowPermission	48	required
6957	16	12	0	5	f	f	WorkflowPermission	9	required
6958	16	12	0	5	f	f	WorkflowPermission	46	required
6959	16	12	0	5	f	f	WorkflowPermission	47	required
6960	16	13	0	5	f	f	WorkflowPermission	48	readonly
6961	16	13	0	5	f	f	WorkflowPermission	9	readonly
6962	16	13	0	5	f	f	WorkflowPermission	46	readonly
6963	16	13	0	5	f	f	WorkflowPermission	47	readonly
6964	16	14	0	5	f	f	WorkflowPermission	project_id	readonly
6965	16	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
6966	16	14	0	5	f	f	WorkflowPermission	subject	readonly
6967	16	14	0	5	f	f	WorkflowPermission	priority_id	readonly
6968	16	14	0	5	f	f	WorkflowPermission	is_private	readonly
6969	16	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
6970	16	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
6971	16	14	0	5	f	f	WorkflowPermission	description	readonly
6972	16	14	0	5	f	f	WorkflowPermission	2	readonly
6973	16	14	0	5	f	f	WorkflowPermission	3	readonly
6974	16	14	0	5	f	f	WorkflowPermission	4	readonly
6975	16	14	0	5	f	f	WorkflowPermission	5	readonly
6976	16	14	0	5	f	f	WorkflowPermission	7	readonly
6977	16	14	0	5	f	f	WorkflowPermission	48	readonly
6978	16	14	0	5	f	f	WorkflowPermission	9	readonly
6979	16	14	0	5	f	f	WorkflowPermission	34	readonly
6980	16	14	0	5	f	f	WorkflowPermission	35	readonly
6981	16	14	0	5	f	f	WorkflowPermission	36	readonly
6982	16	14	0	5	f	f	WorkflowPermission	37	readonly
6983	16	14	0	5	f	f	WorkflowPermission	38	readonly
6984	16	14	0	5	f	f	WorkflowPermission	39	readonly
6985	16	14	0	5	f	f	WorkflowPermission	40	readonly
6986	16	14	0	5	f	f	WorkflowPermission	41	readonly
6987	16	14	0	5	f	f	WorkflowPermission	42	readonly
6988	16	14	0	5	f	f	WorkflowPermission	43	readonly
6989	16	14	0	5	f	f	WorkflowPermission	44	readonly
6990	16	14	0	5	f	f	WorkflowPermission	45	readonly
6991	16	14	0	5	f	f	WorkflowPermission	25	readonly
6992	16	14	0	5	f	f	WorkflowPermission	46	readonly
6993	16	14	0	5	f	f	WorkflowPermission	47	readonly
6994	16	14	0	5	f	f	WorkflowPermission	26	readonly
6995	16	14	0	5	f	f	WorkflowPermission	27	readonly
6996	16	14	0	5	f	f	WorkflowPermission	28	readonly
6997	16	14	0	5	f	f	WorkflowPermission	29	readonly
6998	16	15	0	5	f	f	WorkflowPermission	48	readonly
6999	16	15	0	5	f	f	WorkflowPermission	9	readonly
7000	16	15	0	5	f	f	WorkflowPermission	46	readonly
7001	16	15	0	5	f	f	WorkflowPermission	47	readonly
7002	16	4	6	5	f	f	WorkflowTransition	\N	\N
7003	16	6	4	5	f	f	WorkflowTransition	\N	\N
7010	16	6	15	5	f	f	WorkflowTransition	\N	\N
7045	16	4	15	5	f	f	WorkflowTransition	\N	\N
7053	16	12	0	5	f	f	WorkflowPermission	7	required
7054	16	12	0	5	f	f	WorkflowPermission	23	required
7055	16	12	0	5	f	f	WorkflowPermission	34	required
7056	16	12	0	5	f	f	WorkflowPermission	35	required
7057	16	12	0	5	f	f	WorkflowPermission	36	required
7058	16	12	0	5	f	f	WorkflowPermission	37	required
7061	16	12	0	5	f	f	WorkflowPermission	40	required
7062	16	12	0	5	f	f	WorkflowPermission	41	required
7063	16	12	0	5	f	f	WorkflowPermission	42	required
7064	16	12	0	5	f	f	WorkflowPermission	43	required
7065	16	12	0	5	f	f	WorkflowPermission	44	required
7066	16	12	0	5	f	f	WorkflowPermission	45	required
7067	16	12	0	5	f	f	WorkflowPermission	25	required
7080	16	13	0	5	f	f	WorkflowPermission	7	readonly
7081	16	13	0	5	f	f	WorkflowPermission	23	readonly
7082	16	13	0	5	f	f	WorkflowPermission	34	readonly
7083	16	13	0	5	f	f	WorkflowPermission	35	readonly
7084	16	13	0	5	f	f	WorkflowPermission	36	readonly
7085	16	13	0	5	f	f	WorkflowPermission	37	readonly
7088	16	13	0	5	f	f	WorkflowPermission	40	readonly
7089	16	13	0	5	f	f	WorkflowPermission	41	readonly
7090	16	13	0	5	f	f	WorkflowPermission	42	readonly
7091	16	13	0	5	f	f	WorkflowPermission	43	readonly
7092	16	13	0	5	f	f	WorkflowPermission	44	readonly
7093	16	13	0	5	f	f	WorkflowPermission	45	readonly
7094	16	13	0	5	f	f	WorkflowPermission	25	readonly
7095	16	13	0	5	f	f	WorkflowPermission	70	readonly
7096	16	13	0	5	f	f	WorkflowPermission	69	readonly
7115	16	15	0	5	f	f	WorkflowPermission	7	readonly
7116	16	15	0	5	f	f	WorkflowPermission	23	readonly
7117	16	15	0	5	f	f	WorkflowPermission	34	readonly
7118	16	15	0	5	f	f	WorkflowPermission	35	readonly
7119	16	15	0	5	f	f	WorkflowPermission	36	readonly
7120	16	15	0	5	f	f	WorkflowPermission	37	readonly
7123	16	15	0	5	f	f	WorkflowPermission	40	readonly
7124	16	15	0	5	f	f	WorkflowPermission	41	readonly
7125	16	15	0	5	f	f	WorkflowPermission	42	readonly
7126	16	15	0	5	f	f	WorkflowPermission	43	readonly
7127	16	15	0	5	f	f	WorkflowPermission	44	readonly
7128	16	15	0	5	f	f	WorkflowPermission	45	readonly
7129	16	15	0	5	f	f	WorkflowPermission	25	readonly
7130	16	15	0	5	f	f	WorkflowPermission	70	readonly
7131	16	15	0	5	f	f	WorkflowPermission	69	readonly
7138	17	12	4	4	f	f	WorkflowTransition	\N	\N
7139	17	13	4	4	f	f	WorkflowTransition	\N	\N
7140	17	15	4	4	f	f	WorkflowTransition	\N	\N
7141	17	4	6	4	f	f	WorkflowTransition	\N	\N
7142	17	4	15	4	f	f	WorkflowTransition	\N	\N
7143	17	6	7	4	f	f	WorkflowTransition	\N	\N
7144	17	6	8	4	f	f	WorkflowTransition	\N	\N
7145	17	6	9	4	f	f	WorkflowTransition	\N	\N
7146	17	6	10	4	f	f	WorkflowTransition	\N	\N
7147	17	6	11	4	f	f	WorkflowTransition	\N	\N
7148	17	6	12	4	f	f	WorkflowTransition	\N	\N
7149	17	6	13	4	f	f	WorkflowTransition	\N	\N
7150	17	6	15	4	f	f	WorkflowTransition	\N	\N
7151	17	7	15	4	f	f	WorkflowTransition	\N	\N
7152	17	8	15	4	f	f	WorkflowTransition	\N	\N
7153	17	9	15	4	f	f	WorkflowTransition	\N	\N
7154	17	10	15	4	f	f	WorkflowTransition	\N	\N
7155	17	11	15	4	f	f	WorkflowTransition	\N	\N
7156	17	12	15	4	f	f	WorkflowTransition	\N	\N
7157	17	13	6	4	f	f	WorkflowTransition	\N	\N
7158	17	13	15	4	f	f	WorkflowTransition	\N	\N
7159	17	15	6	4	f	f	WorkflowTransition	\N	\N
7160	17	7	8	4	f	f	WorkflowTransition	\N	\N
7161	17	7	9	4	f	f	WorkflowTransition	\N	\N
7162	17	7	10	4	f	f	WorkflowTransition	\N	\N
7163	17	7	11	4	f	f	WorkflowTransition	\N	\N
7164	17	7	12	4	f	f	WorkflowTransition	\N	\N
7165	17	7	13	4	f	f	WorkflowTransition	\N	\N
7166	17	8	9	4	f	f	WorkflowTransition	\N	\N
7167	17	8	10	4	f	f	WorkflowTransition	\N	\N
7168	17	8	11	4	f	f	WorkflowTransition	\N	\N
7169	17	8	12	4	f	f	WorkflowTransition	\N	\N
7170	17	8	13	4	f	f	WorkflowTransition	\N	\N
7171	17	9	10	4	f	f	WorkflowTransition	\N	\N
7172	17	9	11	4	f	f	WorkflowTransition	\N	\N
7173	17	9	12	4	f	f	WorkflowTransition	\N	\N
7174	17	9	13	4	f	f	WorkflowTransition	\N	\N
7175	17	10	11	4	f	f	WorkflowTransition	\N	\N
7176	17	10	12	4	f	f	WorkflowTransition	\N	\N
7177	17	10	13	4	f	f	WorkflowTransition	\N	\N
7178	17	11	12	4	f	f	WorkflowTransition	\N	\N
7179	17	11	13	4	f	f	WorkflowTransition	\N	\N
7180	17	12	13	4	f	f	WorkflowTransition	\N	\N
7181	17	11	6	4	f	f	WorkflowTransition	\N	\N
7182	17	12	0	4	f	f	WorkflowPermission	48	required
7183	17	12	0	4	f	f	WorkflowPermission	9	required
7184	17	12	0	4	f	f	WorkflowPermission	46	required
7185	17	12	0	4	f	f	WorkflowPermission	47	required
7186	17	13	0	4	f	f	WorkflowPermission	48	readonly
7187	17	13	0	4	f	f	WorkflowPermission	9	readonly
7188	17	13	0	4	f	f	WorkflowPermission	46	readonly
7189	17	13	0	4	f	f	WorkflowPermission	47	readonly
7190	17	14	0	4	f	f	WorkflowPermission	project_id	readonly
7191	17	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
7192	17	14	0	4	f	f	WorkflowPermission	subject	readonly
7193	17	14	0	4	f	f	WorkflowPermission	priority_id	readonly
7194	17	14	0	4	f	f	WorkflowPermission	is_private	readonly
7195	17	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7196	17	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7197	17	14	0	4	f	f	WorkflowPermission	description	readonly
7198	17	14	0	4	f	f	WorkflowPermission	2	readonly
7199	17	14	0	4	f	f	WorkflowPermission	3	readonly
7200	17	14	0	4	f	f	WorkflowPermission	4	readonly
7201	17	14	0	4	f	f	WorkflowPermission	5	readonly
7202	17	14	0	4	f	f	WorkflowPermission	7	readonly
7203	17	14	0	4	f	f	WorkflowPermission	48	readonly
7204	17	14	0	4	f	f	WorkflowPermission	9	readonly
7205	17	14	0	4	f	f	WorkflowPermission	34	readonly
7206	17	14	0	4	f	f	WorkflowPermission	35	readonly
7207	17	14	0	4	f	f	WorkflowPermission	36	readonly
7208	17	14	0	4	f	f	WorkflowPermission	37	readonly
7209	17	14	0	4	f	f	WorkflowPermission	38	readonly
7210	17	14	0	4	f	f	WorkflowPermission	39	readonly
7211	17	14	0	4	f	f	WorkflowPermission	40	readonly
7212	17	14	0	4	f	f	WorkflowPermission	41	readonly
7213	17	14	0	4	f	f	WorkflowPermission	42	readonly
7214	17	14	0	4	f	f	WorkflowPermission	43	readonly
7215	17	14	0	4	f	f	WorkflowPermission	44	readonly
7216	17	14	0	4	f	f	WorkflowPermission	45	readonly
7217	17	14	0	4	f	f	WorkflowPermission	25	readonly
7218	17	14	0	4	f	f	WorkflowPermission	46	readonly
7219	17	14	0	4	f	f	WorkflowPermission	47	readonly
7220	17	14	0	4	f	f	WorkflowPermission	26	readonly
7221	17	14	0	4	f	f	WorkflowPermission	27	readonly
7222	17	14	0	4	f	f	WorkflowPermission	28	readonly
7223	17	14	0	4	f	f	WorkflowPermission	29	readonly
7224	17	15	0	4	f	f	WorkflowPermission	48	readonly
7225	17	15	0	4	f	f	WorkflowPermission	9	readonly
7226	17	15	0	4	f	f	WorkflowPermission	46	readonly
7227	17	15	0	4	f	f	WorkflowPermission	47	readonly
7228	17	7	6	4	f	f	WorkflowTransition	\N	\N
7229	17	8	6	4	f	f	WorkflowTransition	\N	\N
7230	17	8	7	4	f	f	WorkflowTransition	\N	\N
7231	17	9	6	4	f	f	WorkflowTransition	\N	\N
7232	17	9	7	4	f	f	WorkflowTransition	\N	\N
7233	17	9	8	4	f	f	WorkflowTransition	\N	\N
7234	17	10	6	4	f	f	WorkflowTransition	\N	\N
7235	17	10	7	4	f	f	WorkflowTransition	\N	\N
7236	17	10	8	4	f	f	WorkflowTransition	\N	\N
7237	17	10	9	4	f	f	WorkflowTransition	\N	\N
7238	17	11	7	4	f	f	WorkflowTransition	\N	\N
7239	17	11	8	4	f	f	WorkflowTransition	\N	\N
7240	17	11	9	4	f	f	WorkflowTransition	\N	\N
7241	17	11	10	4	f	f	WorkflowTransition	\N	\N
7242	17	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
7243	17	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
7244	17	12	0	4	f	f	WorkflowPermission	2	required
7245	17	12	0	4	f	f	WorkflowPermission	3	required
7246	17	12	0	4	f	f	WorkflowPermission	4	required
7247	17	12	0	4	f	f	WorkflowPermission	5	required
7248	17	12	0	4	f	f	WorkflowPermission	7	required
7249	17	12	0	4	f	f	WorkflowPermission	34	required
7250	17	12	0	4	f	f	WorkflowPermission	35	required
7251	17	12	0	4	f	f	WorkflowPermission	36	required
7252	17	12	0	4	f	f	WorkflowPermission	37	required
7253	17	12	0	4	f	f	WorkflowPermission	38	required
7254	17	12	0	4	f	f	WorkflowPermission	39	required
7255	17	12	0	4	f	f	WorkflowPermission	40	required
7256	17	12	0	4	f	f	WorkflowPermission	41	required
7257	17	12	0	4	f	f	WorkflowPermission	42	required
7258	17	12	0	4	f	f	WorkflowPermission	43	required
7259	17	12	0	4	f	f	WorkflowPermission	44	required
7260	17	12	0	4	f	f	WorkflowPermission	45	required
7261	17	12	0	4	f	f	WorkflowPermission	25	required
7262	17	13	0	4	f	f	WorkflowPermission	project_id	readonly
7263	17	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
7264	17	13	0	4	f	f	WorkflowPermission	subject	readonly
7265	17	13	0	4	f	f	WorkflowPermission	priority_id	readonly
7266	17	13	0	4	f	f	WorkflowPermission	is_private	readonly
7267	17	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7268	17	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7269	17	13	0	4	f	f	WorkflowPermission	description	readonly
7270	17	13	0	4	f	f	WorkflowPermission	2	readonly
7271	17	13	0	4	f	f	WorkflowPermission	3	readonly
7272	17	13	0	4	f	f	WorkflowPermission	4	readonly
7273	17	13	0	4	f	f	WorkflowPermission	5	readonly
7274	17	13	0	4	f	f	WorkflowPermission	7	readonly
7275	17	13	0	4	f	f	WorkflowPermission	34	readonly
7276	17	13	0	4	f	f	WorkflowPermission	35	readonly
7277	17	13	0	4	f	f	WorkflowPermission	36	readonly
7278	17	13	0	4	f	f	WorkflowPermission	37	readonly
7279	17	13	0	4	f	f	WorkflowPermission	38	readonly
7280	17	13	0	4	f	f	WorkflowPermission	39	readonly
7281	17	13	0	4	f	f	WorkflowPermission	40	readonly
7282	17	13	0	4	f	f	WorkflowPermission	41	readonly
7283	17	13	0	4	f	f	WorkflowPermission	42	readonly
7284	17	13	0	4	f	f	WorkflowPermission	43	readonly
7285	17	13	0	4	f	f	WorkflowPermission	44	readonly
7286	17	13	0	4	f	f	WorkflowPermission	45	readonly
7287	17	13	0	4	f	f	WorkflowPermission	25	readonly
7288	17	13	0	4	f	f	WorkflowPermission	70	readonly
7289	17	13	0	4	f	f	WorkflowPermission	69	readonly
7290	17	13	0	4	f	f	WorkflowPermission	26	readonly
7291	17	13	0	4	f	f	WorkflowPermission	27	readonly
7292	17	13	0	4	f	f	WorkflowPermission	28	readonly
7293	17	13	0	4	f	f	WorkflowPermission	29	readonly
7294	17	15	0	4	f	f	WorkflowPermission	project_id	readonly
7295	17	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
7296	17	15	0	4	f	f	WorkflowPermission	subject	readonly
7297	17	15	0	4	f	f	WorkflowPermission	priority_id	readonly
7298	17	15	0	4	f	f	WorkflowPermission	is_private	readonly
7299	17	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7300	17	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7301	17	15	0	4	f	f	WorkflowPermission	description	readonly
7302	17	15	0	4	f	f	WorkflowPermission	2	readonly
7303	17	15	0	4	f	f	WorkflowPermission	3	readonly
7304	17	15	0	4	f	f	WorkflowPermission	4	readonly
7305	17	15	0	4	f	f	WorkflowPermission	5	readonly
7306	17	15	0	4	f	f	WorkflowPermission	7	readonly
7307	17	15	0	4	f	f	WorkflowPermission	34	readonly
7308	17	15	0	4	f	f	WorkflowPermission	35	readonly
7309	17	15	0	4	f	f	WorkflowPermission	36	readonly
7310	17	15	0	4	f	f	WorkflowPermission	37	readonly
7311	17	15	0	4	f	f	WorkflowPermission	38	readonly
7312	17	15	0	4	f	f	WorkflowPermission	39	readonly
7313	17	15	0	4	f	f	WorkflowPermission	40	readonly
7314	17	15	0	4	f	f	WorkflowPermission	41	readonly
7315	17	15	0	4	f	f	WorkflowPermission	42	readonly
7316	17	15	0	4	f	f	WorkflowPermission	43	readonly
7317	17	15	0	4	f	f	WorkflowPermission	44	readonly
7318	17	15	0	4	f	f	WorkflowPermission	45	readonly
7319	17	15	0	4	f	f	WorkflowPermission	25	readonly
7320	17	15	0	4	f	f	WorkflowPermission	70	readonly
7321	17	15	0	4	f	f	WorkflowPermission	69	readonly
7322	17	15	0	4	f	f	WorkflowPermission	26	readonly
7323	17	15	0	4	f	f	WorkflowPermission	27	readonly
7324	17	15	0	4	f	f	WorkflowPermission	28	readonly
7325	17	15	0	4	f	f	WorkflowPermission	29	readonly
7326	17	12	0	5	f	f	WorkflowPermission	48	required
7327	17	12	0	5	f	f	WorkflowPermission	9	required
7328	17	12	0	5	f	f	WorkflowPermission	46	required
7329	17	12	0	5	f	f	WorkflowPermission	47	required
7330	17	13	0	5	f	f	WorkflowPermission	48	readonly
7331	17	13	0	5	f	f	WorkflowPermission	9	readonly
7332	17	13	0	5	f	f	WorkflowPermission	46	readonly
7333	17	13	0	5	f	f	WorkflowPermission	47	readonly
7334	17	14	0	5	f	f	WorkflowPermission	project_id	readonly
7335	17	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
7336	17	14	0	5	f	f	WorkflowPermission	subject	readonly
7337	17	14	0	5	f	f	WorkflowPermission	priority_id	readonly
7338	17	14	0	5	f	f	WorkflowPermission	is_private	readonly
7339	17	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7340	17	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7341	17	14	0	5	f	f	WorkflowPermission	description	readonly
7342	17	14	0	5	f	f	WorkflowPermission	2	readonly
7343	17	14	0	5	f	f	WorkflowPermission	3	readonly
7344	17	14	0	5	f	f	WorkflowPermission	4	readonly
7345	17	14	0	5	f	f	WorkflowPermission	5	readonly
7346	17	14	0	5	f	f	WorkflowPermission	7	readonly
7347	17	14	0	5	f	f	WorkflowPermission	48	readonly
7348	17	14	0	5	f	f	WorkflowPermission	9	readonly
7349	17	14	0	5	f	f	WorkflowPermission	34	readonly
7350	17	14	0	5	f	f	WorkflowPermission	35	readonly
7351	17	14	0	5	f	f	WorkflowPermission	36	readonly
7352	17	14	0	5	f	f	WorkflowPermission	37	readonly
7353	17	14	0	5	f	f	WorkflowPermission	38	readonly
7354	17	14	0	5	f	f	WorkflowPermission	39	readonly
7355	17	14	0	5	f	f	WorkflowPermission	40	readonly
7356	17	14	0	5	f	f	WorkflowPermission	41	readonly
7357	17	14	0	5	f	f	WorkflowPermission	42	readonly
7358	17	14	0	5	f	f	WorkflowPermission	43	readonly
7359	17	14	0	5	f	f	WorkflowPermission	44	readonly
7360	17	14	0	5	f	f	WorkflowPermission	45	readonly
7361	17	14	0	5	f	f	WorkflowPermission	25	readonly
7362	17	14	0	5	f	f	WorkflowPermission	46	readonly
7363	17	14	0	5	f	f	WorkflowPermission	47	readonly
7364	17	14	0	5	f	f	WorkflowPermission	26	readonly
7365	17	14	0	5	f	f	WorkflowPermission	27	readonly
7366	17	14	0	5	f	f	WorkflowPermission	28	readonly
7367	17	14	0	5	f	f	WorkflowPermission	29	readonly
7368	17	15	0	5	f	f	WorkflowPermission	48	readonly
7369	17	15	0	5	f	f	WorkflowPermission	9	readonly
7370	17	15	0	5	f	f	WorkflowPermission	46	readonly
7371	17	15	0	5	f	f	WorkflowPermission	47	readonly
7372	17	4	6	5	f	f	WorkflowTransition	\N	\N
7373	17	6	4	5	f	f	WorkflowTransition	\N	\N
7374	17	6	7	5	f	f	WorkflowTransition	\N	\N
7375	17	6	8	5	f	f	WorkflowTransition	\N	\N
7376	17	6	9	5	f	f	WorkflowTransition	\N	\N
7377	17	6	10	5	f	f	WorkflowTransition	\N	\N
7378	17	6	11	5	f	f	WorkflowTransition	\N	\N
7379	17	6	12	5	f	f	WorkflowTransition	\N	\N
7380	17	6	15	5	f	f	WorkflowTransition	\N	\N
7381	17	7	6	5	f	f	WorkflowTransition	\N	\N
7382	17	7	8	5	f	f	WorkflowTransition	\N	\N
7383	17	7	9	5	f	f	WorkflowTransition	\N	\N
7384	17	7	10	5	f	f	WorkflowTransition	\N	\N
7385	17	7	11	5	f	f	WorkflowTransition	\N	\N
7386	17	7	12	5	f	f	WorkflowTransition	\N	\N
7387	17	7	15	5	f	f	WorkflowTransition	\N	\N
7388	17	8	6	5	f	f	WorkflowTransition	\N	\N
7389	17	8	7	5	f	f	WorkflowTransition	\N	\N
7390	17	8	9	5	f	f	WorkflowTransition	\N	\N
7391	17	8	10	5	f	f	WorkflowTransition	\N	\N
7392	17	8	11	5	f	f	WorkflowTransition	\N	\N
7393	17	8	12	5	f	f	WorkflowTransition	\N	\N
7394	17	8	15	5	f	f	WorkflowTransition	\N	\N
7395	17	9	6	5	f	f	WorkflowTransition	\N	\N
7396	17	9	7	5	f	f	WorkflowTransition	\N	\N
7397	17	9	8	5	f	f	WorkflowTransition	\N	\N
7398	17	9	10	5	f	f	WorkflowTransition	\N	\N
7399	17	9	11	5	f	f	WorkflowTransition	\N	\N
7400	17	9	12	5	f	f	WorkflowTransition	\N	\N
7401	17	9	15	5	f	f	WorkflowTransition	\N	\N
7402	17	10	6	5	f	f	WorkflowTransition	\N	\N
7403	17	10	7	5	f	f	WorkflowTransition	\N	\N
7404	17	10	8	5	f	f	WorkflowTransition	\N	\N
7405	17	10	9	5	f	f	WorkflowTransition	\N	\N
7406	17	10	11	5	f	f	WorkflowTransition	\N	\N
7407	17	10	12	5	f	f	WorkflowTransition	\N	\N
7408	17	10	15	5	f	f	WorkflowTransition	\N	\N
7409	17	11	6	5	f	f	WorkflowTransition	\N	\N
7410	17	11	7	5	f	f	WorkflowTransition	\N	\N
7411	17	11	8	5	f	f	WorkflowTransition	\N	\N
7412	17	11	9	5	f	f	WorkflowTransition	\N	\N
7413	17	11	10	5	f	f	WorkflowTransition	\N	\N
7414	17	11	12	5	f	f	WorkflowTransition	\N	\N
7415	17	4	15	5	f	f	WorkflowTransition	\N	\N
7416	17	11	15	5	f	f	WorkflowTransition	\N	\N
7417	17	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
7418	17	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
7419	17	12	0	5	f	f	WorkflowPermission	2	required
7420	17	12	0	5	f	f	WorkflowPermission	3	required
7421	17	12	0	5	f	f	WorkflowPermission	4	required
7422	17	12	0	5	f	f	WorkflowPermission	5	required
7423	17	12	0	5	f	f	WorkflowPermission	7	required
7424	17	12	0	5	f	f	WorkflowPermission	23	required
7425	17	12	0	5	f	f	WorkflowPermission	34	required
7426	17	12	0	5	f	f	WorkflowPermission	35	required
7427	17	12	0	5	f	f	WorkflowPermission	36	required
7428	17	12	0	5	f	f	WorkflowPermission	37	required
7429	17	12	0	5	f	f	WorkflowPermission	38	required
7430	17	12	0	5	f	f	WorkflowPermission	39	required
7431	17	12	0	5	f	f	WorkflowPermission	40	required
7432	17	12	0	5	f	f	WorkflowPermission	41	required
7433	17	12	0	5	f	f	WorkflowPermission	42	required
7434	17	12	0	5	f	f	WorkflowPermission	43	required
7435	17	12	0	5	f	f	WorkflowPermission	44	required
7436	17	12	0	5	f	f	WorkflowPermission	45	required
7437	17	12	0	5	f	f	WorkflowPermission	25	required
7438	17	13	0	5	f	f	WorkflowPermission	project_id	readonly
7439	17	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
7440	17	13	0	5	f	f	WorkflowPermission	subject	readonly
7441	17	13	0	5	f	f	WorkflowPermission	priority_id	readonly
7442	17	13	0	5	f	f	WorkflowPermission	is_private	readonly
7443	17	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7444	17	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7445	17	13	0	5	f	f	WorkflowPermission	description	readonly
7446	17	13	0	5	f	f	WorkflowPermission	2	readonly
7447	17	13	0	5	f	f	WorkflowPermission	3	readonly
7448	17	13	0	5	f	f	WorkflowPermission	4	readonly
7449	17	13	0	5	f	f	WorkflowPermission	5	readonly
7450	17	13	0	5	f	f	WorkflowPermission	7	readonly
7451	17	13	0	5	f	f	WorkflowPermission	23	readonly
7452	17	13	0	5	f	f	WorkflowPermission	34	readonly
7453	17	13	0	5	f	f	WorkflowPermission	35	readonly
7454	17	13	0	5	f	f	WorkflowPermission	36	readonly
7455	17	13	0	5	f	f	WorkflowPermission	37	readonly
7456	17	13	0	5	f	f	WorkflowPermission	38	readonly
7457	17	13	0	5	f	f	WorkflowPermission	39	readonly
7458	17	13	0	5	f	f	WorkflowPermission	40	readonly
7459	17	13	0	5	f	f	WorkflowPermission	41	readonly
7460	17	13	0	5	f	f	WorkflowPermission	42	readonly
7461	17	13	0	5	f	f	WorkflowPermission	43	readonly
7462	17	13	0	5	f	f	WorkflowPermission	44	readonly
7463	17	13	0	5	f	f	WorkflowPermission	45	readonly
7464	17	13	0	5	f	f	WorkflowPermission	25	readonly
7465	17	13	0	5	f	f	WorkflowPermission	70	readonly
7466	17	13	0	5	f	f	WorkflowPermission	69	readonly
7467	17	13	0	5	f	f	WorkflowPermission	26	readonly
7468	17	13	0	5	f	f	WorkflowPermission	27	readonly
7469	17	13	0	5	f	f	WorkflowPermission	28	readonly
7470	17	13	0	5	f	f	WorkflowPermission	29	readonly
7471	17	13	0	5	f	f	WorkflowPermission	71	readonly
7472	17	13	0	5	f	f	WorkflowPermission	72	readonly
7473	17	15	0	5	f	f	WorkflowPermission	project_id	readonly
7474	17	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
7475	17	15	0	5	f	f	WorkflowPermission	subject	readonly
7476	17	15	0	5	f	f	WorkflowPermission	priority_id	readonly
7477	17	15	0	5	f	f	WorkflowPermission	is_private	readonly
7478	17	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7479	17	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7480	17	15	0	5	f	f	WorkflowPermission	description	readonly
7481	17	15	0	5	f	f	WorkflowPermission	2	readonly
7482	17	15	0	5	f	f	WorkflowPermission	3	readonly
7483	17	15	0	5	f	f	WorkflowPermission	4	readonly
7484	17	15	0	5	f	f	WorkflowPermission	5	readonly
7485	17	15	0	5	f	f	WorkflowPermission	7	readonly
7486	17	15	0	5	f	f	WorkflowPermission	23	readonly
7487	17	15	0	5	f	f	WorkflowPermission	34	readonly
7488	17	15	0	5	f	f	WorkflowPermission	35	readonly
7489	17	15	0	5	f	f	WorkflowPermission	36	readonly
7490	17	15	0	5	f	f	WorkflowPermission	37	readonly
7491	17	15	0	5	f	f	WorkflowPermission	38	readonly
7492	17	15	0	5	f	f	WorkflowPermission	39	readonly
7493	17	15	0	5	f	f	WorkflowPermission	40	readonly
7494	17	15	0	5	f	f	WorkflowPermission	41	readonly
7495	17	15	0	5	f	f	WorkflowPermission	42	readonly
7496	17	15	0	5	f	f	WorkflowPermission	43	readonly
7497	17	15	0	5	f	f	WorkflowPermission	44	readonly
7498	17	15	0	5	f	f	WorkflowPermission	45	readonly
7499	17	15	0	5	f	f	WorkflowPermission	25	readonly
7500	17	15	0	5	f	f	WorkflowPermission	70	readonly
7501	17	15	0	5	f	f	WorkflowPermission	69	readonly
7502	17	15	0	5	f	f	WorkflowPermission	26	readonly
7503	17	15	0	5	f	f	WorkflowPermission	27	readonly
7504	17	15	0	5	f	f	WorkflowPermission	28	readonly
7505	17	15	0	5	f	f	WorkflowPermission	29	readonly
7506	17	15	0	5	f	f	WorkflowPermission	71	readonly
7507	17	15	0	5	f	f	WorkflowPermission	72	readonly
7555	16	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
7556	16	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
7557	16	12	0	4	f	f	WorkflowPermission	2	required
7558	16	12	0	4	f	f	WorkflowPermission	3	required
7559	16	12	0	4	f	f	WorkflowPermission	4	required
7560	16	12	0	4	f	f	WorkflowPermission	5	required
7561	16	12	0	4	f	f	WorkflowPermission	38	required
7562	16	12	0	4	f	f	WorkflowPermission	39	required
7563	16	12	0	4	f	f	WorkflowPermission	89	required
7564	16	13	0	4	f	f	WorkflowPermission	project_id	readonly
7565	16	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
7566	16	13	0	4	f	f	WorkflowPermission	subject	readonly
7567	16	13	0	4	f	f	WorkflowPermission	priority_id	readonly
7568	16	13	0	4	f	f	WorkflowPermission	is_private	readonly
7569	16	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7570	16	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7571	16	13	0	4	f	f	WorkflowPermission	description	readonly
7572	16	13	0	4	f	f	WorkflowPermission	2	readonly
7573	16	13	0	4	f	f	WorkflowPermission	3	readonly
7574	16	13	0	4	f	f	WorkflowPermission	4	readonly
7575	16	13	0	4	f	f	WorkflowPermission	5	readonly
7576	16	13	0	4	f	f	WorkflowPermission	38	readonly
7577	16	13	0	4	f	f	WorkflowPermission	39	readonly
7578	16	13	0	4	f	f	WorkflowPermission	89	readonly
7579	16	13	0	4	f	f	WorkflowPermission	26	readonly
7580	16	13	0	4	f	f	WorkflowPermission	27	readonly
7581	16	13	0	4	f	f	WorkflowPermission	28	readonly
7582	16	13	0	4	f	f	WorkflowPermission	29	readonly
7583	16	15	0	4	f	f	WorkflowPermission	project_id	readonly
7584	16	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
7585	16	15	0	4	f	f	WorkflowPermission	subject	readonly
7586	16	15	0	4	f	f	WorkflowPermission	priority_id	readonly
7587	16	15	0	4	f	f	WorkflowPermission	is_private	readonly
7588	16	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7589	16	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7590	16	15	0	4	f	f	WorkflowPermission	description	readonly
7591	16	15	0	4	f	f	WorkflowPermission	2	readonly
7592	16	15	0	4	f	f	WorkflowPermission	3	readonly
7593	16	15	0	4	f	f	WorkflowPermission	4	readonly
7594	16	15	0	4	f	f	WorkflowPermission	5	readonly
7595	16	15	0	4	f	f	WorkflowPermission	38	readonly
7596	16	15	0	4	f	f	WorkflowPermission	39	readonly
7597	16	15	0	4	f	f	WorkflowPermission	89	readonly
7598	16	15	0	4	f	f	WorkflowPermission	26	readonly
7599	16	15	0	4	f	f	WorkflowPermission	27	readonly
7600	16	15	0	4	f	f	WorkflowPermission	28	readonly
7601	16	15	0	4	f	f	WorkflowPermission	29	readonly
7602	16	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
7603	16	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
7604	16	12	0	5	f	f	WorkflowPermission	2	required
7605	16	12	0	5	f	f	WorkflowPermission	3	required
7606	16	12	0	5	f	f	WorkflowPermission	4	required
7607	16	12	0	5	f	f	WorkflowPermission	5	required
7608	16	12	0	5	f	f	WorkflowPermission	38	required
7609	16	12	0	5	f	f	WorkflowPermission	39	required
7610	16	12	0	5	f	f	WorkflowPermission	89	required
7611	16	13	0	5	f	f	WorkflowPermission	project_id	readonly
7612	16	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
7613	16	13	0	5	f	f	WorkflowPermission	subject	readonly
7614	16	13	0	5	f	f	WorkflowPermission	priority_id	readonly
7615	16	13	0	5	f	f	WorkflowPermission	is_private	readonly
7616	16	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7617	16	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7618	16	13	0	5	f	f	WorkflowPermission	description	readonly
7619	16	13	0	5	f	f	WorkflowPermission	2	readonly
7620	16	13	0	5	f	f	WorkflowPermission	3	readonly
7621	16	13	0	5	f	f	WorkflowPermission	4	readonly
7622	16	13	0	5	f	f	WorkflowPermission	5	readonly
7623	16	13	0	5	f	f	WorkflowPermission	38	readonly
7624	16	13	0	5	f	f	WorkflowPermission	39	readonly
7625	16	13	0	5	f	f	WorkflowPermission	89	readonly
7626	16	13	0	5	f	f	WorkflowPermission	26	readonly
7627	16	13	0	5	f	f	WorkflowPermission	27	readonly
7628	16	13	0	5	f	f	WorkflowPermission	28	readonly
7629	16	13	0	5	f	f	WorkflowPermission	29	readonly
7630	16	13	0	5	f	f	WorkflowPermission	71	readonly
7631	16	13	0	5	f	f	WorkflowPermission	72	readonly
7632	16	15	0	5	f	f	WorkflowPermission	project_id	readonly
7633	16	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
7634	16	15	0	5	f	f	WorkflowPermission	subject	readonly
7635	16	15	0	5	f	f	WorkflowPermission	priority_id	readonly
7636	16	15	0	5	f	f	WorkflowPermission	is_private	readonly
7637	16	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7638	16	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7639	16	15	0	5	f	f	WorkflowPermission	description	readonly
7640	16	15	0	5	f	f	WorkflowPermission	2	readonly
7641	16	15	0	5	f	f	WorkflowPermission	3	readonly
7642	16	15	0	5	f	f	WorkflowPermission	4	readonly
7643	16	15	0	5	f	f	WorkflowPermission	5	readonly
7644	16	15	0	5	f	f	WorkflowPermission	38	readonly
7645	16	15	0	5	f	f	WorkflowPermission	39	readonly
7646	16	15	0	5	f	f	WorkflowPermission	89	readonly
7647	16	15	0	5	f	f	WorkflowPermission	26	readonly
7648	16	15	0	5	f	f	WorkflowPermission	27	readonly
7649	16	15	0	5	f	f	WorkflowPermission	28	readonly
7650	16	15	0	5	f	f	WorkflowPermission	29	readonly
7651	16	15	0	5	f	f	WorkflowPermission	71	readonly
7652	16	15	0	5	f	f	WorkflowPermission	72	readonly
7653	15	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
7654	15	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
7655	15	12	0	5	f	f	WorkflowPermission	2	required
7656	15	12	0	5	f	f	WorkflowPermission	3	required
7657	15	12	0	5	f	f	WorkflowPermission	4	required
7658	15	12	0	5	f	f	WorkflowPermission	5	required
7659	15	12	0	5	f	f	WorkflowPermission	13	required
7660	15	12	0	5	f	f	WorkflowPermission	24	required
7661	15	12	0	5	f	f	WorkflowPermission	78	required
7662	15	12	0	5	f	f	WorkflowPermission	79	required
7663	15	12	0	5	f	f	WorkflowPermission	80	required
7664	15	12	0	5	f	f	WorkflowPermission	81	required
7665	15	12	0	5	f	f	WorkflowPermission	82	required
7666	15	12	0	5	f	f	WorkflowPermission	83	required
7667	15	12	0	5	f	f	WorkflowPermission	84	required
7668	15	12	0	5	f	f	WorkflowPermission	85	required
7669	15	12	0	5	f	f	WorkflowPermission	86	required
7670	15	12	0	5	f	f	WorkflowPermission	87	required
7671	15	12	0	5	f	f	WorkflowPermission	88	required
7672	15	13	0	5	f	f	WorkflowPermission	project_id	readonly
7673	15	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
7674	15	13	0	5	f	f	WorkflowPermission	subject	readonly
7675	15	13	0	5	f	f	WorkflowPermission	priority_id	readonly
7676	15	13	0	5	f	f	WorkflowPermission	is_private	readonly
7677	15	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7678	15	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7679	15	13	0	5	f	f	WorkflowPermission	description	readonly
7680	15	13	0	5	f	f	WorkflowPermission	2	readonly
7681	15	13	0	5	f	f	WorkflowPermission	3	readonly
7682	15	13	0	5	f	f	WorkflowPermission	4	readonly
7683	15	13	0	5	f	f	WorkflowPermission	5	readonly
7684	15	13	0	5	f	f	WorkflowPermission	13	readonly
7685	15	13	0	5	f	f	WorkflowPermission	24	readonly
7686	15	13	0	5	f	f	WorkflowPermission	78	readonly
7687	15	13	0	5	f	f	WorkflowPermission	79	readonly
7688	15	13	0	5	f	f	WorkflowPermission	80	readonly
7689	15	13	0	5	f	f	WorkflowPermission	81	readonly
7690	15	13	0	5	f	f	WorkflowPermission	82	readonly
7691	15	13	0	5	f	f	WorkflowPermission	83	readonly
7692	15	13	0	5	f	f	WorkflowPermission	84	readonly
7693	15	13	0	5	f	f	WorkflowPermission	85	readonly
7694	15	13	0	5	f	f	WorkflowPermission	86	readonly
7695	15	13	0	5	f	f	WorkflowPermission	87	readonly
7696	15	13	0	5	f	f	WorkflowPermission	88	readonly
7697	15	13	0	5	f	f	WorkflowPermission	69	readonly
7698	15	13	0	5	f	f	WorkflowPermission	26	readonly
7699	15	13	0	5	f	f	WorkflowPermission	27	readonly
7700	15	13	0	5	f	f	WorkflowPermission	28	readonly
7701	15	13	0	5	f	f	WorkflowPermission	29	readonly
7702	15	14	0	5	f	f	WorkflowPermission	project_id	readonly
7703	15	14	0	5	f	f	WorkflowPermission	tracker_id	readonly
7704	15	14	0	5	f	f	WorkflowPermission	subject	readonly
7705	15	14	0	5	f	f	WorkflowPermission	priority_id	readonly
7706	15	14	0	5	f	f	WorkflowPermission	is_private	readonly
7707	15	14	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7708	15	14	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7709	15	14	0	5	f	f	WorkflowPermission	description	readonly
7710	15	14	0	5	f	f	WorkflowPermission	2	readonly
7711	15	14	0	5	f	f	WorkflowPermission	3	readonly
7712	15	14	0	5	f	f	WorkflowPermission	4	readonly
7713	15	14	0	5	f	f	WorkflowPermission	5	readonly
7714	15	14	0	5	f	f	WorkflowPermission	13	readonly
7715	15	14	0	5	f	f	WorkflowPermission	24	readonly
7716	15	14	0	5	f	f	WorkflowPermission	78	readonly
7717	15	14	0	5	f	f	WorkflowPermission	79	readonly
7718	15	14	0	5	f	f	WorkflowPermission	80	readonly
7719	15	14	0	5	f	f	WorkflowPermission	81	readonly
7720	15	14	0	5	f	f	WorkflowPermission	82	readonly
7721	15	14	0	5	f	f	WorkflowPermission	83	readonly
7722	15	14	0	5	f	f	WorkflowPermission	84	readonly
7723	15	14	0	5	f	f	WorkflowPermission	85	readonly
7724	15	14	0	5	f	f	WorkflowPermission	86	readonly
7725	15	14	0	5	f	f	WorkflowPermission	87	readonly
7726	15	14	0	5	f	f	WorkflowPermission	88	readonly
7727	15	14	0	5	f	f	WorkflowPermission	69	readonly
7728	15	14	0	5	f	f	WorkflowPermission	26	readonly
7729	15	14	0	5	f	f	WorkflowPermission	27	readonly
7730	15	14	0	5	f	f	WorkflowPermission	28	readonly
7731	15	14	0	5	f	f	WorkflowPermission	29	readonly
7732	15	15	0	5	f	f	WorkflowPermission	project_id	readonly
7733	15	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
7734	15	15	0	5	f	f	WorkflowPermission	subject	readonly
7735	15	15	0	5	f	f	WorkflowPermission	priority_id	readonly
7736	15	15	0	5	f	f	WorkflowPermission	is_private	readonly
7737	15	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7738	15	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7739	15	15	0	5	f	f	WorkflowPermission	description	readonly
7740	15	15	0	5	f	f	WorkflowPermission	2	readonly
7741	15	15	0	5	f	f	WorkflowPermission	3	readonly
7742	15	15	0	5	f	f	WorkflowPermission	4	readonly
7743	15	15	0	5	f	f	WorkflowPermission	5	readonly
7744	15	15	0	5	f	f	WorkflowPermission	13	readonly
7745	15	15	0	5	f	f	WorkflowPermission	24	readonly
7746	15	15	0	5	f	f	WorkflowPermission	78	readonly
7747	15	15	0	5	f	f	WorkflowPermission	79	readonly
7748	15	15	0	5	f	f	WorkflowPermission	80	readonly
7749	15	15	0	5	f	f	WorkflowPermission	81	readonly
7750	15	15	0	5	f	f	WorkflowPermission	82	readonly
7751	15	15	0	5	f	f	WorkflowPermission	83	readonly
7752	15	15	0	5	f	f	WorkflowPermission	84	readonly
7753	15	15	0	5	f	f	WorkflowPermission	85	readonly
7754	15	15	0	5	f	f	WorkflowPermission	86	readonly
7755	15	15	0	5	f	f	WorkflowPermission	87	readonly
7756	15	15	0	5	f	f	WorkflowPermission	88	readonly
7757	15	15	0	5	f	f	WorkflowPermission	69	readonly
7758	15	15	0	5	f	f	WorkflowPermission	26	readonly
7759	15	15	0	5	f	f	WorkflowPermission	27	readonly
7760	15	15	0	5	f	f	WorkflowPermission	28	readonly
7761	15	15	0	5	f	f	WorkflowPermission	29	readonly
7762	15	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
7763	15	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
7764	15	12	0	4	f	f	WorkflowPermission	2	required
7765	15	12	0	4	f	f	WorkflowPermission	3	required
7766	15	12	0	4	f	f	WorkflowPermission	4	required
7767	15	12	0	4	f	f	WorkflowPermission	5	required
7768	15	12	0	4	f	f	WorkflowPermission	13	required
7769	15	12	0	4	f	f	WorkflowPermission	24	required
7770	15	12	0	4	f	f	WorkflowPermission	78	required
7771	15	12	0	4	f	f	WorkflowPermission	79	required
7772	15	12	0	4	f	f	WorkflowPermission	80	required
7773	15	12	0	4	f	f	WorkflowPermission	81	required
7774	15	12	0	4	f	f	WorkflowPermission	82	required
7775	15	12	0	4	f	f	WorkflowPermission	83	required
7776	15	12	0	4	f	f	WorkflowPermission	84	required
7777	15	12	0	4	f	f	WorkflowPermission	85	required
7778	15	12	0	4	f	f	WorkflowPermission	86	required
7779	15	12	0	4	f	f	WorkflowPermission	87	required
7780	15	12	0	4	f	f	WorkflowPermission	88	required
7781	15	13	0	4	f	f	WorkflowPermission	project_id	readonly
7782	15	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
7783	15	13	0	4	f	f	WorkflowPermission	subject	readonly
7784	15	13	0	4	f	f	WorkflowPermission	priority_id	readonly
7785	15	13	0	4	f	f	WorkflowPermission	is_private	readonly
7786	15	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7787	15	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7788	15	13	0	4	f	f	WorkflowPermission	description	readonly
7789	15	13	0	4	f	f	WorkflowPermission	2	readonly
7790	15	13	0	4	f	f	WorkflowPermission	3	readonly
7791	15	13	0	4	f	f	WorkflowPermission	4	readonly
7792	15	13	0	4	f	f	WorkflowPermission	5	readonly
7793	15	13	0	4	f	f	WorkflowPermission	13	readonly
7794	15	13	0	4	f	f	WorkflowPermission	24	readonly
7795	15	13	0	4	f	f	WorkflowPermission	78	readonly
7796	15	13	0	4	f	f	WorkflowPermission	79	readonly
7797	15	13	0	4	f	f	WorkflowPermission	80	readonly
7798	15	13	0	4	f	f	WorkflowPermission	81	readonly
7799	15	13	0	4	f	f	WorkflowPermission	82	readonly
7800	15	13	0	4	f	f	WorkflowPermission	83	readonly
7801	15	13	0	4	f	f	WorkflowPermission	84	readonly
7802	15	13	0	4	f	f	WorkflowPermission	85	readonly
7803	15	13	0	4	f	f	WorkflowPermission	86	readonly
7804	15	13	0	4	f	f	WorkflowPermission	87	readonly
7805	15	13	0	4	f	f	WorkflowPermission	88	readonly
7806	15	13	0	4	f	f	WorkflowPermission	69	readonly
7807	15	13	0	4	f	f	WorkflowPermission	26	readonly
7808	15	13	0	4	f	f	WorkflowPermission	27	readonly
7809	15	13	0	4	f	f	WorkflowPermission	28	readonly
7810	15	13	0	4	f	f	WorkflowPermission	29	readonly
7811	15	13	0	4	f	f	WorkflowPermission	71	readonly
7812	15	13	0	4	f	f	WorkflowPermission	72	readonly
7813	15	14	0	4	f	f	WorkflowPermission	project_id	readonly
7814	15	14	0	4	f	f	WorkflowPermission	tracker_id	readonly
7815	15	14	0	4	f	f	WorkflowPermission	subject	readonly
7816	15	14	0	4	f	f	WorkflowPermission	priority_id	readonly
7817	15	14	0	4	f	f	WorkflowPermission	is_private	readonly
7818	15	14	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7819	15	14	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7820	15	14	0	4	f	f	WorkflowPermission	description	readonly
7821	15	14	0	4	f	f	WorkflowPermission	2	readonly
7822	15	14	0	4	f	f	WorkflowPermission	3	readonly
7823	15	14	0	4	f	f	WorkflowPermission	4	readonly
7824	15	14	0	4	f	f	WorkflowPermission	5	readonly
7825	15	14	0	4	f	f	WorkflowPermission	13	readonly
7826	15	14	0	4	f	f	WorkflowPermission	24	readonly
7827	15	14	0	4	f	f	WorkflowPermission	78	readonly
7828	15	14	0	4	f	f	WorkflowPermission	79	readonly
7829	15	14	0	4	f	f	WorkflowPermission	80	readonly
7830	15	14	0	4	f	f	WorkflowPermission	81	readonly
7831	15	14	0	4	f	f	WorkflowPermission	82	readonly
7832	15	14	0	4	f	f	WorkflowPermission	83	readonly
7833	15	14	0	4	f	f	WorkflowPermission	84	readonly
7834	15	14	0	4	f	f	WorkflowPermission	85	readonly
7835	15	14	0	4	f	f	WorkflowPermission	86	readonly
7836	15	14	0	4	f	f	WorkflowPermission	87	readonly
7837	15	14	0	4	f	f	WorkflowPermission	88	readonly
7838	15	14	0	4	f	f	WorkflowPermission	69	readonly
7839	15	14	0	4	f	f	WorkflowPermission	26	readonly
7840	15	14	0	4	f	f	WorkflowPermission	27	readonly
7841	15	14	0	4	f	f	WorkflowPermission	28	readonly
7842	15	14	0	4	f	f	WorkflowPermission	29	readonly
7843	15	14	0	4	f	f	WorkflowPermission	71	readonly
7844	15	14	0	4	f	f	WorkflowPermission	72	readonly
7845	15	15	0	4	f	f	WorkflowPermission	project_id	readonly
7846	15	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
7847	15	15	0	4	f	f	WorkflowPermission	subject	readonly
7848	15	15	0	4	f	f	WorkflowPermission	priority_id	readonly
7849	15	15	0	4	f	f	WorkflowPermission	is_private	readonly
7850	15	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7851	15	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7852	15	15	0	4	f	f	WorkflowPermission	description	readonly
7853	15	15	0	4	f	f	WorkflowPermission	2	readonly
7854	15	15	0	4	f	f	WorkflowPermission	3	readonly
7855	15	15	0	4	f	f	WorkflowPermission	4	readonly
7856	15	15	0	4	f	f	WorkflowPermission	5	readonly
7857	15	15	0	4	f	f	WorkflowPermission	13	readonly
7858	15	15	0	4	f	f	WorkflowPermission	24	readonly
7859	15	15	0	4	f	f	WorkflowPermission	78	readonly
7860	15	15	0	4	f	f	WorkflowPermission	79	readonly
7861	15	15	0	4	f	f	WorkflowPermission	80	readonly
7862	15	15	0	4	f	f	WorkflowPermission	81	readonly
7863	15	15	0	4	f	f	WorkflowPermission	82	readonly
7864	15	15	0	4	f	f	WorkflowPermission	83	readonly
7865	15	15	0	4	f	f	WorkflowPermission	84	readonly
7866	15	15	0	4	f	f	WorkflowPermission	85	readonly
7867	15	15	0	4	f	f	WorkflowPermission	86	readonly
7868	15	15	0	4	f	f	WorkflowPermission	87	readonly
7869	15	15	0	4	f	f	WorkflowPermission	88	readonly
7870	15	15	0	4	f	f	WorkflowPermission	69	readonly
7871	15	15	0	4	f	f	WorkflowPermission	26	readonly
7872	15	15	0	4	f	f	WorkflowPermission	27	readonly
7873	15	15	0	4	f	f	WorkflowPermission	28	readonly
7874	15	15	0	4	f	f	WorkflowPermission	29	readonly
7875	15	15	0	4	f	f	WorkflowPermission	71	readonly
7876	15	15	0	4	f	f	WorkflowPermission	72	readonly
7877	14	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
7878	14	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
7879	14	12	0	5	f	f	WorkflowPermission	2	required
7880	14	12	0	5	f	f	WorkflowPermission	3	required
7881	14	12	0	5	f	f	WorkflowPermission	4	required
7882	14	12	0	5	f	f	WorkflowPermission	5	required
7883	14	12	0	5	f	f	WorkflowPermission	6	required
7884	14	12	0	5	f	f	WorkflowPermission	23	required
7885	14	12	0	5	f	f	WorkflowPermission	75	required
7886	14	12	0	5	f	f	WorkflowPermission	38	required
7887	14	12	0	5	f	f	WorkflowPermission	39	required
7888	14	12	0	5	f	f	WorkflowPermission	40	required
7889	14	12	0	5	f	f	WorkflowPermission	41	required
7890	14	12	0	5	f	f	WorkflowPermission	59	required
7891	14	12	0	5	f	f	WorkflowPermission	60	required
7892	14	12	0	5	f	f	WorkflowPermission	61	required
7893	14	13	0	5	f	f	WorkflowPermission	project_id	readonly
7894	14	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
7895	14	13	0	5	f	f	WorkflowPermission	subject	readonly
7896	14	13	0	5	f	f	WorkflowPermission	priority_id	readonly
7897	14	13	0	5	f	f	WorkflowPermission	is_private	readonly
7898	14	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7899	14	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7900	14	13	0	5	f	f	WorkflowPermission	2	readonly
7901	14	13	0	5	f	f	WorkflowPermission	3	readonly
7902	14	13	0	5	f	f	WorkflowPermission	4	readonly
7903	14	13	0	5	f	f	WorkflowPermission	5	readonly
7904	14	13	0	5	f	f	WorkflowPermission	6	readonly
7905	14	13	0	5	f	f	WorkflowPermission	23	readonly
7906	14	13	0	5	f	f	WorkflowPermission	75	readonly
7907	14	13	0	5	f	f	WorkflowPermission	38	readonly
7908	14	13	0	5	f	f	WorkflowPermission	39	readonly
7909	14	13	0	5	f	f	WorkflowPermission	40	readonly
7910	14	13	0	5	f	f	WorkflowPermission	41	readonly
7911	14	13	0	5	f	f	WorkflowPermission	59	readonly
7912	14	13	0	5	f	f	WorkflowPermission	60	readonly
7913	14	13	0	5	f	f	WorkflowPermission	61	readonly
7914	14	13	0	5	f	f	WorkflowPermission	69	readonly
7915	14	13	0	5	f	f	WorkflowPermission	26	readonly
7916	14	13	0	5	f	f	WorkflowPermission	27	readonly
7917	14	13	0	5	f	f	WorkflowPermission	28	readonly
7918	14	13	0	5	f	f	WorkflowPermission	29	readonly
7919	14	15	0	5	f	f	WorkflowPermission	project_id	readonly
7920	14	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
7921	14	15	0	5	f	f	WorkflowPermission	subject	readonly
7922	14	15	0	5	f	f	WorkflowPermission	priority_id	readonly
7923	14	15	0	5	f	f	WorkflowPermission	is_private	readonly
7924	14	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
7925	14	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
7926	14	15	0	5	f	f	WorkflowPermission	2	readonly
7927	14	15	0	5	f	f	WorkflowPermission	3	readonly
7928	14	15	0	5	f	f	WorkflowPermission	4	readonly
7929	14	15	0	5	f	f	WorkflowPermission	5	readonly
7930	14	15	0	5	f	f	WorkflowPermission	6	readonly
7931	14	15	0	5	f	f	WorkflowPermission	23	readonly
7932	14	15	0	5	f	f	WorkflowPermission	75	readonly
7933	14	15	0	5	f	f	WorkflowPermission	38	readonly
7934	14	15	0	5	f	f	WorkflowPermission	39	readonly
7935	14	15	0	5	f	f	WorkflowPermission	40	readonly
7936	14	15	0	5	f	f	WorkflowPermission	41	readonly
7937	14	15	0	5	f	f	WorkflowPermission	59	readonly
7938	14	15	0	5	f	f	WorkflowPermission	60	readonly
7939	14	15	0	5	f	f	WorkflowPermission	61	readonly
7940	14	15	0	5	f	f	WorkflowPermission	69	readonly
7941	14	15	0	5	f	f	WorkflowPermission	26	readonly
7942	14	15	0	5	f	f	WorkflowPermission	27	readonly
7943	14	15	0	5	f	f	WorkflowPermission	28	readonly
7944	14	15	0	5	f	f	WorkflowPermission	29	readonly
7945	14	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
7946	14	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
7947	14	12	0	4	f	f	WorkflowPermission	2	required
7948	14	12	0	4	f	f	WorkflowPermission	3	required
7949	14	12	0	4	f	f	WorkflowPermission	4	required
7950	14	12	0	4	f	f	WorkflowPermission	5	required
7951	14	12	0	4	f	f	WorkflowPermission	6	required
7952	14	12	0	4	f	f	WorkflowPermission	23	required
7953	14	12	0	4	f	f	WorkflowPermission	75	required
7954	14	12	0	4	f	f	WorkflowPermission	38	required
7955	14	12	0	4	f	f	WorkflowPermission	39	required
7956	14	12	0	4	f	f	WorkflowPermission	40	required
7957	14	12	0	4	f	f	WorkflowPermission	41	required
7958	14	12	0	4	f	f	WorkflowPermission	59	required
7959	14	12	0	4	f	f	WorkflowPermission	60	required
7960	14	12	0	4	f	f	WorkflowPermission	61	required
7961	14	13	0	4	f	f	WorkflowPermission	project_id	readonly
7962	14	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
7963	14	13	0	4	f	f	WorkflowPermission	subject	readonly
7964	14	13	0	4	f	f	WorkflowPermission	priority_id	readonly
7965	14	13	0	4	f	f	WorkflowPermission	is_private	readonly
7966	14	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7967	14	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7968	14	13	0	4	f	f	WorkflowPermission	2	readonly
7969	14	13	0	4	f	f	WorkflowPermission	3	readonly
7970	14	13	0	4	f	f	WorkflowPermission	4	readonly
7971	14	13	0	4	f	f	WorkflowPermission	5	readonly
7972	14	13	0	4	f	f	WorkflowPermission	6	readonly
7973	14	13	0	4	f	f	WorkflowPermission	23	readonly
7974	14	13	0	4	f	f	WorkflowPermission	75	readonly
7975	14	13	0	4	f	f	WorkflowPermission	38	readonly
7976	14	13	0	4	f	f	WorkflowPermission	39	readonly
7977	14	13	0	4	f	f	WorkflowPermission	40	readonly
7978	14	13	0	4	f	f	WorkflowPermission	41	readonly
7979	14	13	0	4	f	f	WorkflowPermission	59	readonly
7980	14	13	0	4	f	f	WorkflowPermission	60	readonly
7981	14	13	0	4	f	f	WorkflowPermission	61	readonly
7982	14	13	0	4	f	f	WorkflowPermission	69	readonly
7983	14	13	0	4	f	f	WorkflowPermission	26	readonly
7984	14	13	0	4	f	f	WorkflowPermission	27	readonly
7985	14	13	0	4	f	f	WorkflowPermission	28	readonly
7986	14	13	0	4	f	f	WorkflowPermission	29	readonly
7987	14	15	0	4	f	f	WorkflowPermission	project_id	readonly
7988	14	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
7989	14	15	0	4	f	f	WorkflowPermission	subject	readonly
7990	14	15	0	4	f	f	WorkflowPermission	priority_id	readonly
7991	14	15	0	4	f	f	WorkflowPermission	is_private	readonly
7992	14	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
7993	14	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
7994	14	15	0	4	f	f	WorkflowPermission	2	readonly
7995	14	15	0	4	f	f	WorkflowPermission	3	readonly
7996	14	15	0	4	f	f	WorkflowPermission	4	readonly
7997	14	15	0	4	f	f	WorkflowPermission	5	readonly
7998	14	15	0	4	f	f	WorkflowPermission	6	readonly
7999	14	15	0	4	f	f	WorkflowPermission	23	readonly
8000	14	15	0	4	f	f	WorkflowPermission	75	readonly
8001	14	15	0	4	f	f	WorkflowPermission	38	readonly
8002	14	15	0	4	f	f	WorkflowPermission	39	readonly
8003	14	15	0	4	f	f	WorkflowPermission	40	readonly
8004	14	15	0	4	f	f	WorkflowPermission	41	readonly
8005	14	15	0	4	f	f	WorkflowPermission	59	readonly
8006	14	15	0	4	f	f	WorkflowPermission	60	readonly
8007	14	15	0	4	f	f	WorkflowPermission	61	readonly
8008	14	15	0	4	f	f	WorkflowPermission	69	readonly
8009	14	15	0	4	f	f	WorkflowPermission	26	readonly
8010	14	15	0	4	f	f	WorkflowPermission	27	readonly
8011	14	15	0	4	f	f	WorkflowPermission	28	readonly
8012	14	15	0	4	f	f	WorkflowPermission	29	readonly
8013	13	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
8014	13	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
8015	13	12	0	4	f	f	WorkflowPermission	2	required
8016	13	12	0	4	f	f	WorkflowPermission	3	required
8017	13	12	0	4	f	f	WorkflowPermission	4	required
8018	13	12	0	4	f	f	WorkflowPermission	5	required
8019	13	12	0	4	f	f	WorkflowPermission	23	required
8020	13	12	0	4	f	f	WorkflowPermission	75	required
8021	13	12	0	4	f	f	WorkflowPermission	76	required
8022	13	12	0	4	f	f	WorkflowPermission	77	required
8023	13	12	0	4	f	f	WorkflowPermission	38	required
8024	13	12	0	4	f	f	WorkflowPermission	39	required
8025	13	12	0	4	f	f	WorkflowPermission	40	required
8026	13	12	0	4	f	f	WorkflowPermission	41	required
8027	13	12	0	4	f	f	WorkflowPermission	58	required
8028	13	12	0	4	f	f	WorkflowPermission	57	required
8029	13	12	0	4	f	f	WorkflowPermission	25	required
8030	13	13	0	4	f	f	WorkflowPermission	project_id	readonly
8031	13	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
8032	13	13	0	4	f	f	WorkflowPermission	subject	readonly
8033	13	13	0	4	f	f	WorkflowPermission	priority_id	readonly
8034	13	13	0	4	f	f	WorkflowPermission	is_private	readonly
8035	13	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
8036	13	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
8037	13	13	0	4	f	f	WorkflowPermission	description	readonly
8038	13	13	0	4	f	f	WorkflowPermission	2	readonly
8039	13	13	0	4	f	f	WorkflowPermission	3	readonly
8040	13	13	0	4	f	f	WorkflowPermission	4	readonly
8041	13	13	0	4	f	f	WorkflowPermission	5	readonly
8042	13	13	0	4	f	f	WorkflowPermission	23	readonly
8043	13	13	0	4	f	f	WorkflowPermission	75	readonly
8044	13	13	0	4	f	f	WorkflowPermission	76	readonly
8045	13	13	0	4	f	f	WorkflowPermission	77	readonly
8046	13	13	0	4	f	f	WorkflowPermission	38	readonly
8047	13	13	0	4	f	f	WorkflowPermission	39	readonly
8048	13	13	0	4	f	f	WorkflowPermission	40	readonly
8049	13	13	0	4	f	f	WorkflowPermission	41	readonly
8050	13	13	0	4	f	f	WorkflowPermission	58	readonly
8051	13	13	0	4	f	f	WorkflowPermission	57	readonly
8052	13	13	0	4	f	f	WorkflowPermission	25	readonly
8053	13	13	0	4	f	f	WorkflowPermission	69	readonly
8054	13	13	0	4	f	f	WorkflowPermission	26	readonly
8055	13	13	0	4	f	f	WorkflowPermission	27	readonly
8056	13	13	0	4	f	f	WorkflowPermission	28	readonly
8057	13	13	0	4	f	f	WorkflowPermission	29	readonly
8058	13	15	0	4	f	f	WorkflowPermission	project_id	readonly
8059	13	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
8060	13	15	0	4	f	f	WorkflowPermission	subject	readonly
8061	13	15	0	4	f	f	WorkflowPermission	priority_id	readonly
8062	13	15	0	4	f	f	WorkflowPermission	is_private	readonly
8063	13	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
8064	13	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
8065	13	15	0	4	f	f	WorkflowPermission	description	readonly
8066	13	15	0	4	f	f	WorkflowPermission	2	readonly
8067	13	15	0	4	f	f	WorkflowPermission	3	readonly
8068	13	15	0	4	f	f	WorkflowPermission	4	readonly
8069	13	15	0	4	f	f	WorkflowPermission	5	readonly
8070	13	15	0	4	f	f	WorkflowPermission	23	readonly
8071	13	15	0	4	f	f	WorkflowPermission	75	readonly
8072	13	15	0	4	f	f	WorkflowPermission	76	readonly
8073	13	15	0	4	f	f	WorkflowPermission	77	readonly
8074	13	15	0	4	f	f	WorkflowPermission	38	readonly
8075	13	15	0	4	f	f	WorkflowPermission	39	readonly
8076	13	15	0	4	f	f	WorkflowPermission	40	readonly
8077	13	15	0	4	f	f	WorkflowPermission	41	readonly
8078	13	15	0	4	f	f	WorkflowPermission	58	readonly
8079	13	15	0	4	f	f	WorkflowPermission	57	readonly
8080	13	15	0	4	f	f	WorkflowPermission	25	readonly
8081	13	15	0	4	f	f	WorkflowPermission	69	readonly
8082	13	15	0	4	f	f	WorkflowPermission	26	readonly
8083	13	15	0	4	f	f	WorkflowPermission	27	readonly
8084	13	15	0	4	f	f	WorkflowPermission	28	readonly
8085	13	15	0	4	f	f	WorkflowPermission	29	readonly
8086	13	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
8087	13	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
8088	13	12	0	5	f	f	WorkflowPermission	2	required
8089	13	12	0	5	f	f	WorkflowPermission	3	required
8090	13	12	0	5	f	f	WorkflowPermission	4	required
8091	13	12	0	5	f	f	WorkflowPermission	5	required
8092	13	12	0	5	f	f	WorkflowPermission	23	required
8093	13	12	0	5	f	f	WorkflowPermission	75	required
8094	13	12	0	5	f	f	WorkflowPermission	76	required
8095	13	12	0	5	f	f	WorkflowPermission	77	required
8096	13	12	0	5	f	f	WorkflowPermission	38	required
8097	13	12	0	5	f	f	WorkflowPermission	39	required
8098	13	12	0	5	f	f	WorkflowPermission	40	required
8099	13	12	0	5	f	f	WorkflowPermission	41	required
8100	13	12	0	5	f	f	WorkflowPermission	58	required
8101	13	12	0	5	f	f	WorkflowPermission	57	required
8102	13	12	0	5	f	f	WorkflowPermission	25	required
8103	13	13	0	5	f	f	WorkflowPermission	project_id	readonly
8104	13	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
8105	13	13	0	5	f	f	WorkflowPermission	subject	readonly
8106	13	13	0	5	f	f	WorkflowPermission	priority_id	readonly
8107	13	13	0	5	f	f	WorkflowPermission	is_private	readonly
8108	13	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
8109	13	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
8110	13	13	0	5	f	f	WorkflowPermission	description	readonly
8111	13	13	0	5	f	f	WorkflowPermission	2	readonly
8112	13	13	0	5	f	f	WorkflowPermission	3	readonly
8113	13	13	0	5	f	f	WorkflowPermission	4	readonly
8114	13	13	0	5	f	f	WorkflowPermission	5	readonly
8115	13	13	0	5	f	f	WorkflowPermission	23	readonly
8116	13	13	0	5	f	f	WorkflowPermission	75	readonly
8117	13	13	0	5	f	f	WorkflowPermission	76	readonly
8118	13	13	0	5	f	f	WorkflowPermission	77	readonly
8119	13	13	0	5	f	f	WorkflowPermission	38	readonly
8120	13	13	0	5	f	f	WorkflowPermission	39	readonly
8121	13	13	0	5	f	f	WorkflowPermission	40	readonly
8122	13	13	0	5	f	f	WorkflowPermission	41	readonly
8123	13	13	0	5	f	f	WorkflowPermission	58	readonly
8124	13	13	0	5	f	f	WorkflowPermission	57	readonly
8125	13	13	0	5	f	f	WorkflowPermission	25	readonly
8126	13	13	0	5	f	f	WorkflowPermission	69	readonly
8127	13	13	0	5	f	f	WorkflowPermission	26	readonly
8128	13	13	0	5	f	f	WorkflowPermission	27	readonly
8129	13	13	0	5	f	f	WorkflowPermission	28	readonly
8130	13	13	0	5	f	f	WorkflowPermission	29	readonly
8131	13	15	0	5	f	f	WorkflowPermission	project_id	readonly
8132	13	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
8133	13	15	0	5	f	f	WorkflowPermission	subject	readonly
8134	13	15	0	5	f	f	WorkflowPermission	priority_id	readonly
8135	13	15	0	5	f	f	WorkflowPermission	is_private	readonly
8136	13	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
8137	13	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
8138	13	15	0	5	f	f	WorkflowPermission	description	readonly
8139	13	15	0	5	f	f	WorkflowPermission	2	readonly
8140	13	15	0	5	f	f	WorkflowPermission	3	readonly
8141	13	15	0	5	f	f	WorkflowPermission	4	readonly
8142	13	15	0	5	f	f	WorkflowPermission	5	readonly
8143	13	15	0	5	f	f	WorkflowPermission	23	readonly
8144	13	15	0	5	f	f	WorkflowPermission	75	readonly
8145	13	15	0	5	f	f	WorkflowPermission	76	readonly
8146	13	15	0	5	f	f	WorkflowPermission	77	readonly
8147	13	15	0	5	f	f	WorkflowPermission	38	readonly
8148	13	15	0	5	f	f	WorkflowPermission	39	readonly
8149	13	15	0	5	f	f	WorkflowPermission	40	readonly
8150	13	15	0	5	f	f	WorkflowPermission	41	readonly
8151	13	15	0	5	f	f	WorkflowPermission	58	readonly
8152	13	15	0	5	f	f	WorkflowPermission	57	readonly
8153	13	15	0	5	f	f	WorkflowPermission	25	readonly
8154	13	15	0	5	f	f	WorkflowPermission	69	readonly
8155	13	15	0	5	f	f	WorkflowPermission	26	readonly
8156	13	15	0	5	f	f	WorkflowPermission	27	readonly
8157	13	15	0	5	f	f	WorkflowPermission	28	readonly
8158	13	15	0	5	f	f	WorkflowPermission	29	readonly
8159	12	6	0	5	f	f	WorkflowPermission	assigned_to_id	required
8160	12	12	0	5	f	f	WorkflowPermission	assigned_to_id	required
8161	12	12	0	5	f	f	WorkflowPermission	2	required
8162	12	12	0	5	f	f	WorkflowPermission	3	required
8163	12	12	0	5	f	f	WorkflowPermission	4	required
8164	12	12	0	5	f	f	WorkflowPermission	5	required
8165	12	12	0	5	f	f	WorkflowPermission	7	required
8166	12	12	0	5	f	f	WorkflowPermission	9	required
8167	12	12	0	5	f	f	WorkflowPermission	23	required
8168	12	12	0	5	f	f	WorkflowPermission	73	required
8169	12	12	0	5	f	f	WorkflowPermission	74	required
8170	12	12	0	5	f	f	WorkflowPermission	51	required
8171	12	12	0	5	f	f	WorkflowPermission	52	required
8172	12	12	0	5	f	f	WorkflowPermission	53	required
8173	12	12	0	5	f	f	WorkflowPermission	54	required
8174	12	12	0	5	f	f	WorkflowPermission	25	required
8175	12	12	0	5	f	f	WorkflowPermission	46	required
8176	12	12	0	5	f	f	WorkflowPermission	47	required
8177	12	12	0	5	f	f	WorkflowPermission	70	required
8178	12	13	0	5	f	f	WorkflowPermission	project_id	readonly
8179	12	13	0	5	f	f	WorkflowPermission	tracker_id	readonly
8180	12	13	0	5	f	f	WorkflowPermission	subject	readonly
8181	12	13	0	5	f	f	WorkflowPermission	priority_id	readonly
8182	12	13	0	5	f	f	WorkflowPermission	is_private	readonly
8183	12	13	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
8184	12	13	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
8185	12	13	0	5	f	f	WorkflowPermission	description	readonly
8186	12	13	0	5	f	f	WorkflowPermission	2	readonly
8187	12	13	0	5	f	f	WorkflowPermission	3	readonly
8188	12	13	0	5	f	f	WorkflowPermission	4	readonly
8189	12	13	0	5	f	f	WorkflowPermission	5	readonly
8190	12	13	0	5	f	f	WorkflowPermission	7	readonly
8191	12	13	0	5	f	f	WorkflowPermission	9	readonly
8192	12	13	0	5	f	f	WorkflowPermission	23	readonly
8193	12	13	0	5	f	f	WorkflowPermission	73	readonly
8194	12	13	0	5	f	f	WorkflowPermission	74	readonly
8195	12	13	0	5	f	f	WorkflowPermission	51	readonly
8196	12	13	0	5	f	f	WorkflowPermission	52	readonly
8197	12	13	0	5	f	f	WorkflowPermission	53	readonly
8198	12	13	0	5	f	f	WorkflowPermission	54	readonly
8199	12	13	0	5	f	f	WorkflowPermission	25	readonly
8200	12	13	0	5	f	f	WorkflowPermission	46	readonly
8201	12	13	0	5	f	f	WorkflowPermission	47	readonly
8202	12	13	0	5	f	f	WorkflowPermission	70	readonly
8203	12	13	0	5	f	f	WorkflowPermission	69	readonly
8204	12	13	0	5	f	f	WorkflowPermission	26	readonly
8205	12	13	0	5	f	f	WorkflowPermission	27	readonly
8206	12	13	0	5	f	f	WorkflowPermission	28	readonly
8207	12	13	0	5	f	f	WorkflowPermission	29	readonly
8208	12	15	0	5	f	f	WorkflowPermission	project_id	readonly
8209	12	15	0	5	f	f	WorkflowPermission	tracker_id	readonly
8210	12	15	0	5	f	f	WorkflowPermission	subject	readonly
8211	12	15	0	5	f	f	WorkflowPermission	priority_id	readonly
8212	12	15	0	5	f	f	WorkflowPermission	is_private	readonly
8213	12	15	0	5	f	f	WorkflowPermission	assigned_to_id	readonly
8214	12	15	0	5	f	f	WorkflowPermission	parent_issue_id	readonly
8215	12	15	0	5	f	f	WorkflowPermission	description	readonly
8216	12	15	0	5	f	f	WorkflowPermission	2	readonly
8217	12	15	0	5	f	f	WorkflowPermission	3	readonly
8218	12	15	0	5	f	f	WorkflowPermission	4	readonly
8219	12	15	0	5	f	f	WorkflowPermission	5	readonly
8220	12	15	0	5	f	f	WorkflowPermission	7	readonly
8221	12	15	0	5	f	f	WorkflowPermission	9	readonly
8222	12	15	0	5	f	f	WorkflowPermission	23	readonly
8223	12	15	0	5	f	f	WorkflowPermission	73	readonly
8224	12	15	0	5	f	f	WorkflowPermission	74	readonly
8225	12	15	0	5	f	f	WorkflowPermission	51	readonly
8226	12	15	0	5	f	f	WorkflowPermission	52	readonly
8227	12	15	0	5	f	f	WorkflowPermission	53	readonly
8228	12	15	0	5	f	f	WorkflowPermission	54	readonly
8229	12	15	0	5	f	f	WorkflowPermission	25	readonly
8230	12	15	0	5	f	f	WorkflowPermission	46	readonly
8231	12	15	0	5	f	f	WorkflowPermission	47	readonly
8232	12	15	0	5	f	f	WorkflowPermission	70	readonly
8233	12	15	0	5	f	f	WorkflowPermission	69	readonly
8234	12	15	0	5	f	f	WorkflowPermission	26	readonly
8235	12	15	0	5	f	f	WorkflowPermission	27	readonly
8236	12	15	0	5	f	f	WorkflowPermission	28	readonly
8237	12	15	0	5	f	f	WorkflowPermission	29	readonly
8238	11	6	0	4	f	f	WorkflowPermission	assigned_to_id	required
8239	11	12	0	4	f	f	WorkflowPermission	assigned_to_id	required
8240	11	12	0	4	f	f	WorkflowPermission	2	required
8241	11	12	0	4	f	f	WorkflowPermission	3	required
8242	11	12	0	4	f	f	WorkflowPermission	4	required
8243	11	12	0	4	f	f	WorkflowPermission	5	required
8244	11	12	0	4	f	f	WorkflowPermission	7	required
8245	11	12	0	4	f	f	WorkflowPermission	9	required
8246	11	12	0	4	f	f	WorkflowPermission	23	required
8247	11	12	0	4	f	f	WorkflowPermission	34	required
8248	11	12	0	4	f	f	WorkflowPermission	35	required
8249	11	12	0	4	f	f	WorkflowPermission	36	required
8250	11	12	0	4	f	f	WorkflowPermission	37	required
8251	11	12	0	4	f	f	WorkflowPermission	38	required
8252	11	12	0	4	f	f	WorkflowPermission	39	required
8253	11	12	0	4	f	f	WorkflowPermission	40	required
8254	11	12	0	4	f	f	WorkflowPermission	41	required
8255	11	12	0	4	f	f	WorkflowPermission	42	required
8256	11	12	0	4	f	f	WorkflowPermission	43	required
8257	11	12	0	4	f	f	WorkflowPermission	44	required
8258	11	12	0	4	f	f	WorkflowPermission	45	required
8259	11	12	0	4	f	f	WorkflowPermission	25	required
8260	11	12	0	4	f	f	WorkflowPermission	46	required
8261	11	12	0	4	f	f	WorkflowPermission	47	required
8262	11	13	0	4	f	f	WorkflowPermission	project_id	readonly
8263	11	13	0	4	f	f	WorkflowPermission	tracker_id	readonly
8264	11	13	0	4	f	f	WorkflowPermission	subject	readonly
8265	11	13	0	4	f	f	WorkflowPermission	priority_id	readonly
8266	11	13	0	4	f	f	WorkflowPermission	is_private	readonly
8267	11	13	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
8268	11	13	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
8269	11	13	0	4	f	f	WorkflowPermission	description	readonly
8270	11	13	0	4	f	f	WorkflowPermission	2	readonly
8271	11	13	0	4	f	f	WorkflowPermission	3	readonly
8272	11	13	0	4	f	f	WorkflowPermission	4	readonly
8273	11	13	0	4	f	f	WorkflowPermission	5	readonly
8274	11	13	0	4	f	f	WorkflowPermission	7	readonly
8275	11	13	0	4	f	f	WorkflowPermission	9	readonly
8276	11	13	0	4	f	f	WorkflowPermission	23	readonly
8277	11	13	0	4	f	f	WorkflowPermission	34	readonly
8278	11	13	0	4	f	f	WorkflowPermission	35	readonly
8279	11	13	0	4	f	f	WorkflowPermission	36	readonly
8280	11	13	0	4	f	f	WorkflowPermission	37	readonly
8281	11	13	0	4	f	f	WorkflowPermission	38	readonly
8282	11	13	0	4	f	f	WorkflowPermission	39	readonly
8283	11	13	0	4	f	f	WorkflowPermission	40	readonly
8284	11	13	0	4	f	f	WorkflowPermission	41	readonly
8285	11	13	0	4	f	f	WorkflowPermission	42	readonly
8286	11	13	0	4	f	f	WorkflowPermission	43	readonly
8287	11	13	0	4	f	f	WorkflowPermission	44	readonly
8288	11	13	0	4	f	f	WorkflowPermission	45	readonly
8289	11	13	0	4	f	f	WorkflowPermission	25	readonly
8290	11	13	0	4	f	f	WorkflowPermission	46	readonly
8291	11	13	0	4	f	f	WorkflowPermission	47	readonly
8292	11	13	0	4	f	f	WorkflowPermission	70	readonly
8293	11	13	0	4	f	f	WorkflowPermission	69	readonly
8294	11	13	0	4	f	f	WorkflowPermission	26	readonly
8295	11	13	0	4	f	f	WorkflowPermission	27	readonly
8296	11	13	0	4	f	f	WorkflowPermission	28	readonly
8297	11	13	0	4	f	f	WorkflowPermission	29	readonly
8298	11	15	0	4	f	f	WorkflowPermission	project_id	readonly
8299	11	15	0	4	f	f	WorkflowPermission	tracker_id	readonly
8300	11	15	0	4	f	f	WorkflowPermission	subject	readonly
8301	11	15	0	4	f	f	WorkflowPermission	priority_id	readonly
8302	11	15	0	4	f	f	WorkflowPermission	is_private	readonly
8303	11	15	0	4	f	f	WorkflowPermission	assigned_to_id	readonly
8304	11	15	0	4	f	f	WorkflowPermission	parent_issue_id	readonly
8305	11	15	0	4	f	f	WorkflowPermission	description	readonly
8306	11	15	0	4	f	f	WorkflowPermission	2	readonly
8307	11	15	0	4	f	f	WorkflowPermission	3	readonly
8308	11	15	0	4	f	f	WorkflowPermission	4	readonly
8309	11	15	0	4	f	f	WorkflowPermission	5	readonly
8310	11	15	0	4	f	f	WorkflowPermission	7	readonly
8311	11	15	0	4	f	f	WorkflowPermission	9	readonly
8312	11	15	0	4	f	f	WorkflowPermission	23	readonly
8313	11	15	0	4	f	f	WorkflowPermission	34	readonly
8314	11	15	0	4	f	f	WorkflowPermission	35	readonly
8315	11	15	0	4	f	f	WorkflowPermission	36	readonly
8316	11	15	0	4	f	f	WorkflowPermission	37	readonly
8317	11	15	0	4	f	f	WorkflowPermission	38	readonly
8318	11	15	0	4	f	f	WorkflowPermission	39	readonly
8319	11	15	0	4	f	f	WorkflowPermission	40	readonly
8320	11	15	0	4	f	f	WorkflowPermission	41	readonly
8321	11	15	0	4	f	f	WorkflowPermission	42	readonly
8322	11	15	0	4	f	f	WorkflowPermission	43	readonly
8323	11	15	0	4	f	f	WorkflowPermission	44	readonly
8324	11	15	0	4	f	f	WorkflowPermission	45	readonly
8325	11	15	0	4	f	f	WorkflowPermission	25	readonly
8326	11	15	0	4	f	f	WorkflowPermission	46	readonly
8327	11	15	0	4	f	f	WorkflowPermission	47	readonly
8328	11	15	0	4	f	f	WorkflowPermission	70	readonly
8329	11	15	0	4	f	f	WorkflowPermission	69	readonly
8330	11	15	0	4	f	f	WorkflowPermission	26	readonly
8331	11	15	0	4	f	f	WorkflowPermission	27	readonly
8332	11	15	0	4	f	f	WorkflowPermission	28	readonly
8333	11	15	0	4	f	f	WorkflowPermission	29	readonly
8334	16	6	13	5	f	f	WorkflowTransition	\N	\N
\.


--
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.attachments_id_seq', 1, false);


--
-- Name: auth_sources_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_sources_id_seq', 1, false);


--
-- Name: boards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boards_id_seq', 1, false);


--
-- Name: changes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changes_id_seq', 1, false);


--
-- Name: changesets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.changesets_id_seq', 1, false);


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: custom_field_enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_field_enumerations_id_seq', 1, false);


--
-- Name: custom_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_fields_id_seq', 93, true);


--
-- Name: custom_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.custom_values_id_seq', 30, true);


--
-- Name: documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.documents_id_seq', 1, false);


--
-- Name: email_addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.email_addresses_id_seq', 4, true);


--
-- Name: enabled_modules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enabled_modules_id_seq', 100, true);


--
-- Name: enumerations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enumerations_id_seq', 3, true);


--
-- Name: import_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.import_items_id_seq', 1, false);


--
-- Name: imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imports_id_seq', 1, false);


--
-- Name: issue_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_categories_id_seq', 1, false);


--
-- Name: issue_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_relations_id_seq', 1, false);


--
-- Name: issue_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issue_statuses_id_seq', 15, true);


--
-- Name: issues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.issues_id_seq', 25, true);


--
-- Name: journal_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journal_details_id_seq', 1, false);


--
-- Name: journals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.journals_id_seq', 1, false);


--
-- Name: member_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.member_roles_id_seq', 35, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 35, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_id_seq', 1, false);


--
-- Name: open_id_authentication_associations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.open_id_authentication_associations_id_seq', 1, false);


--
-- Name: open_id_authentication_nonces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.open_id_authentication_nonces_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 44, true);


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.queries_id_seq', 1, false);


--
-- Name: repositories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.repositories_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 5, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 31, true);


--
-- Name: time_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.time_entries_id_seq', 1, false);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 46, true);


--
-- Name: trackers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trackers_id_seq', 17, true);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_preferences_id_seq', 4, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 11, true);


--
-- Name: versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versions_id_seq', 1, false);


--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.watchers_id_seq', 1, false);


--
-- Name: wiki_content_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_content_versions_id_seq', 1, false);


--
-- Name: wiki_contents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_contents_id_seq', 1, false);


--
-- Name: wiki_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_pages_id_seq', 1, false);


--
-- Name: wiki_redirects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wiki_redirects_id_seq', 1, false);


--
-- Name: wikis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.wikis_id_seq', 43, true);


--
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workflows_id_seq', 8334, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: auth_sources auth_sources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_sources
    ADD CONSTRAINT auth_sources_pkey PRIMARY KEY (id);


--
-- Name: boards boards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);


--
-- Name: changes changes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changes
    ADD CONSTRAINT changes_pkey PRIMARY KEY (id);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: custom_field_enumerations custom_field_enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_field_enumerations
    ADD CONSTRAINT custom_field_enumerations_pkey PRIMARY KEY (id);


--
-- Name: custom_fields custom_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_fields
    ADD CONSTRAINT custom_fields_pkey PRIMARY KEY (id);


--
-- Name: custom_values custom_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.custom_values
    ADD CONSTRAINT custom_values_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: email_addresses email_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_addresses
    ADD CONSTRAINT email_addresses_pkey PRIMARY KEY (id);


--
-- Name: enabled_modules enabled_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enabled_modules
    ADD CONSTRAINT enabled_modules_pkey PRIMARY KEY (id);


--
-- Name: enumerations enumerations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enumerations
    ADD CONSTRAINT enumerations_pkey PRIMARY KEY (id);


--
-- Name: import_items import_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.import_items
    ADD CONSTRAINT import_items_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: issue_categories issue_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_categories
    ADD CONSTRAINT issue_categories_pkey PRIMARY KEY (id);


--
-- Name: issue_relations issue_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_relations
    ADD CONSTRAINT issue_relations_pkey PRIMARY KEY (id);


--
-- Name: issue_statuses issue_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issue_statuses
    ADD CONSTRAINT issue_statuses_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: journal_details journal_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journal_details
    ADD CONSTRAINT journal_details_pkey PRIMARY KEY (id);


--
-- Name: journals journals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.journals
    ADD CONSTRAINT journals_pkey PRIMARY KEY (id);


--
-- Name: member_roles member_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member_roles
    ADD CONSTRAINT member_roles_pkey PRIMARY KEY (id);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_associations open_id_authentication_associations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_associations
    ADD CONSTRAINT open_id_authentication_associations_pkey PRIMARY KEY (id);


--
-- Name: open_id_authentication_nonces open_id_authentication_nonces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.open_id_authentication_nonces
    ADD CONSTRAINT open_id_authentication_nonces_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: queries queries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: repositories repositories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.repositories
    ADD CONSTRAINT repositories_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: time_entries time_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.time_entries
    ADD CONSTRAINT time_entries_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: watchers watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: wiki_content_versions wiki_content_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_content_versions
    ADD CONSTRAINT wiki_content_versions_pkey PRIMARY KEY (id);


--
-- Name: wiki_contents wiki_contents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_contents
    ADD CONSTRAINT wiki_contents_pkey PRIMARY KEY (id);


--
-- Name: wiki_pages wiki_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_pages
    ADD CONSTRAINT wiki_pages_pkey PRIMARY KEY (id);


--
-- Name: wiki_redirects wiki_redirects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wiki_redirects
    ADD CONSTRAINT wiki_redirects_pkey PRIMARY KEY (id);


--
-- Name: wikis wikis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.wikis
    ADD CONSTRAINT wikis_pkey PRIMARY KEY (id);


--
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- Name: boards_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX boards_project_id ON public.boards USING btree (project_id);


--
-- Name: changeset_parents_changeset_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changeset_parents_changeset_ids ON public.changeset_parents USING btree (changeset_id);


--
-- Name: changeset_parents_parent_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changeset_parents_parent_ids ON public.changeset_parents USING btree (parent_id);


--
-- Name: changesets_changeset_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changesets_changeset_id ON public.changes USING btree (changeset_id);


--
-- Name: changesets_issues_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX changesets_issues_ids ON public.changesets_issues USING btree (changeset_id, issue_id);


--
-- Name: changesets_repos_rev; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX changesets_repos_rev ON public.changesets USING btree (repository_id, revision);


--
-- Name: changesets_repos_scmid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX changesets_repos_scmid ON public.changesets USING btree (repository_id, scmid);


--
-- Name: custom_fields_roles_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX custom_fields_roles_ids ON public.custom_fields_roles USING btree (custom_field_id, role_id);


--
-- Name: custom_values_customized; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX custom_values_customized ON public.custom_values USING btree (customized_type, customized_id);


--
-- Name: documents_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_project_id ON public.documents USING btree (project_id);


--
-- Name: enabled_modules_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX enabled_modules_project_id ON public.enabled_modules USING btree (project_id);


--
-- Name: groups_users_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX groups_users_ids ON public.groups_users USING btree (group_id, user_id);


--
-- Name: index_attachments_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_author_id ON public.attachments USING btree (author_id);


--
-- Name: index_attachments_on_container_id_and_container_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_container_id_and_container_type ON public.attachments USING btree (container_id, container_type);


--
-- Name: index_attachments_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_created_on ON public.attachments USING btree (created_on);


--
-- Name: index_attachments_on_disk_filename; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_attachments_on_disk_filename ON public.attachments USING btree (disk_filename);


--
-- Name: index_auth_sources_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_auth_sources_on_id_and_type ON public.auth_sources USING btree (id, type);


--
-- Name: index_boards_on_last_message_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_boards_on_last_message_id ON public.boards USING btree (last_message_id);


--
-- Name: index_changesets_issues_on_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_issues_on_issue_id ON public.changesets_issues USING btree (issue_id);


--
-- Name: index_changesets_on_committed_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_committed_on ON public.changesets USING btree (committed_on);


--
-- Name: index_changesets_on_repository_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_repository_id ON public.changesets USING btree (repository_id);


--
-- Name: index_changesets_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_changesets_on_user_id ON public.changesets USING btree (user_id);


--
-- Name: index_comments_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_author_id ON public.comments USING btree (author_id);


--
-- Name: index_comments_on_commented_id_and_commented_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_comments_on_commented_id_and_commented_type ON public.comments USING btree (commented_id, commented_type);


--
-- Name: index_custom_fields_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_custom_fields_on_id_and_type ON public.custom_fields USING btree (id, type);


--
-- Name: index_custom_fields_projects_on_custom_field_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_fields_projects_on_custom_field_id_and_project_id ON public.custom_fields_projects USING btree (custom_field_id, project_id);


--
-- Name: index_custom_fields_trackers_on_custom_field_id_and_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_custom_fields_trackers_on_custom_field_id_and_tracker_id ON public.custom_fields_trackers USING btree (custom_field_id, tracker_id);


--
-- Name: index_custom_values_on_custom_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_custom_values_on_custom_field_id ON public.custom_values USING btree (custom_field_id);


--
-- Name: index_documents_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_category_id ON public.documents USING btree (category_id);


--
-- Name: index_documents_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_documents_on_created_on ON public.documents USING btree (created_on);


--
-- Name: index_email_addresses_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_email_addresses_on_user_id ON public.email_addresses USING btree (user_id);


--
-- Name: index_enumerations_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_enumerations_on_id_and_type ON public.enumerations USING btree (id, type);


--
-- Name: index_enumerations_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_enumerations_on_project_id ON public.enumerations USING btree (project_id);


--
-- Name: index_import_items_on_import_id_and_unique_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_import_items_on_import_id_and_unique_id ON public.import_items USING btree (import_id, unique_id);


--
-- Name: index_issue_categories_on_assigned_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_categories_on_assigned_to_id ON public.issue_categories USING btree (assigned_to_id);


--
-- Name: index_issue_relations_on_issue_from_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_relations_on_issue_from_id ON public.issue_relations USING btree (issue_from_id);


--
-- Name: index_issue_relations_on_issue_from_id_and_issue_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_issue_relations_on_issue_from_id_and_issue_to_id ON public.issue_relations USING btree (issue_from_id, issue_to_id);


--
-- Name: index_issue_relations_on_issue_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_relations_on_issue_to_id ON public.issue_relations USING btree (issue_to_id);


--
-- Name: index_issue_statuses_on_is_closed; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_statuses_on_is_closed ON public.issue_statuses USING btree (is_closed);


--
-- Name: index_issue_statuses_on_position; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issue_statuses_on_position ON public.issue_statuses USING btree ("position");


--
-- Name: index_issues_on_assigned_to_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_assigned_to_id ON public.issues USING btree (assigned_to_id);


--
-- Name: index_issues_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_author_id ON public.issues USING btree (author_id);


--
-- Name: index_issues_on_category_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_category_id ON public.issues USING btree (category_id);


--
-- Name: index_issues_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_created_on ON public.issues USING btree (created_on);


--
-- Name: index_issues_on_fixed_version_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_fixed_version_id ON public.issues USING btree (fixed_version_id);


--
-- Name: index_issues_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_parent_id ON public.issues USING btree (parent_id);


--
-- Name: index_issues_on_priority_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_priority_id ON public.issues USING btree (priority_id);


--
-- Name: index_issues_on_root_id_and_lft_and_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_root_id_and_lft_and_rgt ON public.issues USING btree (root_id, lft, rgt);


--
-- Name: index_issues_on_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_status_id ON public.issues USING btree (status_id);


--
-- Name: index_issues_on_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_issues_on_tracker_id ON public.issues USING btree (tracker_id);


--
-- Name: index_journals_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_created_on ON public.journals USING btree (created_on);


--
-- Name: index_journals_on_journalized_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_journalized_id ON public.journals USING btree (journalized_id);


--
-- Name: index_journals_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_journals_on_user_id ON public.journals USING btree (user_id);


--
-- Name: index_member_roles_on_inherited_from; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_inherited_from ON public.member_roles USING btree (inherited_from);


--
-- Name: index_member_roles_on_member_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_member_id ON public.member_roles USING btree (member_id);


--
-- Name: index_member_roles_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_member_roles_on_role_id ON public.member_roles USING btree (role_id);


--
-- Name: index_members_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_members_on_project_id ON public.members USING btree (project_id);


--
-- Name: index_members_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_members_on_user_id ON public.members USING btree (user_id);


--
-- Name: index_members_on_user_id_and_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_members_on_user_id_and_project_id ON public.members USING btree (user_id, project_id);


--
-- Name: index_messages_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_author_id ON public.messages USING btree (author_id);


--
-- Name: index_messages_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_created_on ON public.messages USING btree (created_on);


--
-- Name: index_messages_on_last_reply_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_messages_on_last_reply_id ON public.messages USING btree (last_reply_id);


--
-- Name: index_news_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_news_on_author_id ON public.news USING btree (author_id);


--
-- Name: index_news_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_news_on_created_on ON public.news USING btree (created_on);


--
-- Name: index_projects_on_lft; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_projects_on_lft ON public.projects USING btree (lft);


--
-- Name: index_projects_on_rgt; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_projects_on_rgt ON public.projects USING btree (rgt);


--
-- Name: index_queries_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_queries_on_project_id ON public.queries USING btree (project_id);


--
-- Name: index_queries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_queries_on_user_id ON public.queries USING btree (user_id);


--
-- Name: index_repositories_on_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_repositories_on_project_id ON public.repositories USING btree (project_id);


--
-- Name: index_roles_managed_roles_on_role_id_and_managed_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_roles_managed_roles_on_role_id_and_managed_role_id ON public.roles_managed_roles USING btree (role_id, managed_role_id);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_settings_on_name ON public.settings USING btree (name);


--
-- Name: index_time_entries_on_activity_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_activity_id ON public.time_entries USING btree (activity_id);


--
-- Name: index_time_entries_on_created_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_created_on ON public.time_entries USING btree (created_on);


--
-- Name: index_time_entries_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_time_entries_on_user_id ON public.time_entries USING btree (user_id);


--
-- Name: index_tokens_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_tokens_on_user_id ON public.tokens USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_user_preferences_on_user_id ON public.user_preferences USING btree (user_id);


--
-- Name: index_users_on_auth_source_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_auth_source_id ON public.users USING btree (auth_source_id);


--
-- Name: index_users_on_id_and_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_id_and_type ON public.users USING btree (id, type);


--
-- Name: index_users_on_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_users_on_type ON public.users USING btree (type);


--
-- Name: index_versions_on_sharing; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_versions_on_sharing ON public.versions USING btree (sharing);


--
-- Name: index_watchers_on_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_watchers_on_user_id ON public.watchers USING btree (user_id);


--
-- Name: index_watchers_on_watchable_id_and_watchable_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_watchers_on_watchable_id_and_watchable_type ON public.watchers USING btree (watchable_id, watchable_type);


--
-- Name: index_wiki_content_versions_on_updated_on; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_content_versions_on_updated_on ON public.wiki_content_versions USING btree (updated_on);


--
-- Name: index_wiki_contents_on_author_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_contents_on_author_id ON public.wiki_contents USING btree (author_id);


--
-- Name: index_wiki_pages_on_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_pages_on_parent_id ON public.wiki_pages USING btree (parent_id);


--
-- Name: index_wiki_pages_on_wiki_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_pages_on_wiki_id ON public.wiki_pages USING btree (wiki_id);


--
-- Name: index_wiki_redirects_on_wiki_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_wiki_redirects_on_wiki_id ON public.wiki_redirects USING btree (wiki_id);


--
-- Name: index_workflows_on_new_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_new_status_id ON public.workflows USING btree (new_status_id);


--
-- Name: index_workflows_on_old_status_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_old_status_id ON public.workflows USING btree (old_status_id);


--
-- Name: index_workflows_on_role_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_role_id ON public.workflows USING btree (role_id);


--
-- Name: index_workflows_on_tracker_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_workflows_on_tracker_id ON public.workflows USING btree (tracker_id);


--
-- Name: issue_categories_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX issue_categories_project_id ON public.issue_categories USING btree (project_id);


--
-- Name: issues_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX issues_project_id ON public.issues USING btree (project_id);


--
-- Name: journal_details_journal_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX journal_details_journal_id ON public.journal_details USING btree (journal_id);


--
-- Name: journals_journalized_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX journals_journalized_id ON public.journals USING btree (journalized_id, journalized_type);


--
-- Name: messages_board_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_board_id ON public.messages USING btree (board_id);


--
-- Name: messages_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_parent_id ON public.messages USING btree (parent_id);


--
-- Name: news_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_project_id ON public.news USING btree (project_id);


--
-- Name: projects_trackers_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX projects_trackers_project_id ON public.projects_trackers USING btree (project_id);


--
-- Name: projects_trackers_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX projects_trackers_unique ON public.projects_trackers USING btree (project_id, tracker_id);


--
-- Name: queries_roles_ids; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX queries_roles_ids ON public.queries_roles USING btree (query_id, role_id);


--
-- Name: time_entries_issue_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX time_entries_issue_id ON public.time_entries USING btree (issue_id);


--
-- Name: time_entries_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX time_entries_project_id ON public.time_entries USING btree (project_id);


--
-- Name: tokens_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tokens_value ON public.tokens USING btree (value);


--
-- Name: versions_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX versions_project_id ON public.versions USING btree (project_id);


--
-- Name: watchers_user_id_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX watchers_user_id_type ON public.watchers USING btree (user_id, watchable_type);


--
-- Name: wiki_content_versions_wcid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_content_versions_wcid ON public.wiki_content_versions USING btree (wiki_content_id);


--
-- Name: wiki_contents_page_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_contents_page_id ON public.wiki_contents USING btree (page_id);


--
-- Name: wiki_pages_wiki_id_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_pages_wiki_id_title ON public.wiki_pages USING btree (wiki_id, title);


--
-- Name: wiki_redirects_wiki_id_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wiki_redirects_wiki_id_title ON public.wiki_redirects USING btree (wiki_id, title);


--
-- Name: wikis_project_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wikis_project_id ON public.wikis USING btree (project_id);


--
-- Name: wkfs_role_tracker_old_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX wkfs_role_tracker_old_status ON public.workflows USING btree (role_id, tracker_id, old_status_id);


--
-- PostgreSQL database dump complete
--

