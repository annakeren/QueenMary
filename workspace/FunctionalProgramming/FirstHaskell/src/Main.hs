module Main where

--lecture 2, exercise 3, done
localNumber=(0747) 8293203

let matchCharacterToDrop c=  not (c=='(' || c==')'  || c== ' ') 

filter matchCharacterToDrop ukNumber
--lecture 2, exercise 4
card = "name:Anna;address:NW11;phonenumber:07478234567"
let getNameFromCard theCard = takeWhile notcolon (drop 5 theCard) where notcolon c=not(c==';')
*Main> getNameFromCard card "Anna"
*Main> let hasYourName theCard name= (getNameFromCard theCard)==name 
*Main> hasYourName card "Anna"
True
*Main> hasYourName card "danna"
False


*Main> let getPhoneFromCard theCard = takeWhile notcolon (reverse (take 11 (reverse theCard))) where notcolon c=not(c==';')
*Main> 
*Main> 
*Main> 
*Main> getPhoneFromCard card
"07478234567"



let lookup hasYourName theCard s|hasYourName theCard s==True=getPhoneFromCard theCard|otherwise ="no such name"
main::IO()
---why lookup card "Anna"
--<interactive>:607:8:
--    Couldn't match expected type ‘[Char] -> t -> Bool’
--                with actual type ‘[Char]’
--    Relevant bindings include
--      it :: t -> [Char] (bound at <interactive>:607:1)
--    In the first argument of ‘lookup’, namely ‘card’
--    In the expression: lookup card "Anna"


 let lookupIf theCard s = if (hasYourName theCard s)== True then getPhoneFromCard theCard else "no such name"
*Main> 
*Main> 
*Main> 
*Main> lookupIf card "Anna"
"07478234567"

main = undefined