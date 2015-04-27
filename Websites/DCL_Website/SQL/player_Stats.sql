-- identify the player statistics

select * from player where first_name like '%Hardeep%' and last_name like '%%'
select * from player where first_name like '%Anand%' and last_name like '%Magadi%'
select * from player where first_name like '%Abhi%' and last_name like '%Mukund%'
select * from team where team_id in (2095549711, 2095549698)

select * from tournament where tournament_id in (1086433315,1086433316,1086433317,1086433318)

select * from match where match_id = 2027388870

select * from player_batting where player_id = 1654565497 
select * from match_Batting where player_id = 1654565497 and match_id in (select match_id from match where tournament_id = 1086433314)
select mb.* from match_batting mb inner join match m on m.match_id = mb.match_id and m.tournament_id = 1086433314 and mb.player_id = 1654565497

select * from player_batting where player_id = 1110827263
select * from match_Batting where player_id = 1110827263 and match_id in (select match_id from match where tournament_id = 1086433314)

select * from player_batting where tournament_id in (1086433315,1086433316,1086433317,1086433318) and runs > 0
select * from player_bowling where tournament_id in (1086433315,1086433316,1086433317,1086433318) and overs > 0

select * from player_batting where tournament_id = 1086433316 and runs > 0
select * from player_bowling where tournament_id = 1086433316 and overs > 0

select * from player_batting where player_id = 1654565497 and tournament_id = 1086433316
select * from match_Batting where player_id = 1654565497 and match_id in (select match_id from match where tournament_id = 1086433316)
select mb.* from match_batting mb inner join match m on m.match_id = mb.match_id and m.tournament_id = 1086433314 and mb.player_id = 1654565497


select match_id from match where tournament_id = 1086433314
select * from match_Batting where match_id in (select match_id from match where tournament_id = 1086433314)
select distinct(player_id) from match_Batting where match_id in (select match_id from match where tournament_id = 1086433314) group by player_id
select distinct(match_id) from match_Batting where match_id in (select match_id from match where tournament_id = 1086433314) group by match_id

