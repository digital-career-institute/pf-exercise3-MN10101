mysql> create table Candidates(
    -> candidate_id INTEGER PRIMARY KEY,
    -> name TEXT,
    -> party_affiliation TEXT,
    -> position TEXT
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> ALTER TABLE Candidates DROP PRIMARY KEY;
Query OK, 0 rows affected (0.10 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Candidates ADD PRIMARY KEY (candidate_id);
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table Votes(
    -> voter_id INTEGER,
    -> candidate_id INTEGER,
    -> PRIMARY KEY ( voter_id, candidate_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> ALTER TABLE Votes ADD FOREIGN KEY(candidate_id) REFERENCES Candidates(candidate_id);
Query OK, 0 rows affected (0.15 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table Voters(
    -> voter_id INTEGER,
    -> name TEXT,
    -> age INTEGER,
    -> voted_for INTEGER,
    -> FOREIGN KEY (voted_for) REFERENCES Candidates(candidate_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> show create table Voters;
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Table  | Create Table

                       |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Voters | CREATE TABLE `voters` (
  `voter_id` int DEFAULT NULL,
  `name` text,
  `age` int DEFAULT NULL,
  `voted_for` int DEFAULT NULL,
  KEY `voted_for` (`voted_for`),
  CONSTRAINT `voters_ibfk_1` FOREIGN KEY (`voted_for`) REFERENCES `candidates` (`candidate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+--------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)

mysql> ALTER TABLE Voters DROP FOREIGN KEY voters_ibfk_1;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE Voters ADD FOREIGN KEY (voted_for) REFERENCES Candidates(candidate_id);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Candidates (candidate_id, name, party_affiliation, position) VALUES(1, 'James Anderson', 'Labour Party', 'Member of Parliament'), (2, 'Sophie Baker', 'Conservative Party', 'Mayor'),(3, 'Oliver Clark', 'Liberal Democrats', 'Council Member'), (4, 'Emma Harris', 'Green Party', 'Member of European Parliament'),(5, 'Liam Walker', 'Scottish National Party', 'Member of Scottish Parliament');
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO Voters (voter_id, name, age, voted_for) VALUES(01, 'Sven Sa', 23, 3),(02, 'Stefan Sha', 44, 1),(03, 'Maya Ma', 24, 3),(04, 'Lulu Lu', 55, 4), (05, 'Hadi Ha', 64, 5);
Query OK, 5 rows affected (0.01 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> select * from Candidates;
+--------------+----------------+-------------------------+-------------------------------+
| candidate_id | name           | party_affiliation       | position                      |
+--------------+----------------+-------------------------+-------------------------------+
|            1 | James Anderson | Labour Party            | Member of Parliament          |
|            2 | Sophie Baker   | Conservative Party      | Mayor                         |
|            3 | Oliver Clark   | Liberal Democrats       | Council Member                |
|            4 | Emma Harris    | Green Party             | Member of European Parliament |
|            5 | Liam Walker    | Scottish National Party | Member of Scottish Parliament |
+--------------+----------------+-------------------------+-------------------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Voters WHERE voted_for = 2;
Empty set (0.00 sec)