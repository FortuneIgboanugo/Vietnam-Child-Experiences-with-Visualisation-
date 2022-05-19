--creating schemas 
create schema Vietwave1;

create schema Vietwave2;

--CREATING VIEWS AND CREATING TABLES WITH THW VIEWS(SCHEMAS ARE NAMED AFTER THE 2 WAVES)

create view Learning_outcome
as
select uniqueid, schoolid, studentid, province, gender, absent_days, stageeng,eng_test, eng_rawscore, math_test, math_rawscore, grlenrl, boyenrl, tgrlenrl, tboyenrl
from dbo.[vietnam_wave_1.tab];

select * into vietwave1.learningoutcome
from Learning_outcome;

create view home_bckground
as
select uniqueid, studentid, stdliv, stplstdy, STHVDESK, stplhlrd, stplhl01, stplhl03, stplhl06, sthvintr, stpplhm, stdlnghm, province
from dbo.[vietnam_wave_1.tab];

select * into vietwave1.homebackground
from home_bckground;

create view school_
as
select uniqueid, studentid, schfac01a, schfac01b, schfac04, schfac05, schfac07, htampaid9, schfac02, schfac10, schfac11
from dbo.[vietnam_wave_1.tab];

select * into vietwave1.school
from school_;

create view Learning_outcome2
as
select uniqueid, schoolid, studentid, stfeel19c, stfeel21e, stfeel22a, stfeel22b, stfeel22h, stfeel23a, eng_test, eng_rawscore, math_test, math_rawscore
from dbo.[vietnam_wave_2.tab];

select * into vietwave2.Learningoutcome2
from Learning_outcome2;

create view teachers_behaviour
as
select uniqueid, schoolid, studentid, stmthwrk, stmwrkch, stethwrk, stfeel33, stfeel34, stfeel37, stfeel35, stfeel47
from dbo.[vietnam_wave_2.tab];

select * into vietwave2.teachers_behaviours
from teachers_behaviour;

create view school_2
as 
select uniqueid, schoolid, studentid, stcmpsch, staddmt, stadden, stprven, stprvmt
from  dbo.[vietnam_wave_2.tab];

select * into vietwave2.school_2
from school_2;

--TRANSFORMING THE TABLES BY CREATING STOREED PROCEDURES FOR ALL ENCODING TO REMOVE NUMERICAL DATA

create procedure learningoutcome_trans
as
begin
	update vietwave1.learningoutcome
	set province =
	case 
	when province = 1	then 'Ben Tre'
	when province = 2	then 'Da Nang'
	when province = 3	then 'Hung Yen'
	when province = 4	then 'Lao Cai'
	when province = 5	then 'Phu Yen'
	else 'null'
	end 

	update vietwave1.learningoutcome
	set gender =
	case 
	when gender = 1	then 'Male'
	when gender = 2	then 'Female'
	else 'null'
	end

	update vietwave1.learningoutcome
	set stageeng =
	case 
	when stageeng = 0  then 'I have never learned English in school'
	when stageeng = 1  then 'Kindergarten'
	when stageeng = 2  then 'Grade 1 - 5'
	when stageeng = 3  then 'Grade 6 - 9'
	when stageeng = 4  then 'Grade 10'
	when stageeng = 99 then 'Missing'
	when stageeng = 88 then	'NA'
	else 'null'
	end

end;
go

execute learningoutcome_trans;

