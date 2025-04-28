# Report Rubric

The intended audience for the report is new DS 4010 students. 
Approximately 75% of the report should be devoted to behind the scenes data 
pipeline content while the remaining 25% should be devoted to the application. 
Throughout the report include visualizations and tables that will help the 
reader understand the process you used. 

Please mention anything that was unique to your group where relevant in the 
report. For example, the size of you data set. 
Also describe investigated approaches that were ultimately not used. 


## Format

With the targt audience being new DS 4010 students, what would be an appropriate
format?

- md/html?
- Word/pdf?

Ultimately this should live in your repository

## Length

The writing should be 3-5 pages, 
but including pictures and tables may make the report longer. 


### Data Pipeline



#### Data collection (ETL)

Describe how the data were collected, cleaned, and transformed into a suitable
format for use in the project.

Address the following questions:

- What data sources were used?
  - If relevant, provide references/urls for the sources.
  - How were the data obtain?
    - Downloaded as Excel/csv? Used an API? If API, what software?
    - Describe the process
- How were the data cleaned? 
  - Were the data filtered to a subset?
  - Was there missing data? If yes, how was this dealt with?
- If multiple data sources were used, how were the data joined?
  - What decisions were made in this combining?
- How were the data stored for use in the dashboard?
  - How was efficiency (hard drive, load time, etc) considered in storage?
  
#### Modeling

Describe the modeling used in the project include modeling attempts that were
not (ultimately) included in the dashboard. 

- How does the modeling effort support the project goal?
  - What is the purpose of the model? prediction? understanding?
- What models were used?
  - Response (dependent) variable(s)
  - Explanatory (independent variable(s))
  - What is the name of the model?
  - Describe the model used. (it is not enough to simply name the model)
    - Perhaps include the mathematics or algorithm behind the model.
- What software is used to implement the model? 
  - What packages were used? 
  - Provide realistic, but simplified code.
- Are models created in real-time or pre-estimated?
  - If real-time, what can a user specify?
  - If pre-estimated, how are model results stored?

#### Dashboard

Describe how the dashboard was constructed.

- What is the layout of the dashboard (tabs/pages)?
  - How does this layout support the project goals?
  - Describe the logic behind the layout.
- What user inputs were allowed?
  - How do these inputs support the project goals?
  - What type of inputs (numeric, date, categorical)?
  - What type of input selectors (ranges, select one, select multiple)?
- What outputs (figures, tables, text) are shown to the user?
  - How do these outputs support the project goals?
  - What content changes as the user inputs are changed?
- What technology was used to construct the dashboard?
  - Assess (subjectively) this technology in terms of ease of use, features, and speed.



### Application

Application, in this context, refers to the scientific question of interest and
the intended audience.

#### Goal

Early in the report, likely before any data is discussed, describe the goal
for the project.

- What is the goal for the project?
  - What are you trying to achieve with the project?
- Who is the intended audience?
  - Who would be interested in your project?
  
#### Learning

- What did you learn about your application? 
  - What choices did you make? 
- How well does the modeling support your project goals?


### Discussion

Provide a summary of the overall project and backend pipeline.

#### Next steps

- What would you have done if you had more time? 
  - Would you have...
    - obtained more/better data?
    - built more sophisticated models?
    - improved the user experience?
  - How would you have made these changes?
- Remind reader of unique aspects for your group
  - PowerBi
  - Large data
  - Client
  
#### Availability


- Where can the code for the project be found? 
  - What is the plan to maintain the code?
- Where can the dashboard be found?
  - What is the plan to maintain the dashboard?
