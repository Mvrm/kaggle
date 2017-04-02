use gojek;

-- create and load data in clicks and conversions table in mysql

drop table if exists gojek.clicks;

create table if not exists gojek.clicks 
( 
ds date,
provider char (50),
cpc int
) engine=InnoDB;

LOAD DATA LOCAL INFILE "/home/manish/Desktop/gojek/clicks.csv" INTO TABLE gojek.clicks  COLUMNS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES;

drop table if exists gojek.conversions;

create table if not exists gojek.conversions 
( 
ds date,
provider char (50),
gbv int
) engine=InnoDB;

LOAD DATA LOCAL INFILE "/home/manish/Desktop/gojek/conversions.csv" INTO TABLE gojek.conversions  COLUMNS TERMINATED BY '\t' LINES TERMINATED BY '\n' IGNORE 1 LINES;

-- calculate average CPC, average gbv, cost and calculate the profit (gbv cost - cpc cost) for each provider  

drop table if exists clicks_conversions;
create table if not exists clicks_conversions as
select
a.ds,
a.provider,
a.cpc_avg,
a.cpc_cost,
a.cpc_volume,
b.gbv_avg,
b.gbv_cost,
b.gbv_volume,
b.gbv_cost-a.cpc_cost as profit
from (select ds, provider, avg(cpc) as cpc_avg, sum(cpc) as cpc_cost, count(*) as cpc_volume from gojek.clicks  group by ds, provider) a join
(select ds, provider, avg(gbv) as gbv_avg,sum(gbv) as gbv_cost,count(*) as gbv_volume from gojek.conversions group by ds, provider) b on
a.ds=b.ds and a.provider = b.provider;

-- parameterized the starting and ending date 

Select * from clicks_conversions where ds >=@start_date and ds <= @end_date;