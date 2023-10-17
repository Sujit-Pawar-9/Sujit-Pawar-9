
/*
drop procedure if exists pro2;
delimiter $
create procedure pro2(in x int ,in y int)
BEGIN
	select x+y;
end $
delimiter ;


drop procedure if exists pro2;
delimiter $
create procedure PRO2(in x int,in y int,out z1 int,out z2 int)
BEGIN
 set z1 := x+y;
 set z2 := x*y;
end $
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure PRO2()
BEGIN
	declare x int;
	set x:=0;
	
	label5:LOOP
	
		if x>10 then leave label5;
		end if;

		select x;
	    set x:=x+1;
	end loop label5;
	
end $
delimiter ;


drop procedure if exists pro2;
delimiter $
create procedure PRO2(in y int)
BEGIN
	declare x int;
	set x:=0;
	
	label5:LOOP
	
		if x>=10 then leave label5;
		end if;
		
	    set x:=x+1;
		select x*y;
	end loop label5;
	
end $
delimiter ;

--accept string from user

drop procedure if exists pro2;
delimiter $
create procedure PRO2(in y varchar(20))
BEGIN
		select y;
	
end $
delimiter ;

--to print each and every character of a string
drop procedure if exists pro2;
DELIMITER //
CREATE PROCEDURE PRO2(in str VARCHAR(255))
BEGIN
  DECLARE len, i INT;
  DECLARE curr_char CHAR(1);

  SET len = LENGTH(str);
  SET i = 1;

  WHILE i <= len DO
    SET curr_char = SUBSTRING(str, i, 1);
    SELECT curr_char;
    SET i = i + 1;
  END WHILE;
END //
DELIMITER ;

drop procedure if exists pro2;
delimiter $
create procedure PRO2()
BEGIN

	insert into d values (2,2,2),(3,3,3);
	
end $
delimiter ; 

drop procedure if exists pro2;
delimiter $
create procedure PRO2()
BEGIN
    declare exit handler for 1062 select "data present" as "error window";
	insert into d values (2,2,2),(3,3,3);
	
end $
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure pro2(p1 int,p2 varchar(20),p3 varchar(20))
BEGIN
 insert into (p1,p2,p3) values (p1,p2,p3);
 select "record inserted succesfully!";
 
end $
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure pro2(p1 int, p2 varchar(20), p3 varchar(20))
BEGIN
declare exit handler for 1062 select "Data Present" as "Error Window";
	
	if p3 = 'pune' THEN
		insert into d values(p1, p2, p3);
		select "Record Insertd suss!";
	else
		select "In-valid Location" R1;
	end if;
end $
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure pro2(in _deptno int)
BEGIN
	DECLARE flag bool;
	select true into flag from dept where deptno=_deptno;
	
	if flag then
		select * from dept where deptno=_deptno;
	else
		select "RECORD NOT FOUND" r1;
	end if;	
	

end $
delimiter ;

drop procedure if exists pro2;
delimiter $
create procedure pro2(_start int,_end int)
BEGIN
	select row_number() over() R1 ,ename,job,sal from emp limit _start,_end;
	
end $
delimiter ;

--error while creating table as name in given by calling proceudre 
drop procedure if exists pro2;
delimiter $
create procedure pro2(in _tname varchar(20))
BEGIN
   create table _tname(c1 int,c2 int);
   
end $
delimiter ;

--soo NEXT
--set @x := create table _tname(c1 int,c2 int);
	--select @x;
 

drop procedure if exists pro2;
delimiter $
create procedure pro2(in _tname varchar(20))
BEGIN
	
	set @x := concat("create table",_tname,"(c1 int,c2 int)");
	select @x;
end $
delimiter ;

| @x                            |
+-------------------------------+
| create tableyu(c1 int,c2 int)

--DYNAMIC TABLE CREATION */

drop procedure if exists pro2;
delimiter $
create procedure pro2(_tname varchar(20))
BEGIN
 set @x := concat("create table ", _tname , "(c1 int,c2 int)");
 prepare z from @x;
 execute z;
end $
delimiter ;