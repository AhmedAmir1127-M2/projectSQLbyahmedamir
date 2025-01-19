SQL Database Project: University Professors and Affiliations Management

Project Overview

This project involves the creation and management of a relational database system to model the relationships between professors, universities, organizations, and their affiliations. The primary focus is to store, query, and manipulate data efficiently, enabling insightful analysis and meaningful reports.

Objectives

Data Organization: Separate and normalize data into meaningful entities such as professors, universities, organizations, and affiliations.

Data Integrity: Enforce relationships and constraints to maintain data consistency.

Data Analysis: Perform complex queries to derive insights such as the number of professors per university, affiliations of professors, and more.

Data Manipulation: Demonstrate the use of SQL features like cascading updates and deletions to reflect real-world changes effectively.

Database Schema

The project is built around four core tables:

1. professors

Stores data about professors, including their names and the universities they are associated with.

Columns:

firstname (VARCHAR(100)): First name of the professor.

lastname (VARCHAR(100)): Last name of the professor.

university_shortname (VARCHAR(50)): Short name of the university the professor belongs to.

2. universities

Represents universities, their cities, and their short names.

Columns:

university_shortname (VARCHAR(50)): Unique short name for the university (Primary Key).

university_city (VARCHAR(100)): City where the university is located.

university (VARCHAR(255)): Full name of the university.

3. organizations

Captures details about organizations and their sectors.

Columns:

organization_sector (VARCHAR(100)): The sector the organization belongs to.

organization (VARCHAR(255)): Name of the organization.

4. affiliations

Links professors with organizations, detailing their roles.

Columns:

organization (VARCHAR(255)): Name of the organization.

function (VARCHAR(255)): Role of the professor in the organization.

firstname (VARCHAR(100)): First name of the professor.

lastname (VARCHAR(100)): Last name of the professor.

Data Insertion and Transformation

Data is imported into these tables from a source table university_professors using INSERT INTO ... SELECT DISTINCT statements. These operations ensure deduplication and proper normalization of data.

Affiliations: Professors and their roles in various organizations are stored in the affiliations table.

Universities: The universities table contains details about universities.

Professors: The professors table lists distinct professors along with their associated universities.

Organizations: The organizations table stores unique organizations and their sectors.

Constraints and Integrity

Primary Key: university_shortname in universities.

Foreign Key:

university_shortname in professors references universities.

Supports ON DELETE CASCADE and ON UPDATE CASCADE.

Key Features

Normalization: Data is stored in a highly normalized format to reduce redundancy.

Relationships: Use of foreign keys ensures data consistency across tables.

Advanced Queries: Demonstrates capabilities like joins, aggregations, and subqueries for complex reporting.

Cascading Updates and Deletions: Ensures database reflects real-world changes seamlessly.

Conclusion

This project illustrates a robust implementation of a relational database system for managing university professors, their affiliations, and related organizations. It highlights the use of SQL for data modeling, querying, and maintaining data integrity, providing a comprehensive framework for real-world database applications.
































