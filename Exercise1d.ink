/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR time = 0 //  0 Morning, 1 Noon, 2 Night
VAR fisher_cleanup = 0




-> seashore

== seashore ==
{time_manager(0)}
~fisher_cleanup = 0
You are sitting on the beach.

It is currently {time_manager(1)}

{time==1: There is a fisher here.}
+{time==1} [Talk to Fisher.] ->fisher
+ [Wait] -> seashore
+ [Go to bankline] ->bankline


==bankline==
{time_manager(0)}
You are now on the bankline. 

It is currently {time_manager(1)}

+[Wait] -> bankline
+[Go to seashore.] ->seashore
+{fishing_rod} [Fish] ->fish

==fish==
You try fishing...

{time==0 or time==1: You don't catch anything good... ->bankline}
{time==2: You catch a golden fish! It must be worth a million dollars! You're rich! Congratulations! ->END}
->DONE

==fisher==
{fisher_cleanup==0: You go up to the aged fisher. He smiles at you and gestures at a fishing rod nearby.}
~ fisher_cleanup = 1
+[Ask about fish] ->fish_talk
* [Take fishing rod] ->fishing_rod
+ [Go back] ->seashore

==fish_talk==
You ask the fisherman about any good fish... he says that the best fish can be caught by the bankline at night. ->fisher

==fishing_rod==
  You take the fishing rod... it would be hard to catch fish without one. ->fisher





== function time_manager(returnWord) ==

    {- returnWord==0:
        ~ time = time + 1
    }
    {
        - time > 2:
            ~ time = 0
    }    
    {    
        - time == 0 and returnWord==1:
            ~ return "Morning"
        
        - time == 1 and returnWord==1:
            ~ return "Noon"
        
        - time == 2 and returnWord==1:
            ~ return "Night"
    
    }
    
        
    ~ return time

