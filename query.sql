--Кол-во барменов в каждом баре

select bartenderbar.bar_name,
count(bartenderbar.bartender_name) as total_bartenders from bartenderbar
group by bartenderbar.bar_name
order by total_bartenders desc

--Процент барменов в каждом баре
select bartenderbar.bar_name,
concat(round(count(bartenderbar.bartender_name)*100/(
select count(*) from bartenderbar)),'%') as procent_of_total_bartenders from bartenderbar
group by bartenderbar.bar_name

--Зависимость кол-ва коктейлей от локации
