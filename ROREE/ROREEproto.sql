CREATE TABLE itemlist (
itemID INT PRIMARY KEY,
itemName CHAR(32),
rainglishName CHAR(32),
itemRarity INT,
itemType INT,
itemScaleType INT,
itemGameDesc TEXT,
itemRealDesc TEXT
);
GO

/*
explanation of the types follows

rainglishName: the commonly used name by RoR2 players for an item. usually created through
putting the letters of the first word or words onto the last word (ex: Sentient Meat Hook -> Smook)

itemRarity: 
	0 = no tier/gray
	1 = common
	2 = uncommon
	3 = legendary
	4 = lunar
	5 = void
	6 = equipment

itemType:
	0 = unusable (gray)
	1 = damage
	2 = healing
	3 = utility
	4 = scrap
	5 = equipment

itemScaleType:
	0 = no scaling
	1 = linear scaling
	2 = exponential scaling
	3 = hyperbolic scaling
	4 = unique scaling

itemGameDesc: the in-game description for items when you pick them up. don't know if we'll use this, if not we can remove it

itemRealDesc: a short, detailed description of what the item actually does.
*/

/* Use this to move gasoline to its normal space */

CREATE TABLE survivorlist (
survivorID INT PRIMARY KEY,
survivorName char(32),
survivorHealth INT,
survivorHealthLV INT,
survivorHealthRegen INT,
survivorHealthRegenLV DECIMAL,
survivorDMG INT,
survivorDMGLV DECIMAL,
survivorArmor INT,
survivorSpeed INT,
survivorDesc TEXT
);
GO

CREATE TABLE survivorskillslist (
survivorID INT,
skillID INT
);
GO

CREATE TABLE survivorskills (
skillID INT PRIMARY KEY,
skillName char(32),
slotNo INT,
cooldown INT,
procCo DECIMAL,
realDesc TEXT
);
GO

/* slotNo refers to the slot that the skill can be used in. A slotNo of 0 means that the skill is a passive. */

INSERT INTO survivorskills
VALUES 
(1, 'Double Tap', 1, 0, 1.0, 'Rapidly shoot an enemy for 100% damage.'),
(2, 'Phase Round', 2, 3, 1.0, 'Fire a piercing bullet for 300% damage. Deals 40% more damage every time it passes through an enemy.'),
(3, 'Phase Blast', 2, 3, 0.5, 'Fire two close-range blasts that deal 8x200% damage total.'),
(4, 'Tactical Dive', 3, 4, 0, 'Roll a short distance.'),
(5, 'Tactical Slide', 3, 4, 0, 'Slide on the ground for a short distance. You can fire while sliding.'),
(6, 'Suppressive Fire', 4, 9, 1.0, 'Stunning. Fire repeatedly for 100% damage per bullet. The number of shots increases with attack speed.'),
(7, 'Frag Grenade', 4, 5, 1.0, 'Throw a grenade that explodes for 700% damage. Can hold up to 2.')
GO

INSERT INTO survivorlist
VALUES
(1, 'Commando', 110, 33, 1, 0.2, 12, 2.4, 0, 7, 'The Commando is a jack-of-all-trades character that is reliable in all situations of the game.')
GO

INSERT INTO survivorskillslist
VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7)
GO