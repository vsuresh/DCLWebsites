select * from address
select * from phone
select * from email
select * from player_registration
select * from team
select * from team_registration
select * from users order by user_id

update phone set number = null
update email set address = null
update team set contact_email = null
update team set contact_email = null
delete from player_registration
delete from team_registration
update users set password = '123', reminder = '' where user_id > 0
update users set user_name = SUBSTRING(user_name, 0, 5) where user_id > 0

