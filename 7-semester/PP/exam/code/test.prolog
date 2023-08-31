% somerepeat([X|_],[X|_]).
% somerepeat([X|XS],[Y|YS]) :- somerepeat([X|XS],YS).
% somerepeat([X|XS],[Y|YS]) :- somerepeat(XS,[Y|YS]).


% warm(goat,Z).
% warm(sheep , ears).
% warm(wool(X),Y) :- warm(X,Y).

% Set 3 - Problem 4
% prefix([],[]).

prefix([X|[]], [X|_]).
prefix([X|XS], [X|YS]) :- prefix(XS, YS).

suffix([X|[]], [X|[]]).
suffix([X|XS], [X|XS]).
suffix(XS, [_|YS]) :- suffix(XS, YS).


% Set 3 - Problem 5
double([], []).
double([X|XS], [X, X|YS]) :- double(XS, YS).


% Set 3 - Problem 6

zip([X|[]], [Y|[]], [(X,Y)|[]]).
zip([X|XS], [Y|YS], [(X,Y)|ZS])  :- zip(XS, YS, ZS).

unzip([(X,Y)|[]], [X|[]], [Y|[]]).
unzip([(X,Y)|ZS], [X|XS], [Y|YS]) :- unzip(ZS, XS, YS).

% Exam Example - Problem 9
warm(goat,Z).
warm(sheep, ears).
warm(wool(X),Y) :- warm(X,Y).

wg([], []).
wg([X|XS], [X|YS]) :- wg(XS, YS), X = warm(goat, _).
wg([_|XS], YS) :- wg(XS, YS).