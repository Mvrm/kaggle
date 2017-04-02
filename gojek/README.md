# techtask



Welcome to the Gojek tech task!

The goal of this task is to test your familiarity with data analysis, from the plumbing through to visualisation and interpretation. You can solve the problems using any methods you like, as long as they fit the instructions. Please submit one pdf writeup of how you went about the task. Also include the `head` (only) of your output files, and all your code.


In here, you'll find:

- clicks.csv
	One row per click.
	columns: 
		ds: date of click
		provider: an online travel agency
		cpc: their bid in cents for the said click

- conversions.csv
	One row per conversion (a customer who clicked then paid for a hotel)
	columns:
		ds, provider (as above)
		gbv: gross booking value, the value a customer paid for a booking

The data relates to a single property over a period of time, where providers are bidding a seperate cpc per click. The delimiter might be funny, and there may be an ugly entry or two.

Your task is as follows:

- Create a postgres database and insert clicks.csv and conversions.csv each into their own table
- Write SQL to get the average cpc and total clicks per day per provider, and save this to a csv output file.
- Do the same for total gbv and number of conversions per day per provider
- Plot a bid movement chart i.e. each provider's average cpc for the property by day. Can you guess how the data was generated?
- Analyse each provider's profitability. Were they converting enough to justify their CPCs (Cost = CPC * Click volume)?
- Automate the entire process using BASH, create a main.sh shell script preferably with args like start date and end date 
e.g. /bin/bash main.sh 2015-10-01 2015-10-02. That will call the various programs (python, R, etc..) and generate the charts.

You'll probably end up using bash, python and R, although we're flexible. Try to present your findings as a story, both in how you dealt with the plumbing as well as interpreted the data.

Hope you have fun!