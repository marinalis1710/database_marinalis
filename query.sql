--Кол-во барменов в каждом баре

select humanbar.bar_name,
count(humanbar.human_name) as total_humans from humanbar
group by humanbar.bar_name
order by total_humans desc;

--Соотношение барменов в каждом баре к общему их кол-ву
select humanbar.bar_name,
concat(round(count(humanbar.human_name)*100/(
select count(*) from humanbar)),'%') as procent_of_total_bartenders from humanbar
group by humanbar.bar_name
order by procent_of_total_bartenders desc;

--зависимость кол-ва коктейлей от расположения бара

select count(humancocktail.cocktail_name) as quantity_of_cocktails,
bar.city_name
from humancocktail          
--join bartender_name             
left join humanbar on humanbar.human_name=humancocktail.human_name
--join bar_name         
left join bar on bar.bar_name=humanbar.bar_name
group by bar.city_name
order by quantity_of_cocktails desc;
