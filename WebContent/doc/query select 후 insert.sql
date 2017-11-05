INSERT INTO member (id, pass, name, email, jointype, membertype) 
SELECT 'victor', '123', 'victor', 'victor@gmail.com', 1, 1 
from dual 
WHERE NOT EXISTS ( 
	SELECT * 
	FROM member 
	WHERE 
		id = 'victor'
)

