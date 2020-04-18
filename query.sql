--Кол-во барменов в каждом баре

select bartenderbar.bar_name,
count(bartenderbar.bartender_name) as total_bartenders from bartenderbar
group by bartenderbar.bar_name
order by total_bartenders desc

--Соотношение барменов в каждом баре к общему их кол-ву

select bartenderbar.bar_name,
concat(round(count(bartenderbar.bartender_name)*100/(
select count(*) from bartenderbar)),'%') as procent_of_total_bartenders from bartenderbar
group by bartenderbar.bar_name

--зависимость кол-ва коктейлей от расположения бара
             
select count(cocktailbartender.cocktail_name) as quantity_of_cocktails,
bar.location
from cocktailbartender
             
--join bartender_name
             
left join bartenderbar on bartenderbar.bartender_name=cocktailbartender.bartender_name

--join bar_name
             
left join bar on bar.bar_name=bartenderbar.bar_name
group by bar.location
order by quantity_of_cocktails desc
