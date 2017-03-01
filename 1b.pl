% flight(Origin, Destination, Dep_time, Arr_time, Week_day, Airline,
% Flight_num, NFlying_days, Price, Distance)

flight(montreal, vancouver, 100, 500, 1, westjet, 123, 1, 1000, 3692).
flight(vancouver, beijing, 531, 1630, 1, westjet, 234, 1, 2000, 8508).
flight(beijing, tokyo, 1730, 730, 1, airchina, 345, 1, 300, 1000).

flight_on_same_airline(From, To):- flight_on_same_airline_helper(From,To,_,0).

flight_on_same_airline_helper(From, To, Airline, Prev_Arriv_Time):- flight(From, To,DTime,_,_,Airline,_,_,_,_), transfer(Prev_Arriv_Time, DTime).
flight_on_same_airline_helper(From, To, Airline, Prev_Arriv_Time):- flight(From, X,DTime,ATime,_,Airline,_,_,_,_), transfer(Prev_Arriv_Time, DTime), flight_on_same_airline_helper(X,To,Airline,ATime).



transfer(ATime, DTime):- ((floor(DTime/100) * 60) + mod(DTime, 100)) - ((floor(ATime/100) * 60) + mod(ATime, 100)) > 30.

% Check if connecting flight is more than 30 minutes
% We assume all transfer flights are within 24hours of eachother.
%transfer(ADay, ATime, DDay, DTime):- ADay is DDay, DTime - ATime > 30.
% transfer(ADay, ATime, DDay, DTime):- day_before(ADay, DDay),
% (24-floor(ATime/100))*60 - (mod(ATime,100)) + (floor(DTime/100)*60) +
% (mod(DTime, 100)) > 30.

day_before(ADay, DDay):- (DDay > ADay, DDay - ADay is 1); (DDay is 1, ADay is 7).

