# git-trophy

A project to give out trophies on projects, as well as allow users to receive achievements such as the coveted quadruple revert

All award type should be tracked at the world level, project level, and the user leve.

# Run locally

`bundle exec rake run`

# Award types:

## Trophy

Weekly trophy, shows the standing for the current week. At the end of each week the winner is awarded the trophy and gets there name 'on the trophy' in the so people can see past winners

### Trophy List
* :trophy: __Developer of the Week__: You have been busy this week, write more lines of code than any other developers.
* :sailboat: __Sailor Talk__: Work professional what's that, use a swear in a commit.
* :coffee: __Night Owl__: Who need sleep when you have coffee? make a commit after 3 AM.
* :pencil: __Me fail engish that's umpossible__: You don't need a degree in English to write code, make a spelling error in a commit message.
* :santa: __Xmas Hacker__: The best present is a new feature, make a commit on Christmas day.
* :clipboard: __King of Clipboard__: Who needs to write new code when there are so many good examples in the codebase, copy and paste some code.
* :blue_book: __Long Winded__: Good code requires good explanations, write a commit message with more than 500 words.
* :hocho: __I hate whitespace__: Deleting whitespace has lots of benefits like, um, I'll get back to you, make a commit that changes nothing but whitespace.
* :interrobang: __Quadruple Revert__: code fears your fickle nature, revert a commit four times.
* :beginner: __I'm new here__: Its your first day, or maybe not, make a commit to the repo.

## Achievements

This would be something like the triple revert achievement when you have a commit that includes 3 reverts, or the coveted quadruple revert

## Leaderboard

Track lifetime leadboard on things like LOC added, deleted, total LOC change (added and deleted combined), etc

## Ratio Tracking

grep commits for fix, WTF, curse words, etc... we can show the % of commits that contain WTF, curses, fix, ship-it, etc showing the highest of each category for the projects


## Similar projects

* [WTF by programming language](http://www.codeodor.com/index.cfm/2011/8/11/wtfs-by-programming-language-repository-on-github/3395)
* [Git Achievements](https://github.com/icefox/git-achievements)
