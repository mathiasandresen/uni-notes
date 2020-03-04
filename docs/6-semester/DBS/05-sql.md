---
title: SQL
---

# SQL

SQL is a **declerative** query language ("**what**" not "how")

It consists of multiple parts

**Data Definition Language (DDL)**

* Create/change the schema
* create, alter, drop

**Data Manipulation Language (DML)**

* Changes to an instance
* insert, update, delete

**Data Query Language (DQL)**

* Evaluate queries on an instance
* select * from where ... 

**Transaction Control Language (TCL)**

* Controls transactions
* commit, rollback

**Data Control Language (DCL)**

* Grant/revoke access rights
* grant, revoke



## Basic Data Definitions

![image-20200302103001088](../../../../../../Untitled/image-20200302103001088.png)

## Create Tables

```sql
CREATE TABLE professor(
    empidinteger UNIQUE NOT NULL,
    namevarchar(10) NOT NULL,
    rankchar(2));
```

Is equal to

```sql
CREATE TABLE professor(
    empidinteger PRIMARY KEY,
    namevarchar(10) NOT NULL,
    rankchar(2));
```

The primary key constraint includes the NOT NULL and UNIQUE constraints.

### Default Values

When inserting data into a table, all values that are not explicitly stated are set to **null** (standard default value).

When defining a table, we can specify another default value

```sql
CREATE TABLE wine(
	wineID		integer NOT NULL,
	name		varchar(20) NOT NULL,
	color		varchar(10) DEFAULT 'red',
	year		integer,
	vineyard	varchar(20)
);
```

Here the default value of color will be 'red'



## Data Insertion

Standard insertion [w3schools Insert Into](https://www.w3schools.com/sql/sql_insert.asp):

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...); 
```

```sql
INSERT INTO takees
	SELECT studid, courseid
	FROM student, course
	WHERE title = 'Logics';
```

