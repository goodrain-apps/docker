--liquibase formatted sql

--changeset your.name:1
create table person (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback drop table person

--changeset your.name:2
create table company (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
--rollback drop table company

--changeset other.dev:3
alter table person add column country varchar(2)
--rollback alter table person drop column country

--changeset guox:4
create table test_table (id int)
--rollback drop table test_table

--changeset guox:5
DROP TABLE test_table
--rollback create table test_table (id int)

--changeset guox:6
create table test_table_2 (id int)
--rollback drop table test_table_2

--changeset guox:7
INSERT INTO test_table_2 (id) VALUES (1)
--rollback delete from test_table_2 where id=1