create procedure homebackground_trans
as 
begin
	update vietwave1.homebackground
	set stdliv =
	case 
	when stdliv = 99 then 'Missing'
	when stdliv = 1  then 'At home with my parents'
	when stdliv = 2  then 'With other family or friends'
	when stdliv = 3  then 'In a school hostel'
	when stdliv = 4  then 'In a private hostel'
	when stdliv = 5	 then 'Other'
	when stdliv = 88 then 'NA'
	else 'null'
	end 

	update vietwave1.homebackground
	set stplstdy = 
	case 
	when stplstdy = 0 then 'no'
	when stplstdy = 1 then 'yes'
	else 'null'
	end 

	update vietwave1.homebackground
	set STHVDESK =
	case 
	when STHVDESK = 0 then 'no'
	when STHVDESK = 1 then 'yes'
	else 'null'
	end 

	update vietwave1.homebackground
	set stplhlrd =
	case 
	when stplhlrd = 0 then  'Never'
	when stplhlrd = 1 then  'Sometimes'
	when stplhlrd = 2 then  'Always'
	when stplhlrd = 99 then 'Missing'
	when stplhlrd = 88 then 'NA'
	else 'null'
	end 

	update vietwave1.homebackground
	set stplhl01 =
	case
	when stplhl01 = 99	then  'Missing'
	when stplhl01 = 1 	then  'Never or almost never'
	when stplhl01 = 2	then  'Once or twice a month'
	when stplhl01 = 3	then  'Once or twice a week'
	when stplhl01 = 4	then  'Everyday or almost everyday'
	when stplhl01 = 88	then  'NA'
	else 'null'
	end

	update vietwave1.homebackground
	set stplhl03 =
	case
	when stplhl03 = 99	then  'Missing'
	when stplhl03 = 1 	then  'Never or almost never'
	when stplhl03 = 2	then  'Once or twice a month'
	when stplhl03 = 3	then  'Once or twice a week'
	when stplhl03 = 4	then  'Everyday or almost everyday'
	when stplhl03 = 88	then  'NA'
	else 'null'
	end

	update vietwave1.homebackground
	set stplhl06 =
	case
	when stplhl06 = 99	then  'Missing'
	when stplhl06 = 1 	then  'Never or almost never'
	when stplhl06 = 2	then  'Once or twice a month'
	when stplhl06 = 3	then  'Once or twice a week'
	when stplhl06 = 4	then  'Everyday or almost everyday'
	when stplhl06 = 88	then  'NA'
	else 'null'
	end

	update vietwave1.homebackground
	set STHVINTR =
	case
	when STHVINTR = 0	then  'no'
	when STHVINTR = 1 	then  'yes'
	else 'null'
	end

	update vietwave1.homebackground
	set STDLNGHM =
	case 
	when STDLNGHM = 0 then  'Never'
	when STDLNGHM = 1 then  'Sometimes'
	when STDLNGHM = 2 then  'Always'
	when STDLNGHM = 99 then 'Missing'
	when STDLNGHM = 88 then 'NA'
	else 'null'
	end 

	update vietwave1.homebackground
	set province =
	case 
	when province = 1	then 'Ben Tre'
	when province = 2	then 'Da Nang'
	when province = 3	then 'Hung Yen'
	when province = 4	then 'Lao Cai'
	when province = 5	then 'Phu Yen'
	else 'null'
	end 

end;
go

execute homebackground_trans;

create procedure school_trans
as 
begin
	update vietwave1.school
	set SCHFAC04 =
	case 
	when SCHFAC04 = 0 then 'yes'
	when SCHFAC04 = 1 then 'no'     
	else 'null'
	end 
	
	update vietwave1.school
	set SCHFAC05 =
	case 
	when SCHFAC05 = 0 then 'yes'
	when SCHFAC05 = 1 then 'no'     
	else 'null'
	end 

	update vietwave1.school
	set SCHFAC02 =
	case 
	when SCHFAC02 = 0 then 'yes'
	when SCHFAC02 = 1 then 'no'     
	else 'null'
	end 
	
	update vietwave1.school
	set SCHFAC07 =
	case 
	when SCHFAC07 = 0 then 'yes'
	when SCHFAC07 = 1 then 'no'     
	else 'null'
	end 

	update vietwave1.school
	set SCHFAC11 =
	case 
	when SCHFAC11 = 0 then 'yes'
	when SCHFAC11 = 1 then 'no'     
	else 'null'
	end 

