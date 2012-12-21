algo steps
==========



step 1: boiler-plate 

Most common technical analysis in the world: extracting a signal using short-run and long-run moving average of price:

n.short = 100000
n.long = 1000000
signal = sum(old.data.stream[1::n.long]) / n.long - sum(old.data.stream[1::n.short]) / n.short

step 2:

Both the long and the short ma are calculated on the old.data.stream and are just different weighting schemes.

weight = matrix(1/n.long, 1, n.long) - matrix (1/n.short,1,n.short)
signal = sum(weight * old.data.stream[1::nlong])

step 3:

The weighting scheme:
- can be much more general than restricted to two simple moving averages
- can represent a large subset of technical trading rules
- artificially weights data that is one million ticks old the same as the last tick.

So,

better.weighting.scheme = prior.smooth.curve.declining.to.zero
optimise(better.weighting.scheme)
signal = sum(better.weighting.scheme * old.data.stream[1::n.long])

step 4:

convert the signal to a vector method involving old values of itself (this is a tricky bit)

signal[0] = some.function(tricky.weighting.scheme, signal[1:nlong], old.data.stream[1:n.long])

Remember that old signal values are also just weighted sums of old.data.stream, so working out the tricky.weighting.scheme is pretty much just tricky diff algebra.

It also means that some.function looks pretty similar to just a sum (but there might be some non-linearity there)

step 5:

Find that the importance of older old.data.stream values decays very quickly once you start to use past signal values.  So quickly, in fact, that old.data.stream[3] (say) has a fairly low weight even!  The importance of signal[1:n.long] decays less quickly.

So the signal calculation becomes:

signal[0] = sum(tricky.weighting.scheme, signal[1:n.not.so.long], old.data.stream[1:3])

step 6:

Iterate steps 3,4 & 5 on the *signal* (which is itself now an algerbaic iteration of a weighting scheme), each time coming up with a new weighting scheme that reduces the dependence on old data.

The new weighting scheme can also be thought of as a new signal.

tricky.weights[0]=tricky.weighting.scheme
signals[0] = signal
for (x1=1:20)
   tricky.weights[x1] = optimise(minimise(n.not.so.long), signals[0:(x1-1)],tricky.weights[0:(x1-1)])
   signals[x1] = some.function(signals, tricky.weights)
end for

Now step 6 is the very tricky bit I havent fully thought through.  I doubt a c loop will work for example.  And I'm probably trying to reinvent something that already exists, like a principle component method or something.  But what I think this process converges to is this:

signals[0] = some.linear.function(signals[1], old.data.stream[0])

=> signals = funk(signals, linear.signal.functions, data.stream)

Finally,

There are a few other narratives which support this:

The end result looks very neat from a mathematical and computational point-of-view.  This is the way the world is supposed to look, with an event stream, an information state (the signals) and an algorithm that relates event to change in state.

Having done all the tricky math, it's easy to relate the original algorithm to the final result.  In the original method:
- there are 1,000,001 signals: 1,000,000 being the last one million prices and 1 being the calculated signal.
- there is 1 linear.function, the dual ma crossover.
Or you could think about it as 3 signals (long ma, short ma and the difference) in addition to the old.data.

The whole exercise could be thought of a combined compression and optimisation computation.  Some parts of the story are simply about compressing the market data so it can compactly sit on the event stream.  The algorithm needs to be transformed given it needs to operate on compressed data but it should spit out about the same answer (or there will be a speed - accuracy tradeoff).  But some parts of the story are about looking at the algorithm in the light of getting it on the stream and thinking about how to do it better.


I would like to try putting algorithms in the event stream as part of an actor framework. I need to more rigorously define what I mean by this. One way to describe it is that algorithm actors in the stream (functions/transforms/state-variables) cant use stream history to recompute themselves. They can only use other actors in the stream. 

As an example, consider a moving average. Most algorithms recalculate every time so they look at the last million or so ticks (data events) every time they update themselves. Some might be smart enough to add the latest data and drop off old values. But a true streaming algorithm doesnt have to remember old values and can use an exponential decay method to keep track of the moving average. Thus the moving average algorithm becomes a state variable in the stream. And it also goes from being a summation of a million values to being a few bit shifts ;) 
