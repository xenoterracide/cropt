-- I really hate these schema names.
-- I may not like the design later either..
--
-- customer related data (some employees)
   DROP SCHEMA IF EXISTS customer_data CASCADE;
 CREATE SCHEMA customer_data;

-- inventory / services (all employees / some public)
   DROP SCHEMA IF EXISTS inv_svc CASCADE;
 CREATE SCHEMA inv_svc;

-- employee data (management only)
   DROP SCHEMA IF EXISTS employees;
 CREATE SCHEMA employees;

-- something in there