## Robot Simulator

A command line program to track robot movements on a grid according to a predefined set of rules.  

```
bundle install
ruby lib/application.rb     # runs command line app
rspec spec                  # runs tests
```

-	There are 4 components to the design – a user interface; a simulator to process user instructions; robots that attempt to execute the required movement; and an environment to manage external constraints.
-	The code currently lacks input validations – this would be a next step as the required format of user input is very specific.


Input should be as follows:
```
5 3
1 1 E
RFRFRFRF

3 2 N
FRRFLLFFRRFLL

0 3 W
LLFFFLFLFL
```

Output:
```
1 1 E
3 3 N LOST
2 3 S
```
