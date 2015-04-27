-----------------------------------------
-- ALL tables list
-----------------------------------------
select * from address
select * from announcement
select * from email
select * from award_types
select * from ground
select * from ground_reservations
select * from log
select * from match
select * from match_batting
select * from match_bowling
select * from match_stats
select * from PaymentDetails
select * from penalty
select * from phone
select * from player
select * from player_batting
select * from player_bowling
--select * from player_registration
select * from role
select * from rules
select * from team
select * from team_division
select * from team_registration
select * from tournament
select * from tournament_awards
select * from tournament_team
select * from user_role
select * from users order by created_dt desc

-------------------------------------------------------
-- Clean up for some tables
-------------------------------------------------------
select * from tournament
select * from tournament_team
select * from team order by name
select * from users order by user_name 
select * from player
select * from team order by created_dt desc

/*
select * from team where team_id in (select team_id from tournament_team) order by name 
select * from team where team_id not in (select team_id from tournament_team) order by name 

select * from users where team_id in (select team_id from tournament_team) 
select * from users where team_id not in (select team_id from tournament_team) 

select * from player where team_id in (select team_id from team) order by team_id
select * from player where team_id not in (select team_id from team) order by team_id 

delete from users where team_id not in (select team_id from team) 
delete from team where team_id not in (select team_id from tournament_team) order by name 
delete from team where team_id not in 

select * from address where address_id in ((select address_id from team))
select * from address where address_id not in ((select address_id from team))
delete from address where address_id not in ((select address_id from team))

select * from phone where phone_id in ((select phone_id from team) union (select phone_id from player))
select * from phone where phone_id not in ((select phone_id from team) union (select phone_id from player))
delete from phone where phone_id not in ((select phone_id from team) union (select phone_id from player))

select * from email where email_id in ((select email_id from team) union (select email_id from player))
select * from email where email_id not in ((select email_id from team) union (select email_id from player))
delete from email where email_id not in ((select email_id from team) union (select email_id from player))

select * from address
select * from phone 
select * from email
*/