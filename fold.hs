myfoldl f z xs = foldr step id xs z
                 where step x g a = g (f a x)
                       