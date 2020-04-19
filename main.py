import cx_Oracle

username = 'Marina'
password = 'xu40e5'

database = 'localhost/xe'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

query1 = """
select bartenderbar.bar_name,
count(bartenderbar.bartender_name) as total_bartenders from bartenderbar
group by bartenderbar.bar_name
order by total_bartenders desc
"""
cursor.execute(query1)
print("Bar_name - Quantity_of_bartenders")
for row in cursor:

    print(row)

query2 = """
select bartenderbar.bar_name,
concat(round(count(bartenderbar.bartender_name)*100/(
select count(*) from bartenderbar)),'%') as procent_of_total_bartenders from bartenderbar
group by bartenderbar.bar_name
"""
cursor.execute(query2)
print("\n Bar_name - %_quantity_of_bartenders")
for row in cursor:

    print(row)

query3 = """
select count(cocktailbartender.cocktail_name) as quantity_of_cocktails,
bar.location
from cocktailbartender
    left join bartenderbar on bartenderbar.bartender_name=cocktailbartender.bartender_name             
left join bar on bar.bar_name=bartenderbar.bar_name
group by bar.location
order by quantity_of_cocktails desc
"""
cursor.execute(query3)
print("\nQuantity_of_cocktails - Bar_location")
for row in cursor:

    print(row)
