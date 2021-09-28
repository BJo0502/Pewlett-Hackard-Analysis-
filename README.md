# Module 7: Employee Database with SQL

## Overview

As a new employee with Pewett Hackard, we are tasked to help our coworker Bobby and his manager design and build a new employee database. Pewett Hackard is preparing for a large wave of employees eligible for retirement and must begin to assess the impact this will have on the company. Specifically, we have been asked to gather data on the number of employees eligible, their titles, and employees who are eligible for a mentorship program. Gathering this information will help the company identify which positioned will need to be filled and what types of retirement packages the company can offer in the future.

## Tools/languages used
SQL, pgAdmin4, VS Code, Jupyter Notebooks, Matplotlib, Pandas

## Results
After conducting SQL queries we are able to create additional data tables that we can further explore to gain insights regarding the impacts of future retirements. For the purpose of this data analysis, we can use pandas and matplotlib to further explore our results:

1.) There are 1549 employees who are eligible to participate in a mentorship program.

2.) The most common year employees now eligible for retirement, began their career with Pewett Hackard is 1998

3.) Of the employees eligible for retirement, the minimum start year with the company is 1985 and the maximum start year is 2002.

4.) The employee titles that will experience the most significant impact after a wave retirement will likely by Senior Engineer and Senior Staff work roles.
*Note that the range of employee counts per title are very wide spread. Since there are only 2 Managers, the bar does not display.*
![retiring titles bar chart](https://user-images.githubusercontent.com/88041368/134998085-c973cd49-19d3-4999-a8c1-9054a13ab1bf.png)
    
    Code 1:
    print(f'There are {len(mentor_df)} employees who are eligible to participate in a mentorship program.')
      
    Code 2:
    unique_titles_df = pd.read_csv("unique_titles_BJones.csv")
    import datetime
    from statistics import mode
    unique_titles_df['year'] = pd.DatetimeIndex(unique_titles_df['from_date']).year
    yr_started_mode = unique_titles_df['year'].mode()
    print("The most common year employees now eligible for retirement, began their career with Pewett Hackard is % s" % (mode(unique_titles_df['year'])))
    
    Code 3:
    min_yr= unique_titles_df['year'].min()
    max_yr=unique_titles_df['year'].max()
    print(f"Of the employees eligible for retirement, the minimum start year is {min_yr} and the maximum start year is {max_yr}.")
    
    Code 4:
    x_axis = titles_df["title"]
    y_axis = titles_df["count"]

    plt.figure(figsize=(10,6))
    plt.barh(x_axis,y_axis, color='green')
    plt.xlabel("Employee Titles",size=10)
    plt.ylabel("Count Eligible to Retire",size=10)
    plt.title("Employees Eligible to Retire from Pewlett Hackard",size=15)
    plt.show()
    
## Summary

### How many roles will need to be filled as the "silver tsunami" begins to make an impact? 

Assuming Pewlett Hackard wants to maintain the current size of the company and if all eligible employees retire, they will need to hire 90,398 new employees.

### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 
To dig into this question we can write additional SQL queries to examine information about employees that are not eligible for retirement. We can compare the eligible employees to those that are not yet eligible using the following SQL query:

    SELECT DISTINCT ON (employees.emp_no)
    employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
    INTO not_eligible
    FROM employees
    LEFT JOIN titles
    ON employees.emp_no = titles.emp_no
    WHERE (birth_date NOT BETWEEN '1952-01-01' AND '1955-12-31')
    ORDER BY employees.emp_no, titles.to_date DESC;
    SELECT * FROM not_eligible;

After creating this query we can use  matplotlib and create a stacked barchart to compare our results:
![Employees Eligible to Retire vs Not Eligible](https://user-images.githubusercontent.com/88041368/134998083-17c0a338-1064-421f-a441-bd307c0807ac.png)
  
We can create an additional query to explore further how mentors by title compares to the amount of employees that remain not eligible. When we display both of these data frames we can see clearly that there simply are not going to be enough mentors per title. Of particular concern is that there will be no manager mentors available.
    
    SELECT COUNT(*), not_eligible.title 
    INTO not_eligible_retiring_titles
    FROM not_eligible
    GROUP BY not_eligible.title
    ORDER BY COUNT(*) DESC;
    SELECT * FROM not_eligible_retiring_titles;
    
![mentors to not eligible employees](https://user-images.githubusercontent.com/88041368/134998084-519631d3-7970-4fa2-97c1-771d74d36a81.png)