end;
go

execute school_trans;

create procedure Learningoutcome2_trans
as 
begin
	update vietwave2.Learningoutcome2
	set STFEEL19C=
	case 
	when stfeel19c = 1 then 'Strongly disagree'
	when stfeel19c = 2 then 'Disagree'
	when stfeel19c = 3 then 'Agree'
	when stfeel19c = 4 then 'Strongly agree'
	when stfeel19c = 88	then 'NA'
	when stfeel19c = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.Learningoutcome2
	set STFEEL21E =
	case 
	when STFEEL21E = 1 then 'Strongly disagree'
	when STFEEL21E = 2 then 'Disagree'
	when STFEEL21E = 3 then 'Agree'
	when STFEEL21E = 4 then 'Strongly agree'
	when STFEEL21E = 88	then 'NA'
	when STFEEL21E = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.Learningoutcome2
	set STFEEL22A =
	case 
	when STFEEL22A = 1 then 'Strongly disagree'
	when STFEEL22A = 2 then 'Disagree'
	when STFEEL22A = 3 then 'Agree'
	when STFEEL22A = 4 then 'Strongly agree'
	when STFEEL22A = 88	then 'NA'
	when STFEEL22A = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.Learningoutcome2
	set STFEEL22B =
	case 
	when STFEEL22B = 1 then 'Strongly disagree'
	when STFEEL22B = 2 then 'Disagree'
	when STFEEL22B = 3 then 'Agree'
	when STFEEL22B = 4 then 'Strongly agree'
	when STFEEL22B = 88	then 'NA'
	when STFEEL22B = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.Learningoutcome2
	set STFEEL22H =
	case 
	when STFEEL22H = 1 then 'Strongly disagree'
	when STFEEL22H = 2 then 'Disagree'
	when STFEEL22H = 3 then 'Agree'
	when STFEEL22H = 4 then 'Strongly agree'
	when STFEEL22H = 88	then 'NA'
	when STFEEL22H = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.Learningoutcome2
	set STFEEL23A =
	case 
	when STFEEL23A = 1 then 'Strongly disagree'
	when STFEEL23A = 2 then 'Disagree'
	when STFEEL23A = 3 then 'Agree'
	when STFEEL23A = 4 then 'Strongly agree'
	when STFEEL23A = 88	then 'NA'
	when STFEEL23A = 79	then 'Missing'
	else 'null'
	end 

END;
GO

EXECUTE Learningoutcome2_trans


create procedure school2_trans
as 
begin
	update vietwave2.school_2
	set stcmpsch = 
	case
	when stcmpsch = 1 then 'Never or almost never'
	when stcmpsch = 2 then 'Once or twice a month'
	when stcmpsch = 3 then 'Once or twice a week'
	when stcmpsch = 4 then 'Every day or almost every day'
	when stcmpsch = 88 then 'NA'
	when stcmpsch = 79 then 'Missing'
	else 'null'
	end

	update vietwave2.school_2
	set staddmt =
	case
	when staddmt = 88	then 'NA'
	when staddmt = 1	then 'Yes, to excel in class'
	when staddmt = 2	then 'Yes, to keep up in class'
	when staddmt = 3    then 'No'
	when staddmt = 79	then 'Missing'
	else 'null'
	end

	update vietwave2.school_2
	set stadden =
	case
	when stadden = 88	then 'NA'
	when stadden = 1	then 'Yes, to excel in class'
	when stadden = 2	then 'Yes, to keep up in class'
	when stadden = 3    then 'No'
	when stadden = 79	then 'Missing'
	else 'null'
	end

	update vietwave2.school_2
	set stprvmt =
	case
	when stprvmt = 88	then 'NA'
	when stprvmt = 1	then 'Yes, to excel in class'
	when stprvmt = 2	then 'Yes, to keep up in class'
	when stprvmt = 3    then 'No'
	when stprvmt = 79	then 'Missing'
	else 'null'
	end
	
	update vietwave2.school_2
	set STPRVEN =
	case
	when STPRVEN = 88	then 'NA'
	when STPRVEN = 1	then 'Yes, to excel in class'
	when STPRVEN = 2	then 'Yes, to keep up in class'
	when STPRVEN = 3    then 'No'
	when STPRVEN = 79	then 'Missing'
	else 'null'
	end

