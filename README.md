# The Billionaire Wealth Investigation

An SQL analysis of the world's 200 richest people, using the Forbes list. The project answers ten business questions about wealth, age, country and industry, plus one follow-up question.

## Business scenario

A global financial research organisation wants to understand how wealth is distributed among the 200 richest people in the world. As the junior data analyst, I cleaned the dataset in SQL, answered the business questions, and presented the results in an Excel workbook with a dashboard.

## Dataset

**Top 200 Richest Person in the World** (Forbes list), 200 rows.

| Column | Description |
|---|---|
| S. No. | Row number |
| Rank | Global rank by net worth |
| Name | Name of the billionaire |
| Age | Age in years |
| Country | Country of the billionaire |
| Networth | Net worth in billions of dollars (stored as text, for example `$233 B`) |
| Industry | Main industry behind the wealth |

## Tools

- SQLite (SQLite Online) for cleaning and querying
- Microsoft Excel for the tables and dashboard

## Data cleaning

Two problems had to be fixed before the analysis:

1. **Net worth was stored as text** (`$233 B`). Text sorts alphabetically, so `99.5` ranked above `233`. I removed the `$` and ` B` and converted the column to a number.
2. **Country names had stray spaces.** `China ` and ` Brazil` were counted as separate countries. `TRIM()` fixed this, giving China 17 billionaires and Brazil 4.

After cleaning, the table has 200 rows and the country totals add up to 200 billionaires with an average net worth of $31.84B, which matches Q3.

## Questions and answers

| # | Question | Answer |
|---|---|---|
| 1 | The 20 richest billionaires | Bernard Arnault ($233B), Elon Musk ($195B) and Jeff Bezos ($194B) lead the list. Jensen Huang is 20th with $77B. |
| 2 | The five youngest | Mark Mateschitz (31), Lukas Walton (37), Mark Zuckerberg, Dustin Moskovitz and Pavel Durov (all 39) |
| 3 | Average age and net worth | Average age 69.38, average net worth $31.84B |
| 4 | Five most represented countries | United States 79, China 17, India 13, Russia 11, Germany 11 |
| 5 | Combined net worth by country | United States $3,130.9B, France $478.8B, India $434.5B, China $387.4B, Germany $248.2B (35 countries in total) |
| 6 | Five industries with the most billionaires | Technology 40, Finance & Investments 32, Fashion & Retail 30, Food & Beverage 15, Diversified 15 |
| 7 | Countries with at least five billionaires | United States, China, India, Russia, Germany, Hong Kong, France, Australia |
| 8 | Wealth of billionaires under 50 | 16 billionaires, $508.3B combined |
| 9 | Billionaires above the average net worth | 53 billionaires are above $31.84B |
| 10 | Industry with the highest average net worth | Telecom, $102B (only one billionaire) |
| 11 | Same as Q10, at least five billionaires per industry | Technology, $43.47B average across 40 billionaires |

Q11 is an added question. Telecom wins Q10 because it contains a single person, so Q11 gives a fairer comparison.

## Key findings

- The 200 richest people hold about $6.4 trillion combined.
- The United States has 40% of the billionaires and about 49% of the combined net worth.
- Technology is the largest industry and also has the highest average net worth among industries with at least five billionaires.
- The 16 billionaires under 50 hold 8% of the total wealth, in line with their 8% share of the list.
- The average billionaire is 69 years old.
- Q4 and Q6 each have a tie for fifth place (Russia and Germany at 11, Food & Beverage and Diversified at 15).

## Repository structure

```
Billionaire-Wealth-Investigation/
├── Screenshots/        Result screenshot for each query
├── SQL code/           billionaire_wealth_queries.sql
├── SQL visual/         Billionaire_Wealth_Investigation.xlsx (dashboard and result tables)
├── Top_200_Richest_Person_in_the_World.csv
└── README.md
```

## How to reproduce

1. Open SQLite Online and import `Top_200_Richest_Person_in_the_World.csv`.
2. Run `billionaire_wealth_queries.sql` one block at a time, starting with the data cleaning step.
3. Compare each result with the Excel workbook.
