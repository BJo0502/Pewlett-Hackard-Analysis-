# Module 7: Employee Database with SQL

## Overview

As a new employee with Pewett Hackard, we are tasked to help our coworker Bobby and his manager design and build a new employee database. Pewett Hackard is preparing for a large wave of employees eligible for retirement and must begin to assess the impact this will have on the company. Specifically, we have been asked to gather data on the number of employees eligible, their titles, and employees who are eligible for a mentorship program. Gathering this information will help the company identify which positioned will need to be filled and what types of retirement packages the company can offer in the future.

## Tools/languages used
SQL, pgAdmin4, VS Code, Jupyter Notebooks, Matplotlib, Pandas

## Results
After conducting the SQL queries we are able to gain the following information about the employees eligible for retirement:

1.) There are 1549 employees who are eligible to participate in a mentorship program.

2.) The most common year employees now eligible for retirement, began their career with Pewett Hackard is 1998

3.)

4.)

    Code 1:
    print(f'There are {len(mentor_df)} employees who are eligible to participate in a mentorship program.')
      
    Code 2:
    unique_titles_df = pd.read_csv("unique_titles_BJones.csv")
    import datetime
    from statistics import mode
    unique_titles_df['year'] = pd.DatetimeIndex(unique_titles_df['from_date']).year
    yr_started_mode = unique_titles_df['year'].mode()
    print("The most common year employees now eligible for retirement, began their career with Pewett Hackard is % s" % (mode(unique_titles_df['year'])))
  