end;
go

execute school2_trans;


create procedure teachers_behaviourstrans
as
begin
	update vietwave2.teachers_behaviours
	set STMTHWRK =
	case
	when STMTHWRK = 0 then 'Rarely/Never'
	when STMTHWRK = 1 then 'Once a week'
	when STMTHWRK = 2 then '2 times per week'
	when STMTHWRK = 3 then '3 times per week'
	when STMTHWRK = 4 then 'More than 3 times per week'
	when STMTHWRK = 88	then 'NA'
	when STMTHWRK = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set STMWRKCH =
	case 
	when STMWRKCH = 0 then 'I never get homework in Maths'
	when STMWRKCH = 1 then 'Rarely'
	when STMWRKCH = 2 then 'Occasionally'
	when STMWRKCH = 3 then 'Always/Frequently'
	when STMWRKCH = 88 then 'NA'
	when STMWRKCH = 79 then 'Missing'
	else 'null'
	end

	update vietwave2.teachers_behaviours
	set stethwrk = 
	case 
	when stethwrk = 0 then 'Rarely/Never'
	when stethwrk = 1 then 'Once a week'
	when stethwrk = 2 then '2 times per week'
	when stethwrk = 3 then '3 times per week'
	when stethwrk = 4 then 'More than 3 times per week'
	when stethwrk = 88	then 'NA'
	when stethwrk = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set stfeel33 =
	case 
	when stfeel33 = 1 then 'Strongly disagree'
	when stfeel33 = 2 then 'Disagree'
	when stfeel33 = 3 then 'Agree'
	when stfeel33 = 4 then 'Strongly agree'
	when stfeel33 = 88	then 'NA'
	when stfeel33 = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set stfeel34 =
	case 
	when stfeel34 = 1 then 'Strongly disagree'
	when stfeel34 = 2 then 'Disagree'
	when stfeel34 = 3 then 'Agree'
	when stfeel34 = 4 then 'Strongly agree'
	when stfeel34 = 88	then 'NA'
	when stfeel34 = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set stfeel37 =
	case 
	when stfeel37 = 1 then 'Strongly disagree'
	when stfeel37 = 2 then 'Disagree'
	when stfeel37 = 3 then 'Agree'
	when stfeel37 = 4 then 'Strongly agree'
	when stfeel37 = 88	then 'NA'
	when stfeel37 = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set stfeel35 =
	case 
	when stfeel35 = 1 then 'Strongly disagree'
	when stfeel35 = 2 then 'Disagree'
	when stfeel35 = 3 then 'Agree'
	when stfeel35 = 4 then 'Strongly agree'
	when stfeel35 = 88	then 'NA'
	when stfeel35 = 79	then 'Missing'
	else 'null'
	end 

	update vietwave2.teachers_behaviours
	set stfeel47 =
	case 
	when stfeel47 = 1 then 'Strongly disagree'
	when stfeel47 = 2 then 'Disagree'
	when stfeel47 = 3 then 'Agree'
	when stfeel47 = 4 then 'Strongly agree'
	when stfeel47 = 88	then 'NA'
	when stfeel47 = 79	then 'Missing'
	else 'null'
	end 
	
end;
go

execute teachers_behaviourstrans;

---Altering columns to create primary keys (uniqueid, studentid) on the center table as not nullable(Vietwave1).
alter table vietwave1.learningoutcome 
alter column uniqueid varchar(50) not null;

alter table vietwave1.learningoutcome 
alter column studentid varchar(50) not null;

