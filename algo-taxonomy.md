# algorithm design #

This is a summary of algorithm classification that will eventually become coding specifications.

The lists below are examples of categories and not meant to be exhaustive.

## data-set choice ##

### Price Endogenous ###

Algorithms that are endogenous to price

- moment-based calculations
  - moving average
  - GARCH
  - volatility
  - momentum
- technical analytics

### Market Structure Endogenous ###

Algorithms that are endogenous to Price and market components closely related to a single security such as:
- volume
- bid/ask
- market depth, order book

### Statistical Arbitrage ###

Algorithms that look to exploit near-arbitrage bound relationships between securities. 
- VIX versus SP500 versus options
- cross-correlation or lead-lag relationships between securities


### Exogenous ###

Algorthims that seek to exploit relationships between price and factors external to the security market price information set.

- fundamentals
- twitter mentions
- earnings announcement/ event-based analytics

## time horizon choice ##


## algorithmic theoretica choice ##

- linear 
  - regression
- non-linear
  - NN
  - GA
- parameter fit 
  - local versus global minima
  - stationary versus non-stationary (versus semi-stationary)
- contrarian versus continuation (???)  

## trading choices ##

- leverage employed
- transactional cost importance
- entry and exit methodologies
- security selection
- P&L distribution choices (objective function)

