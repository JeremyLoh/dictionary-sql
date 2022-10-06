-- SQLite
-- (In alphabetical order) Find the next two words after aardwolves
SELECT word
FROM words
WHERE word > "aardwolves"
ORDER BY word ASC
LIMIT 2;

-- Find the previous two words before ball. Maintain the alphabetical order
SELECT word
FROM (
    SELECT word
    FROM words
    WHERE word < "ball"
    ORDER BY word DESC
    LIMIT 2
)
ORDER BY word ASC;

-- Find the previous two words before and after applausive. Maintain the alphabetical order
WITH before_word AS (
    SELECT word 
    FROM (SELECT word
        FROM words
        WHERE word <= 'applausive'
        ORDER BY word DESC
        LIMIT 3)
    ORDER BY word ASC
),
after_word AS (
    SELECT word
    FROM words
    WHERE word > 'applausive'
    ORDER BY word ASC
    LIMIT 2
)
SELECT word FROM before_word
UNION ALL
SELECT word FROM after_word;

--Find the average length of all words
SELECT AVG(LENGTH(word))
FROM words;

-- Find the average length of the first 10000 words, in alphabetical order
SELECT AVG(LENGTH(word))
FROM (
    SELECT word
    FROM words
    ORDER BY word ASC
    LIMIT 10000
); -- AVG() works on the whole table stated in 'FROM'

-- Find the average length of the words from position 90000 to 108000, in alphabetical order
-- The average length should be in 2 decimal place
SELECT ROUND(AVG(LENGTH(word)), 2)
FROM (
    SELECT word
    FROM words
    ORDER BY word ASC
    LIMIT 18000
    OFFSET 90000
);
