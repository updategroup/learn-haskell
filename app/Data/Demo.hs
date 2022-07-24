module Data.Demo where

data Shape = Circle Float Float Float | Rectangle Float Float Float Float 
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^2 