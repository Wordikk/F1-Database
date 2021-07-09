select imi�, nazwisko from Kierowcy; --imi� i nazwisko kierwc�w

select * from Kraje 
where nazwa_kraju  like '%n'
order by id_kraju desc; --kraje kt�re ko�cz� si� na liter� n i posortowane po id_kraju malej�co

select distinct zwyci�zca as [ilosc_zywciezcow],
zwyci�ski_zesp� 
from Wy�cigi; --unikatowe id kierowc�w i zespo��w kt�rzy wygrali jakikolwiek wy�cig

select * from Tory
where lokalizacja like 'A%'; --tory gdzie lokalizacja zaczyna si� na liter� A

select COUNT(zwyci�zca) as[ilosc zwyciestw zespo�u],
Zespo�y.nazwa
from Wy�cigi
INNER JOIN Zespo�y ON Wy�cigi.zwyci�ski_zesp� = Zespo�y.id_zespo�u
GROUP BY Zespo�y.nazwa; --ilosc zwyciest zespo�u z po��czeniem nazwy z tabeli zespo�y

select nazwa_toru, d�ugo��_toru 
from Tory
where okr��enia>='70'; --nazwa toru i jego d�ugo�� gdzie ilo�� okr��e� jest wi�ksza lub r�wna od 70

select SUM(okr��enia) as[ilo��_wszyskitch_okr��e�_w_sezonie] from Tory; --sumuje ilo�� wszystkich okr��e� na wszystkich torach

select COUNT(zwyci�zca) as[ilosc_zwyciestw_kierowcy],
Kierowcy.imi�, Kierowcy.nazwisko, Kierowcy.numer_kierowcy
from Wy�cigi
INNER JOIN Kierowcy ON Wy�cigi.zwyci�zca= Kierowcy.numer_kierowcy
GROUP BY Kierowcy.imi�, Kierowcy.nazwisko, Kierowcy.numer_kierowcy; --ilo�� zwyci�stw kierowcy jego imi�, nazwisko i numer z tabeli kierowcy

select MIN(okr��enia) as [najmniejsza_ilo��_okr��e�],
MAX(okr��enia) as [najwi�ksza_ilo��_okr��e�]
from Tory; --najmniejsza i najwi�ksza ilo�� okr��e�

select AVG(d�ugo��_toru) as [�rednia_d�ugo��_toru] from Tory; --�rednia d�ugo�� toru

select nazwa,baza from Zespo�y
where id_zespo�u IN(select zwyci�ski_zesp� from Wy�cigi group by zwyci�ski_zesp� having COUNT(*)>5); --nazwa zespo�u i baza kt�ry zwyci�y� wi�cej ni� 5 razy

select  reprezentowany_kraj as [kraje_na_w] from Kierowcy where reprezentowany_kraj like 'W%'
UNION
select  lokalizacja from Tory where lokalizacja like'W%'; --suma zbior�w kraji z tabel kierowcy i tory

select imie, nazwisko from Dyrektorzy
inner join Zespo�y on Dyrektorzy.id_dyrektora = Zespo�y.id_dyrektora
where exists(select zwyci�ski_zesp� from Wy�cigi group by zwyci�ski_zesp� having count(*)>5);

