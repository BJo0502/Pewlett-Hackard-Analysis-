# Module 7: Employee Database with SQL

## Overview

As a new employee with Pewett Hackard, we are tasked to help our coworker Bobby and his manager design and build a new employee database. Pewett Hackard is preparing for a large wave of employees eligible for retirement and must begin to assess the impact this will have on the company. Specifically, we have been asked to gather data on the number of employees eligible, their titles, and employees who are eligible for a mentorship program. Gathering this information will help the company identify which positioned will need to be filled and what types of retirement packages the company can offer in the future.

## Tools/languages used
SQL, pgAdmin4, VS Code, Jupyter Notebooks, Matplotlib, Pandas

## Results
After conducting the SQL queries we are able to gain the following information about the employees eligible for retirement:

1.) There are 1549 employees who are eligible to participate in a mentorship program.

2.) The most common year employees now eligible for retirement, began their career with Pewett Hackard is 1998

3.) Of the employees eligible for retirement, the minimum start year with the company is 1985 and the maximum start year is 2002.

4.) The employee titles that will experience the most significant impact after a wave retirement will likely by Senior Engineer and Senior Staff work roles.

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
  