--creating composite key by altering keys
alter table vietwave1.learningoutcome
add constraint uniquestudent primary key (uniqueid,studentid);

---Altering columns to create primary keys (uniqueid, studentid) on the center table as not nullable(Vietwave2).
alter table vietwave2.learningoutcome2
alter column uniqueid varchar(50) not null;

alter table vietwave2.learningoutcome2 
alter column studentid varchar(50) not null;

--creating composite key by altering keys
alter table vietwave2.learningoutcome2
add constraint uniquestudent2 primary key (uniqueid,studentid);

--adding foriegn key to table(vietwave1.homebackgroud)
alter table vietwave1.homebackground
add constraint viethomebackground_fk foreign key (uniqueid,studentid)
references vietwave1.learningoutcome (uniqueid,studentid);

--adding foriegn key to table(vietwave1.school)
alter table vietwave1.school
add constraint vietschool_fk foreign key (uniqueid,studentid)
references vietwave1.learningoutcome (uniqueid,studentid);

--adding foriegn key to table(vietwave2.school_2)
alter table vietwave2.school_2
add constraint vietschool2_fk foreign key (uniqueid,studentid)
references vietwave2.learningoutcome2 (uniqueid,studentid);

--adding foriegn key to table(vietwave2.teachers_behaviours)
alter table vietwave2.teachers_behaviours
add constraint vietteachersbehaviours_fk foreign key (uniqueid,studentid)
references vietwave2.learningoutcome2 (uniqueid,studentid);

--REPORT 1 (THIS REPORT COMPARES THE PERFOMANCE OF CHILDREN WHOSE PARENTS/GUARDIANS DISCUSS THEIR ACADEMIC PROGESS IN SCHOOL AND THAT OF CHILDREM WHOSE PARENTS DON'T)
alter table vietwave1.learningoutcome
alter column math_rawscore float;

alter table vietwave1.learningoutcome
alter column eng_rawscore float;

create view Parental_Progress_Support_Analysis
as 
Select stplhl01 as Parental_Progress_Support, AVG(math_rawscore) as Maths_Score , AVG(eng_rawscore) as Eng_Score
from vietwave1.learningoutcome as learn
inner join vietwave1.homebackground as bckground
on learn.uniqueid = bckground.uniqueid
where stplhl01 like 'ev%' or  stplhl01 like 'ne%' 
group by stplhl01;

select *
from Parental_Progress_Support_Analysis;


-- REPORT 2 (COMPARATIVE ANALYSIS OF CHILDREN IN THE DIFFERENT PROVINCES AND THEIR ACADEMIC PERFOMANCE)

Create view Provincial_analysis
as 
Select hbck.province as Province, AVG(math_rawscore) as Maths_Score, AVG(eng_rawscore) as Eng_Score
from Vietwave1.homebackground as hbck
inner join Vietwave1.learningoutcome as lout
on hbck.uniqueid = lout.uniqueid
group by hbck.province;

select * 
from Provincial_analysis;

-- REPORT 3 (EFFECTS OF NEGATIVE TEACHER'S BEHAVIOUR ON THE CHILDREN'S ACADEMIC PERFOMANCE)
alter table vietwave2.learningoutcome2
alter column math_rawscore float;

alter table vietwave2.learningoutcome2
alter column eng_rawscore float;

Create view NEGATIVE_TEACHER_BEHAVIOUR
as 
select stfeel37 as Negavtive_Teachers_Behaviour, AVG(math_rawscore) as Maths_Score, AVG(eng_rawscore) as Eng_Score
from Vietwave2.teachers_behaviours as v2b
inner join Vietwave2.Learningoutcome2 as v2l
on v2b.schoolid = v2l.schoolid
where stfeel37 like '%strongly disagree' or stfeel37 like '%strongly agree'
group by stfeel37;

select * 
from NEGATIVE_TEACHER_BEHAVIOUR;