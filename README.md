# Cars Database Creation and Analysis 🚗📊

[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://www.mysql.com/)
[![SQL](https://img.shields.io/badge/SQL-Advanced-green.svg)](https://github.com/ChowdharyYash)
[![Database](https://img.shields.io/badge/Database-406%20Records-orange.svg)](https://github.com/ChowdharyYash)
[![Analysis](https://img.shields.io/badge/Analysis-3%20Business%20Questions-purple.svg)](https://github.com/ChowdharyYash)
[![Status](https://img.shields.io/badge/Status-Complete-success.svg)](https://github.com/ChowdharyYash)

## Overview

This project demonstrates comprehensive database design and SQL analysis skills through the creation and analysis of an automotive database containing 406 car models. The analysis focuses on identifying fuel efficiency trends across different manufacturers, time periods, and engine configurations to provide actionable business insights for the automotive industry.

**Key Achievements:**
- Designed and implemented a normalized database schema from scratch
- Performed complex SQL queries using aggregate functions, grouping, and filtering
- Uncovered significant fuel efficiency patterns across origins and time periods
- Created comprehensive documentation with visual query results

## 📋 Table of Contents

- [Project Structure](#-project-structure)
- [Technologies Used](#-technologies-used)
- [Database Schema](#-database-schema)
- [Business Questions Addressed](#-business-questions-addressed)
- [Key Findings](#-key-findings)
- [Installation Guide](#-installation-guide)
- [SQL Query Examples](#-sql-query-examples)
- [Screenshots](#-screenshots)
- [Skills Demonstrated](#-skills-demonstrated)
- [Future Enhancements](#-future-enhancements)

## 📁 Project Structure

```
Cars-Database-Analysis/
│
├── SQL code Cars Database Creation and Analysis Yash Chowdhary.sql   # Complete SQL script
├── Cars Database Creation and Analysis.pdf                           # Comprehensive report with screenshots
├── cars.csv                                                         # Dataset (if included)
└── README.md                                                        # Project documentation
```

## 🛠️ Technologies Used

- **Database Management System**: MySQL 8.0
- **Development Environment**: MySQL Workbench 8.0.41
- **Query Language**: SQL (DDL, DML, DQL)
- **Data Import**: Table Data Import Wizard
- **Documentation**: Microsoft Word for reporting

## 📊 Database Schema

```sql
CREATE TABLE cars (
    car_name VARCHAR(100),         -- Vehicle make and model
    mpg DECIMAL(5,1),              -- Fuel efficiency (miles per gallon)
    cylinders INT,                 -- Number of engine cylinders
    displacement DECIMAL(6,1),     -- Engine size (cubic inches)
    horsepower INT,                -- Engine power (HP)
    weight INT,                    -- Vehicle weight (pounds)
    acceleration DECIMAL(4,1),     -- 0-60 mph time (seconds)
    model_year INT,                -- Year of manufacture
    origin VARCHAR(20)             -- Manufacturing region
);
```

### Design Decisions:
- **VARCHAR** for variable-length strings (car names, origins)
- **DECIMAL** for precise numeric values requiring decimal places
- **INT** for whole numbers (cylinders, horsepower, weight, year)
- No primary key in initial design (identified as future enhancement)

## 🎯 Business Questions Addressed

### 1. Fuel Efficiency Leaders
**Question**: Which cars have the best fuel efficiency (MPG)?
- Identified top 10 most fuel-efficient vehicles
- Results showed MPG ranging from 41.5 to 46.6
- Majority were 4-cylinder vehicles from late 1970s/early 1980s
- Japanese manufacturers dominated the top rankings

### 2. Efficiency Evolution by Region
**Question**: How has average fuel efficiency changed over time for each country of origin?
- Tracked MPG trends across American, European, and Asian manufacturers
- Discovered significant improvement spike during mid-1970s (oil crisis response)
- Japanese cars consistently outperformed American and European counterparts
- Clear upward trend in efficiency across all regions over time

### 3. Cylinder Configuration Impact
**Question**: Which car origin produces the most fuel-efficient vehicles for different cylinder counts?
- Analyzed efficiency by engine size and manufacturing region
- Japanese 4-cylinder engines: 31.8 MPG average (highest)
- European 4-cylinder engines: 27.8 MPG average
- American 8-cylinder engines: Lower efficiency but higher representation
- Statistical significance ensured by filtering groups with 5+ vehicles

## 🔍 Key Findings

1. **Regional Leadership**: Japanese manufacturers consistently lead in fuel efficiency across all engine configurations

2. **Historical Context**: Major efficiency improvements in mid-1970s correlate with global oil crisis, demonstrating industry's ability to adapt to market pressures

3. **Engine Configuration**: 4-cylinder engines offer optimal fuel efficiency, with diminishing returns as cylinder count increases

4. **Time Trends**: All regions show continuous improvement in fuel efficiency over the analyzed period

## 🚀 Installation Guide

### Prerequisites
- Windows operating system (guide provided for Windows)
- Administrator privileges for installation
- At least 1GB free disk space

### MySQL Installation Steps
1. Download MySQL Installer from [official website](https://dev.mysql.com/downloads/installer/)
2. Select "Developer Default" installation type
3. Configure MySQL Server with secure root password
4. Install MySQL Workbench alongside server
5. Verify installation by connecting to local instance

### Database Setup
```sql
-- 1. Create the database
CREATE DATABASE IF NOT EXISTS cars_database;
USE cars_database;

-- 2. Create the table (see schema above)

-- 3. Import data using MySQL Workbench
-- Navigate to: Table Data Import Wizard
-- Select cars.csv file
-- Map columns appropriately
-- Execute import
```

## 💻 SQL Query Examples

### Query 1: Top Fuel-Efficient Cars
```sql
SELECT 
    car_name,
    mpg,
    cylinders,
    model_year,
    origin
FROM 
    cars
WHERE 
    mpg IS NOT NULL
ORDER BY 
    mpg DESC
LIMIT 10;
```

### Query 2: Efficiency Trends Analysis
```sql
SELECT 
    model_year,
    origin,
    AVG(mpg) AS average_mpg
FROM 
    cars
WHERE 
    mpg IS NOT NULL
GROUP BY 
    model_year, origin
ORDER BY 
    model_year, origin;
```

### Query 3: Origin-Cylinder Efficiency Analysis
```sql
SELECT 
    origin,
    cylinders,
    COUNT(*) AS car_count,
    MIN(mpg) AS min_mpg,
    MAX(mpg) AS max_mpg,
    AVG(mpg) AS avg_mpg
FROM 
    cars
WHERE 
    mpg BETWEEN 10 AND 50
GROUP BY 
    origin, cylinders
HAVING 
    COUNT(*) >= 5
ORDER BY 
    cylinders, avg_mpg DESC;
```

## 📸 Screenshots

The project includes comprehensive visual documentation:
- MySQL installation process walkthrough
- Database and table creation execution
- Query results with formatted output
- MySQL Workbench interface demonstrations

*Note: Full screenshots available in the PDF report*

## 🎓 Skills Demonstrated

### Technical Skills
- **Database Design**: Schema creation with appropriate data types
- **SQL Proficiency**: Complex queries using JOINs, GROUP BY, HAVING, aggregate functions
- **Data Analysis**: Statistical analysis and trend identification
- **Data Import/Export**: ETL process from CSV to database
- **Performance Optimization**: Efficient query design and indexing considerations

### Analytical Skills
- **Business Intelligence**: Translating data into actionable insights
- **Trend Analysis**: Identifying patterns across time and categories
- **Statistical Relevance**: Ensuring meaningful sample sizes for analysis
- **Problem Solving**: Addressing real-world business questions with SQL

### Soft Skills
- **Documentation**: Comprehensive technical and business documentation
- **Communication**: Clear presentation of complex findings
- **Project Management**: End-to-end project execution

## 🔮 Future Enhancements

1. **Database Normalization**
   - Create separate tables for manufacturers, models, and origins
   - Implement primary and foreign keys for referential integrity
   - Add indexes for performance optimization

2. **Extended Analysis**
   - Include pricing data for cost-efficiency analysis
   - Add emissions data for environmental impact assessment
   - Incorporate safety ratings for comprehensive vehicle evaluation

3. **Visualization Integration**
   - Connect to Tableau/Power BI for interactive dashboards
   - Create stored procedures for automated reporting
   - Implement views for commonly accessed data combinations

4. **Modern Data Integration**
   - Update dataset with contemporary vehicles (2020s)
   - Include electric and hybrid vehicle comparisons
   - Add real-time fuel price integration for cost analysis

## 🏆 Project Highlights

This project showcases:
- **Strong SQL fundamentals** with practical business applications
- **Database lifecycle management** from creation to analysis
- **Business acumen** in identifying relevant questions and insights
- **Technical documentation** skills essential for team collaboration
- **Problem-solving ability** using data-driven approaches

## 👤 Author

**Yash Chowdhary**
- GitHub: [@ChowdharyYash](https://github.com/ChowdharyYash)
- LinkedIn: [Connect with me](https://www.linkedin.com/in/yash2011/)
- Email: [yashchowdhary0002@gmail.com](yashchowdhary0002@gmail.com)<!-- TODO: Add your email -->

## 📚 References

- MySQL Documentation: [https://dev.mysql.com/doc/](https://dev.mysql.com/doc/)
- W3Schools SQL Tutorial: [https://www.w3schools.com/sql/](https://www.w3schools.com/sql/)
  
## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

*This project demonstrates fundamental database management and SQL analysis skills essential for data analyst and database developer roles. 
The combination of technical implementation and business insight generation showcases readiness for professional data-focused positions.*
