/* Welcome to the SQL mini project. For this project, you will use
Springboard' online SQL platform, which you can log into through the
following link:

https://sql.springboard.com/
Username: student
Password: learn_sql@springboard

The data you need is in the "country_club" database. This database
contains 3 tables:
    i) the "Bookings" table,
    ii) the "Facilities" table, and
    iii) the "Members" table.

Note that, if you need to, you can also download these tables locally.

In the mini project, you'll be asked a series of questions. You can
solve them using the platform, but for the final deliverable,
paste the code for each solution into this script, and upload it
to your GitHub.

Before starting with the questions, feel free to take your time,
exploring the data, and getting acquainted with the 3 tables. */



/* Q1: Some of the facilities charge a fee to members, but some do not.
Please list the names of the facilities that do. */
/*A1 Tennis Court 1, Tennis Court 2, Massage Room 1, Massage Room 2, Squash Court. */

SELECT distinct name FROM `Facilities` where membercost > 0


/* Q2: How many facilities do not charge a fee to members? */
/*Badminton Court, Table Tennis, Snooker Table, Pool Table. */

SELECT distinct name FROM `Facilities` where membercost=0

/* Q3: How can you produce a list of facilities that charge a fee to members,
where the fee is less than 20% of the facility's monthly maintenance cost?
Return the facid, facility name, member cost, and monthly maintenance of the
facilities in question. */

SELECT facid, name, membercost, monthlymaintenance FROM `Facilities` where membercost != 0 and membercost < (0.2 * monthlymaintenance)


/* Q4: How can you retrieve the details of facilities with ID 1 and 5?
Write the query without using the OR operator. */

SELECT * FROM `Facilities` where facid in (1,5)


/* Q5: How can you produce a list of facilities, with each labelled as
'cheap' or 'expensive', depending on if their monthly maintenance cost is
more than $100? Return the name and monthly maintenance of the facilities
in question. */

SELECT  name, monthlymaintenance,
	CASE 	WHEN monthlymaintenance <100 THEN 'cheap' ELSE 'expensive' END AS cheap_expensive
FROM Facilities



/* Q6: You'd like to get the first and last name of the last member(s)
who signed up. Do not use the LIMIT clause for your solution. */

select firstname, surname, joindate from Members where joindate = (SELECT max(joindate) FROM `Members` )


/* Q7: How can you produce a list of all members who have used a tennis court?
Include in your output the name of the court, and the name of the member
formatted as a single column. Ensure no duplicate data, and order by
the member name. */

SELECT f.name as facility_name, concat(firstname , surname) as fullname
from  Bookings as b, Facilities as f, Members as m 
where b.facid in (0,1) and b.facid = f.facid and b.memid = m.memid
group by fullname, facility_name
order by fullname

/*Note : if you name of both tennis facility is considered same then Group By will no require facility name. */
/*Requirement is ambiguous */


/* Q8: How can you produce a list of bookings on the day of 2012-09-14 which
will cost the member (or guest) more than $30? Remember that guests have
different costs to members (the listed costs are per half-hour 'slot'), and
the guest user's ID is always 0. Include in your output the name of the
facility, the name of the member formatted as a single column, and the cost.
Order by descending cost, and do not use any subqueries. */


SELECT f.name as facility_name, 
	CASE 
		WHEN  m.surname = 'GUEST'
			THEN  m.surname
			ELSE  CONCAT(m.surname, ", ", m.firstname)
	END AS member_name,
	CASE 
		WHEN  m.surname = 'GUEST'
			THEN  f.guestcost * b.slots
			ELSE  f.membercost * b.slots
	END AS cost
FROM `Bookings` b,`Facilities` f,`Members` m

WHERE b.facid = f.facid and b.memid = m.memid
      and  b.starttime BETWEEN '2012-09-14' AND '2012-09-15'
HAVING cost > 30
ORDER BY cost DESC


/* Q9: This time, produce the same result as in Q8, but using a subquery. */

SELECT f.name as facility_name, 
	CASE 
		WHEN  m.surname = 'GUEST'
			THEN  m.surname
			ELSE  CONCAT(m.surname, ", ", m.firstname)
	END AS member_name,
	CASE 
		WHEN  m.surname = 'GUEST'
			THEN  f.guestcost * b.slots
			ELSE  f.membercost * b.slots
	END AS cost
FROM (
	 SELECT *
	 FROM `Bookings`
	 WHERE starttime BETWEEN '2012-09-14' AND '2012-09-15'
	 ) b ,`Facilities` f,`Members` m
WHERE b.facid = f.facid and b.memid = m.memid
HAVING cost > 30
ORDER BY cost DESC

/* Q10: Produce a list of facilities with a total revenue less than 1000.
The output of facility name and total revenue, sorted by revenue. Remember
that there's a different cost for guests and members! */

SELECT  f.name,
	SUM(CASE WHEN b.memid = 0 THEN f.guestcost*b.slots ELSE f.membercost*b.slots END) AS revenue
FROM country_club.Facilities f
JOIN country_club.Bookings b
ON f.facid = b.facid
GROUP BY f.name
HAVING revenue < 1000
ORDER BY revenue DESC
