- Applicative nằm trong module Control.Applicative
- Có 2 phương thức: pure, <*>

<pre>
class (Functor f) => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
</pre>