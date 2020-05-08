import cx_Oracle

username = 'Marina'
password = 'xu40e5'

database = 'localhost/xe'

connection = cx_Oracle.connect(username, password, database)
cursor = connection.cursor()

query1 = """
select humanbar.bar_name,
count(humanbar.human_name) as total_bartenders from humanbar
group by humanbar.bar_name
order by total_bartenders desc
"""
cursor.execute(query1)
print("Bar_name - Quantity_of_bartenders")
for row in cursor:

    print(row)

query2 = """
select humanbar.bar_name,
concat(round(count(humanbar.human_name)*100/(
select count(*) from humanbar)),'%') as procent_of_total_bartenders from humanbar
group by humanbar.human_name
"""
cursor.execute(query2)
print("\n Bar_name - %_quantity_of_bartenders")
for row in cursor:

    print(row)

query3 = """
select count(humancocktail.cocktail_name) as quantity_of_cocktails,
bar.city_name
from humancocktail
    left join humanbar on humanbar.human_name=humancocktail.human_name             
left join bar on bar.bar_name=humanbar.bar_name
group by bar.city_name
order by quantity_of_cocktails desc
"""
cursor.execute(query3)
print("\nQuantity_of_cocktails - Bar_location")
for row in cursor:

    print(row)
