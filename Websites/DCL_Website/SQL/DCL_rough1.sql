select* from users order by created_Dt desc

select * from team_Registration where tournament_id = 1086433314 order by name

select * from team_Registration where tournament_id =1086433314 and rec_id = 25
update team_Registration set name = 'Dallas Warriors' where tournament_id =1086433314 and rec_id = 25

insert into team_registration 
values (
'651A74B4-2D67-4541-944A-9EFD04857634', 1086433314, 46, 0, 'Plano Tigers',
'Amit Saxena', 'Captain', '2145294616', 'saxena_amit@hotmail.com',  
'Jasvinder Singh', 'Vice-Captain', '9376250007','smartjp007@yahoo.com', 
'Plano', 
'No. Player Name Location 1 Amit Saxena Plano 2 Amjad Khan Plano 3 Jasvinder Singh Plano 4 Kartik Gutta Plano 5 Rajesh A Plano 6 Ram Krishnan Plano 7 Ravi Chaithanya Plano 8 Sashank C Plano 9 Shekar G Plano 10 Suresh Pancharp',
'2013-02-10', null, 1)


update team_registration 
set created_Dt = '2013-02-11'
where  tournament_id = 1086433314 and rec_id = 46