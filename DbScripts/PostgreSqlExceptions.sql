CREATE TABLE exceptions (
    id bigserial NOT NULL,
    guid uuid NOT NULL,
    applicationname varchar(50) NOT NULL,
    machinename varchar(50) NOT NULL,
    creationdate timestamp without time zone NOT NULL,
    type varchar(100) NOT NULL,
    isprotected boolean DEFAULT false NOT NULL,
    host varchar(100),
    url varchar(500),
    httpmethod varchar(10),
    ipaddress varchar(40),
    source varchar(100),
    message varchar(1000),
    detail text,
    statuscode integer,
    sql text,
    deletiondate timestamp without time zone,
    fulljson text,
    errorhash integer,
    duplicatecount integer DEFAULT 1 NOT NULL,

    CONSTRAINT exceptions_pkey PRIMARY KEY (id)
);

COMMENT ON TABLE exceptions IS 'SQL store for StackExchange.Exceptional error handler';

CREATE INDEX ix_exceptions_errorhash_appname_creationdate_deldate ON exceptions USING btree (errorhash, applicationname, creationdate DESC, deletiondate);

CREATE INDEX ix_exceptions_guid_applicationname_deletiondate_creationdate ON exceptions USING btree (guid, applicationname, deletiondate, creationdate DESC);
