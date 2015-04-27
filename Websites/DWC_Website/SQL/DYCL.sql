select * from tournament 
select * from team
select* from users where team_id= 1184801169
select * from tournament_team where tournament_id= 6
select t.name, tt.* from tournament_team tt, team t where tt. tournament_id= 6 and t.team_id = tt.team_id

-- team grouping 
update tournament_Team set group_name= 'C1', group_id = 5 where tournament_id= 6 and rec_id in (5, 3, 4, 1)
update tournament_Team set group_name= 'D1', group_id = 6 where tournament_id= 6 and rec_id in (2, 6, 7, 8)
