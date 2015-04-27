select * from tournament where tournament_id = 6

select * from tournament_team where tournament_id = 20
select t.name, * from tournament_team tr inner join team t on t.team_id = tr.team_id where tournament_id = 20

update tournament_team  set group_name = 'B', group_id = 6
where tournament_id = 20 and rec_id in (6,3, 7, 4)


select * from tournament_team order by created_dt

select * from match where tournament_id = 20



