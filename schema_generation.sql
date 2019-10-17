
CREATE TABLE t_f_sales
(
	Order_id             NUMERIC NOT NULL,
	Order_Item_id        NUMERIC NOT NULL,
	Invoice_id           NUMERIC NULL,
	Invoice_Item_id      NUMERIC NULL,
	Product_id           NUMERIC NOT NULL,
	Status_id            NUMERIC NOT NULL,
	Order_desc           VARCHAR(200) NULL,
	Quantity_inv_num     NUMERIC NULL,
	Amount_inv_num       NUMERIC NULL,
	TAX_inv_num          NUMERIC NULL,
	Total_Amount_inv_num NUMERIC NULL,
	Day_id               NUMERIC NOT NULL,
	Order_Date_id        NUMERIC NULL,
	Invoice_Date_id      NUMERIC NULL,
	Quantity_ord_num     NUMERIC NULL,
	Quantity_del_num     NUMERIC NULL,
	Quantity_quot_num    NUMERIC NULL,
	Currency_id          CHAR(18) NOT NULL,
	Creation_Date_id     NUMERIC NULL,
	Customer_id          NUMERIC NOT NULL,
	Employee_id          NUMERIC NOT NULL
);

ALTER TABLE t_f_sales
ADD CONSTRAINT XPKt_f_sales PRIMARY KEY (Order_id,Order_Item_id,Customer_id);

CREATE TABLE t_l_category
(
	Prod_Category_id     NUMERIC NOT NULL,
	Prod_Category_desc   VARCHAR(200) NULL
);

ALTER TABLE t_l_category
ADD CONSTRAINT XPKt_l_category PRIMARY KEY (Prod_Category_id);

CREATE TABLE t_l_currency
(
	Currency_id          CHAR(18) NOT NULL,
	Currency_desc        CHAR(50) NULL
);

ALTER TABLE t_l_currency
ADD CONSTRAINT XPKt_l_currency PRIMARY KEY (Currency_id);

CREATE TABLE t_l_cust_country
(
	Cust_Country_desc    VARCHAR(200) NULL,
	Customer_id          NUMERIC NULL,
	Cust_Currency_id     NUMERIC NULL,
	Cust_Phone_code_id   NUMERIC NULL,
	Cust_Country_id      NUMERIC NOT NULL
);

ALTER TABLE t_l_cust_country
ADD CONSTRAINT XPKt_l_cust_country PRIMARY KEY (Cust_Country_id);

CREATE TABLE t_l_customer
(
	Customer_desc        VARCHAR(200) NULL,
	Cust_Address_desc    VARCHAR(200) NULL,
	Cust_City_desc       VARCHAR(200) NULL,
	Cust_ZIP_Code_id     VARCHAR(200) NULL,
	Cust_email_desc      VARCHAR(200) NULL,
	Customer_long_desc   VARCHAR(200) NULL,
	Cust_Function_desc   CHAR(18) NULL,
	Cust_Country_id      NUMERIC NOT NULL,
	Customer_id          NUMERIC NOT NULL
);

ALTER TABLE t_l_customer
ADD CONSTRAINT XPKt_l_customer PRIMARY KEY (Customer_id);

CREATE TABLE t_l_emp_department
(
	Emp_Department_desc  VARCHAR(200) NULL,
	Emp_Department_id    NUMERIC NOT NULL
);

ALTER TABLE t_l_emp_department
ADD CONSTRAINT XPKt_l_emp_department PRIMARY KEY (Emp_Department_id);

CREATE TABLE t_l_emp_level
(
	Emp_Level_desc       VARCHAR(200) NULL,
	Emp_Level_id         NUMERIC NOT NULL
);

ALTER TABLE t_l_emp_level
ADD CONSTRAINT XPKt_l_emp_level PRIMARY KEY (Emp_Level_id);

CREATE TABLE t_l_employee
(
	Employee_desc        VARCHAR(200) NULL,
	Emp_Address_desc     VARCHAR(200) NULL,
	Emp_City_desc        VARCHAR(200) NULL,
	Emp_ZIP_Code_id      VARCHAR(200) NULL,
	Emp_email_desc       VARCHAR(200) NULL,
	Employee_long_desc   VARCHAR(200) NULL,
	Employee_id          NUMERIC NOT NULL,
	Emp_Department_id    NUMERIC NOT NULL,
	Emp_Level_id         NUMERIC NOT NULL
);

ALTER TABLE t_l_employee
ADD CONSTRAINT XPKt_l_employee PRIMARY KEY (Employee_id);

