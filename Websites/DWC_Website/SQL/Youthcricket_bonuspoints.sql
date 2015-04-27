select * from tournament
select * from teams
select * from tournament_team where tournament_id = 6
select * from team where team_id = 610970106
insert into penalty (tournament_id, team_id, type_code, points, verbose) values (6, 610970106, 3, 1, 'Bonus Points')

select * from bonus
select * from penalty
delete from bonus
delete from penalty

select t.name, b.* from bonus b inner join team t on t.team_id = b.team_id and 


select team1 = t1.name, team2 = t2.name, m.* from match m inner join team t1 on t1.team_id = m.team1_id 
inner join team t2 on t2.team_id = m.team2_id and m.match_id = 2059199630