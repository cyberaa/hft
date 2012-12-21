welcome to hft!
===============

HFT is a small project with a big ambition. We aim to build the worlds fastest algorithmic trading platform using the best off-the-shelf open source technology stack we can find.

Even better, we are aiming for an overall design that is minimal, simple and robust.  Ultimately, we would like the high-frequency community, whether serious professional or keen amateur enthusiast to look towards hft as the backbone of their next project.


# technology stack #

The planned tech stack is along the following lines:

## Broker and Data interface ##

### Interactive Brokers ###

Interactive Brokers consolidates tick data into 0.3 second time slices so it isn't appropriate for low-latency work.  The big advantage though is the dummy account that will enable anyone to pick up the project and have an end-to-end example out of the box.

### IBrokers API ###

IBroker works out the box.

### algo research ###

R is fast enough to start the algo R&D process and has the most comprehensive hooks into the range of possible directions the project could take.


## data storage and management ##

RHadoop via R package

http://www.activequant.org


## cep ##

### disruptor ###

https://github.com/odeheurles/Disruptor-net
http://disruptor.googlecode.com/files/Disruptor-1.0.pdf

The disrupture is a quality open-source project with a committment to low-latency.

https://github.com/Neverlord/libcppa


### messaging ###

Google Protocol Buffer example:
http://activequant.org/svn/aq2o/trunk/base/src/main/proto/messages.proto

Protocol Buffers: http://code.google.com/p/protobuf-net/ 
+1 for speed

FAST: https://code.google.com/p/quickfast/ 
+1 for speed

http://triceps.sourceforge.net
http://code.google.com/p/cep-trader/
http://kenai.com/downloads/javafx-sam/EventProcessinginAction.pdf
http://esper.codehaus.org
http://lmax-exchange.github.com/disruptor/
http://martinfowler.com/articles/lmax.html
http://www.activequant.org
    
# other platforms #

http://algo-trader.googlecode.com
http://code.google.com/p/tradelink/

## academic notes ##

### sornette ###

http://arxiv.org/find/all/1/all:+sornette/0/1/0/all/0/1

some specific articles

http://arxiv.org/pdf/cond-mat/0301543.pdf
http://arxiv.org/pdf/1108.0077.pdf
http://arxiv.org/ftp/arxiv/papers/1012/1012.4118.pdf
http://arxiv.org/pdf/1011.2882.pdf
http://arxiv.org/pdf/1007.2420.pdf
http://arxiv.org/pdf/0909.1007.pdf
http://arxiv.org/ftp/arxiv/papers/0812/0812.2449.pdf
http://www.er.ethz.ch/people/sornette


ln[E[p(t)]] = a + b (tc -t)^m  b<0 0<m<1

log periodic power law (LPPL) model (Sornette,
2003a,b; Zhou, 2007).

ln[p(t)] = A + Bx^m + Cx^m cos(w ln x + )
where x = tc−t measures the time to the critical time tc. For 0 < m < 1 and B < 0 (or m ≤ 0 and B > 0

practical paper

http://arxiv.org/pdf/0909.1007.pdf  

p5 gives an optimisation approach

Taboo search + levenberg-marquardt

### Artificial Stock Market ###

http://artstkmkt.sourceforge.net/

# other open source projects to watch #

https://github.com/penberg/libtrading
https://github.com/dakka/fix8
http://fix8.org
http://tradexoft.wordpress.com/

# articles #

http://www.aurorasolutions.org/over-6-million-transactions-per-second-in-a-real-time-system-an-out-of-the-box-approach/
http://programmers.stackexchange.com/questions/121592/what-to-look-for-in-selecting-a-language-for-algorithmic-high-frequency-trading
http://stackoverflow.com/questions/731233/activemq-or-rabbitmq-or-zeromq-or
http://wiki.msgpack.org/pages/viewpage.action?pageId=1081387




