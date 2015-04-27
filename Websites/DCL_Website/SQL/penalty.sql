select * from penalty
select* from team order by name
select * from tournament
select* from tournament_team

select* from tournament_team where tournament_id = 1086433313 and team_id = 2043622090
update tournament_team set points = 2 where tournament_id = 1086433313 and team_id = 2043622090
select * from penalty order by penalty_id
insert into penalty values (39, 1086433313, 2043622090, 1, -2, 'Missed Umpiring Penalty')
