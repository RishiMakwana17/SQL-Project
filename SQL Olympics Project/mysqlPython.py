import mysql.connector

olympics = mysql.connector.connect(host="localhost",
                               user="-",
                               password="-",
                               database = 'Olympics')
cursor = olympics.cursor()

 #List the full names of all competitors from Australi
query1 = ("SELECT DISTINCT athlete.name, athlete.DOB FROM athlete NATURAL JOIN athlete_event NATURAL JOIN events WHERE athlete.athlete_id = athlete_event.athlete_id AND athlete_event.event_id = events.event_id AND athlete.country_id = 37")

#Lists the total number of gold medals won by each country
query2 = ("SELECT country.country_name, COUNT(athlete_event.medal_id) FROM country, athlete, athlete_event WHERE country.country_id = athlete.country_id AND athlete.athlete_id = athlete_event.athlete_id AND athlete_event.medal_id = 2 GROUP BY country.country_name")

#Lists names and the number of medals won by only with medals.
query3 = ("SELECT athlete.name AS Name ,COUNT(athlete_event.athlete_id) AS numberofraces FROM athlete LEFT OUTER JOIN athlete_event ON athlete.athlete_id = athlete_event.athlete_id GROUP BY athlete.name")



querylist = [query1, query2, query3]

while(True):
    print("\n0. List the full names of all competitors from Australia that were born after the 2000's\n1. Lists the total number of gold medals won by each country\n2. Lists names and the number of medals won by only with medals\n")
    num = int(input("Enter query number: " ))
    
    if num < len(querylist) and num >= 0:
        cursor.execute(querylist[num])
        rows = cursor.fetchall()
        for x in rows:
            print(x)
    else:
        print("Out of Bounds")


cursor.close()
olympics.close()
