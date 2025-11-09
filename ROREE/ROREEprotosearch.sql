/* 
Basic blueprint for search function; the item, survivor, and skill variables
will be replaced with the user's search input.
*/

DECLARE @item char(32);
DECLARE @survivor char(32);
DECLARE @skill char(32);

SET @item = 'Gas';
SET @survivor = 'commando';
SET @skill = 'double tap';

select *
from ROREE.dbo.itemlist
where itemName like @item or rainglishName like @item

select *
from ROREE.dbo.survivorlist
where survivorName like @survivor

select * 
from ROREE.dbo.survivorskills
where skillName like @skill