CREATE TABLE t_l_month
(
	Month_Long_desc      VARCHAR(200) NULL,
	Month_Short_desc     VARCHAR(200) NULL,
	Month_id             NUMERIC NOT NULL
);

ALTER TABLE t_l_month
ADD CONSTRAINT XPKt_l_month PRIMARY KEY (Month_id);

CREATE TABLE t_l_parent_category
(
	Parent_Category_id   NUMERIC NOT NULL,
	Parent_Category_desc VARCHAR(200) NULL
);

ALTER TABLE t_l_parent_category
ADD CONSTRAINT XPKt_l_parent_category PRIMARY KEY (Parent_Category_id);

CREATE TABLE t_l_product
(
	Product_id           NUMERIC NOT NULL,
	Product_desc         VARCHAR(200) NULL,
	Product_Code_id      VARCHAR(200) NULL,
	Product_Long_desc    VARCHAR(200) NULL,
	Prod_Category_id     NUMERIC NOT NULL,
	Product_Type_id      VARCHAR(200) NULL,
	Price_num            NUMERIC NULL,
	Prod_Status_desc     CHAR(18) NULL,
	Parent_Category_id   NUMERIC NOT NULL
);

ALTER TABLE t_l_product
ADD CONSTRAINT XPKt_l_product PRIMARY KEY (Product_id);

CREATE TABLE t_l_quarter
(
	Quarter_desc         CHAR(18) NULL,
	Quarter_id           CHAR(6) NOT NULL
);

ALTER TABLE t_l_quarter
ADD CONSTRAINT XPKt_l_quarter PRIMARY KEY (Quarter_id);

CREATE TABLE t_l_status
(
	Status_id            NUMERIC NOT NULL,
	Status_desc          VARCHAR(200) NULL
);

ALTER TABLE t_l_status
ADD CONSTRAINT XPKt_l_status PRIMARY KEY (Status_id);

CREATE TABLE t_l_year
(
	Year_desc            CHAR(18) NULL,
	Year_id              NUMERIC(4) NOT NULL
);

ALTER TABLE t_l_year
ADD CONSTRAINT XPKt_l_year PRIMARY KEY (Year_id);

CREATE TABLE t_r_time
(
	Day_id               NUMERIC NOT NULL,
	Semester_id          CHAR(6) NULL,
	Day_desc             DATE NULL,
	Month_id             NUMERIC NOT NULL,
	Quarter_id           CHAR(6) NOT NULL,
	Year_id              NUMERIC(4) NOT NULL
);

ALTER TABLE t_r_time
ADD CONSTRAINT XPKt_r_time PRIMARY KEY (Day_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_1 FOREIGN KEY (Customer_id) REFERENCES t_l_customer (Customer_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_7 FOREIGN KEY (Day_id) REFERENCES t_r_time (Day_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_5 FOREIGN KEY (Employee_id) REFERENCES t_l_employee (Employee_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_6 FOREIGN KEY (Status_id) REFERENCES t_l_status (Status_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_3 FOREIGN KEY (Product_id) REFERENCES t_l_product (Product_id);

ALTER TABLE t_f_sales
ADD CONSTRAINT R_21 FOREIGN KEY (Currency_id) REFERENCES t_l_currency (Currency_id);

ALTER TABLE t_l_customer
ADD CONSTRAINT R_2 FOREIGN KEY (Cust_Country_id) REFERENCES t_l_cust_country (Cust_Country_id);

ALTER TABLE t_l_employee
ADD CONSTRAINT R_10 FOREIGN KEY (Emp_Department_id) REFERENCES t_l_emp_department (Emp_Department_id);

ALTER TABLE t_l_employee
ADD CONSTRAINT R_23 FOREIGN KEY (Emp_Level_id) REFERENCES t_l_emp_level (Emp_Level_id);

ALTER TABLE t_l_product
ADD CONSTRAINT R_4 FOREIGN KEY (Prod_Category_id) REFERENCES t_l_category (Prod_Category_id);

ALTER TABLE t_l_product
ADD CONSTRAINT R_22 FOREIGN KEY (Parent_Category_id) REFERENCES t_l_parent_category (Parent_Category_id);

ALTER TABLE t_r_time
ADD CONSTRAINT R_8 FOREIGN KEY (Month_id) REFERENCES t_l_month (Month_id);

ALTER TABLE t_r_time
ADD CONSTRAINT R_9 FOREIGN KEY (Quarter_id) REFERENCES t_l_quarter (Quarter_id);

ALTER TABLE t_r_time
ADD CONSTRAINT R_11 FOREIGN KEY (Year_id) REFERENCES t_l_year (Year_id);
