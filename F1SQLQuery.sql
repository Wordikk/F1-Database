select imiê, nazwisko from Kierowcy; --imiê i nazwisko kierwców

select * from Kraje 
where nazwa_kraju  like '%n'
order by id_kraju desc; --kraje które koñcz¹ siê na literê n i posortowane po id_kraju malej¹co

select distinct zwyciêzca as [ilosc_zywciezcow],
zwyciêski_zespó³ 
from Wyœcigi; --unikatowe id kierowców i zespo³ów którzy wygrali jakikolwiek wyœcig

select * from Tory
where lokalizacja like 'A%'; --tory gdzie lokalizacja zaczyna siê na literê A

select COUNT(zwyciêzca) as[ilosc zwyciestw zespo³u],
Zespo³y.nazwa
from Wyœcigi
INNER JOIN Zespo³y ON Wyœcigi.zwyciêski_zespó³ = Zespo³y.id_zespo³u
GROUP BY Zespo³y.nazwa; --ilosc zwyciest zespo³u z po³¹czeniem nazwy z tabeli zespo³y

select nazwa_toru, d³ugoœæ_toru 
from Tory
where okr¹¿enia>='70'; --nazwa toru i jego d³ugoœæ gdzie iloœæ okr¹¿eñ jest wiêksza lub równa od 70

select SUM(okr¹¿enia) as[iloœæ_wszyskitch_okr¹¿eñ_w_sezonie] from Tory; --sumuje iloœæ wszystkich okr¹¿eñ na wszystkich torach

select COUNT(zwyciêzca) as[ilosc_zwyciestw_kierowcy],
Kierowcy.imiê, Kierowcy.nazwisko, Kierowcy.numer_kierowcy
from Wyœcigi
INNER JOIN Kierowcy ON Wyœcigi.zwyciêzca= Kierowcy.numer_kierowcy
GROUP BY Kierowcy.imiê, Kierowcy.nazwisko, Kierowcy.numer_kierowcy; --iloœæ zwyciêstw kierowcy jego imiê, nazwisko i numer z tabeli kierowcy

select MIN(okr¹¿enia) as [najmniejsza_iloœæ_okr¹¿eñ],
MAX(okr¹¿enia) as [najwiêksza_iloœæ_okr¹¿eñ]
from Tory; --najmniejsza i najwiêksza iloœæ okr¹¿eñ

select AVG(d³ugoœæ_toru) as [œrednia_d³ugoœæ_toru] from Tory; --œrednia d³ugoœæ toru

select nazwa,baza from Zespo³y
where id_zespo³u IN(select zwyciêski_zespó³ from Wyœcigi group by zwyciêski_zespó³ having COUNT(*)>5); --nazwa zespo³u i baza który zwyciê¿y³ wiêcej ni¿ 5 razy

select  reprezentowany_kraj as [kraje_na_w] from Kierowcy where reprezentowany_kraj like 'W%'
UNION
select  lokalizacja from Tory where lokalizacja like'W%'; --suma zbiorów kraji z tabel kierowcy i tory

select imie, nazwisko from Dyrektorzy
inner join Zespo³y on Dyrektorzy.id_dyrektora = Zespo³y.id_dyrektora
where exists(select zwyciêski_zespó³ from Wyœcigi group by zwyciêski_zespó³ having count(*)>5);

