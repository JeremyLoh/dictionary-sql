-- SQLite
-- (In alphabetical order) Find the next two words after aardwolves
SELECT word
FROM words
WHERE word > "aardwolves"
ORDER BY word ASC
LIMIT 2;

-- Find the previous two words before ball. Maintain the alphabetical order
SELECT word FROM (
    SELECT word
    FROM words
    WHERE word < "ball"
    ORDER BY word DESC
    LIMIT 2
)
ORDER BY word ASC;